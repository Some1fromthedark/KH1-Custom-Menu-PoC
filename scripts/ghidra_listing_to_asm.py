#!/usr/bin/env python3
"""
Convert a Ghidra listing export into editable EE GAS assembly.

The converter uses the instruction bytes from the Ghidra listing as the source
of truth, disassembles them with ee-objdump, and then rewrites internal control
flow targets as local labels so the function can relocate into a code cave.

Example for the vanilla config options handler:

  python scripts/ghidra_listing_to_asm.py ^
    reference/config_options_handler.txt ^
    asm/options_handler_vanilla_port.s ^
    --start 0x00219F98 ^
    --end 0x0021AC34 ^
    --symbol custom_config_options_handler ^
    --switch-table 0x0021A02C:0x0021A038:config_options_confirm_switch_table:0x0021A040,0x0021A150,0x0021A250,0x0021A380,0x0021A380,0x0021A3F8,0x0021A450,0x0021A460 ^
    --label 0x0021A008=L_input_confirm_check ^
    --label 0x0021A040=L_confirm_case_0_camera ^
    --label 0x0021A150=L_confirm_case_1 ^
    --label 0x0021A250=L_confirm_case_2 ^
    --label 0x0021A380=L_confirm_case_3_4_toggle_value ^
    --label 0x0021A3F8=L_confirm_case_5_sound ^
    --label 0x0021A450=L_confirm_case_6_error ^
    --label 0x0021A460=L_confirm_case_7_accept_close ^
    --label 0x0021A498=L_no_confirm_update_lr ^
    --label 0x0021A628=L_invalid_handle ^
    --label 0x0021A62C=L_setup_render_state ^
    --label 0x0021A630=L_render_rows ^
    --label 0x0021AC08=L_epilogue
"""

from __future__ import annotations

import argparse
import re
import shutil
import subprocess
import tempfile
from dataclasses import dataclass
from pathlib import Path


LISTING_RE = re.compile(r"^\s*([0-9a-fA-F]{8})\s+((?:[0-9a-fA-F]{2}\s+){1,4})\s")
OBJDUMP_RE = re.compile(r"^\s*([0-9a-fA-F]+):\s+([0-9a-fA-F]{8})\s+(.+?)\s*$")

BRANCH_OR_JUMP_OPS = {
    "b",
    "beq",
    "beql",
    "beqz",
    "beqzl",
    "bgez",
    "bgezal",
    "bgezall",
    "bgezl",
    "bgtz",
    "bgtzl",
    "blez",
    "blezl",
    "bltz",
    "bltzal",
    "bltzall",
    "bltzl",
    "bne",
    "bnel",
    "bnez",
    "bnezl",
    "j",
    "jal",
}

REGISTERS = [
    "zero",
    "at",
    "v0",
    "v1",
    "a0",
    "a1",
    "a2",
    "a3",
    "t0",
    "t1",
    "t2",
    "t3",
    "t4",
    "t5",
    "t6",
    "t7",
    "s0",
    "s1",
    "s2",
    "s3",
    "s4",
    "s5",
    "s6",
    "s7",
    "t8",
    "t9",
    "k0",
    "k1",
    "gp",
    "sp",
    "s8",
    "fp",
    "ra",
]
REGISTER_RE = re.compile(
    r"(?<![\w$])(" + "|".join(sorted(REGISTERS, key=len, reverse=True)) + r")(?![\w])"
)
REGISTER_ALIASES = {"s8": "fp"}


@dataclass(frozen=True)
class Instruction:
    address: int
    text: str


@dataclass(frozen=True)
class SwitchTable:
    load_start: int
    load_end: int
    name: str
    targets: list[int]

    @classmethod
    def parse(cls, spec: str) -> "SwitchTable":
        try:
            load_start, load_end, name, targets = spec.split(":", 3)
        except ValueError as exc:
            raise argparse.ArgumentTypeError(
                "expected START:END:NAME:TARGET,TARGET,..."
            ) from exc

        parsed_targets = [int(item, 0) for item in targets.split(",") if item]
        if not parsed_targets:
            raise argparse.ArgumentTypeError("switch table needs at least one target")

        return cls(
            load_start=int(load_start, 0),
            load_end=int(load_end, 0),
            name=name,
            targets=parsed_targets,
        )


def parse_int(value: str) -> int:
    return int(value, 0)


def parse_label(value: str) -> tuple[int, str]:
    try:
        address, name = value.split("=", 1)
    except ValueError as exc:
        raise argparse.ArgumentTypeError("expected ADDRESS=label_name") from exc
    return int(address, 0), name


def extract_bytes(listing_path: Path, start: int, end: int) -> bytes:
    data: dict[int, int] = {}
    for line in listing_path.read_text(errors="ignore").splitlines():
        match = LISTING_RE.match(line)
        if not match:
            continue
        address = int(match.group(1), 16)
        if not (start <= address < end):
            continue
        for offset, byte_text in enumerate(match.group(2).split()):
            data[address + offset] = int(byte_text, 16)

    if not data:
        raise RuntimeError(f"no instruction bytes found in {listing_path}")

    missing = [address for address in range(start, end) if address not in data]
    if missing:
        ranges = summarize_ranges(missing)
        raise RuntimeError(f"missing byte(s) in requested range: {ranges}")

    return bytes(data[address] for address in range(start, end))


def summarize_ranges(values: list[int]) -> str:
    ranges: list[str] = []
    start = prev = values[0]
    for value in values[1:]:
        if value == prev + 1:
            prev = value
            continue
        ranges.append(format_range(start, prev))
        start = prev = value
    ranges.append(format_range(start, prev))
    return ", ".join(ranges)


def format_range(start: int, end: int) -> str:
    if start == end:
        return f"0x{start:08X}"
    return f"0x{start:08X}-0x{end:08X}"


def disassemble(blob: bytes, start: int, objdump: str) -> list[Instruction]:
    with tempfile.NamedTemporaryFile(suffix=".bin", delete=False) as temp:
        temp.write(blob)
        temp_path = Path(temp.name)

    try:
        result = subprocess.run(
            [
                objdump,
                "-D",
                "-EL",
                "-b",
                "binary",
                "-m",
                "mips:5900",
                f"--adjust-vma=0x{start:08x}",
                str(temp_path),
            ],
            check=True,
            capture_output=True,
            text=True,
        )
    finally:
        temp_path.unlink(missing_ok=True)

    instructions: list[Instruction] = []
    for line in result.stdout.splitlines():
        match = OBJDUMP_RE.match(line)
        if not match:
            continue
        instructions.append(Instruction(int(match.group(1), 16), match.group(3).strip()))
    return instructions


def default_label(address: int) -> str:
    return f"L_{address:08X}"


def collect_labels(
    instructions: list[Instruction],
    start: int,
    end: int,
    symbol: str,
    named_labels: dict[int, str],
    switch_tables: list[SwitchTable],
) -> dict[int, str]:
    labels = {start: symbol, **named_labels}

    for instruction in instructions:
        op = instruction.text.split(None, 1)[0]
        if op not in BRANCH_OR_JUMP_OPS:
            continue
        for target in re.findall(r"0x([0-9a-fA-F]+)", instruction.text):
            address = int(target, 16)
            if start <= address < end:
                labels.setdefault(address, default_label(address))

    for table in switch_tables:
        for target in table.targets:
            if not (start <= target < end):
                raise RuntimeError(f"switch target outside function range: 0x{target:08X}")
            labels.setdefault(target, default_label(target))

    return labels


def dollarize_registers(text: str) -> str:
    parts = text.split(None, 1)
    if len(parts) == 1:
        return text

    def replace(match: re.Match[str]) -> str:
        name = REGISTER_ALIASES.get(match.group(1), match.group(1))
        return f"${name}"

    return parts[0] + "\t" + REGISTER_RE.sub(replace, parts[1])


def relocate_targets(text: str, labels: dict[int, str], start: int, end: int) -> str:
    op = text.split(None, 1)[0]
    if op not in BRANCH_OR_JUMP_OPS:
        return dollarize_registers(text)

    def replace(match: re.Match[str]) -> str:
        address = int(match.group(1), 16)
        if start <= address < end:
            return labels[address]
        return f"0x{address:x}"

    return dollarize_registers(re.sub(r"0x([0-9a-fA-F]+)", replace, text))


def switch_for_address(address: int, switch_tables: list[SwitchTable]) -> SwitchTable | None:
    for table in switch_tables:
        if table.load_start <= address < table.load_end:
            return table
    return None


def emit_asm(
    instructions: list[Instruction],
    output_path: Path,
    start: int,
    end: int,
    symbol: str,
    labels: dict[int, str],
    switch_tables: list[SwitchTable],
) -> None:
    lines = [
        "/*",
        " * Generated from a Ghidra listing export.",
        " *",
        f" * Source range: 0x{start:08X}-0x{end:08X}",
        " * Internal branches/jumps were relocated to local labels.",
        " */",
        "",
        "        .set noreorder",
        "        .set noat",
        "",
        f"        .globl {symbol}",
        "",
    ]

    emitted_switch_loads: set[str] = set()
    for instruction in instructions:
        table = switch_for_address(instruction.address, switch_tables)
        if table:
            if table.name not in emitted_switch_loads:
                lines.append(
                    f"        /* {instruction.address:08X}: local switch table address */"
                )
                lines.append(f"        lui     $v1,%hi({table.name})")
                lines.append(f"        addiu   $v1,$v1,%lo({table.name})")
                lines.append("        addu    $v1,$v1,$v0")
                lines.append("        lw      $v1,0($v1)")
                emitted_switch_loads.add(table.name)
            continue

        if instruction.address in labels:
            lines.append(f"{labels[instruction.address]}:")
        lines.append(
            f"        /* {instruction.address:08X} */ "
            f"{relocate_targets(instruction.text, labels, start, end)}"
        )

    for table in switch_tables:
        lines.extend(["", "        .align 2", f"{table.name}:"])
        for target in table.targets:
            lines.append(f"        .word   {labels[target]}")

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text("\n".join(lines) + "\n", encoding="ascii")


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Convert a Ghidra EE listing into relocatable GAS assembly."
    )
    parser.add_argument("listing", type=Path, help="Ghidra listing text export")
    parser.add_argument("output", type=Path, help="Output .s file")
    parser.add_argument("--start", type=parse_int, required=True, help="Function start address")
    parser.add_argument("--end", type=parse_int, required=True, help="Function end address")
    parser.add_argument("--symbol", required=True, help="Entry symbol name for the output")
    parser.add_argument(
        "--label",
        action="append",
        type=parse_label,
        default=[],
        help="Name an address label: ADDRESS=name. Can be repeated.",
    )
    parser.add_argument(
        "--switch-table",
        action="append",
        type=SwitchTable.parse,
        default=[],
        help="Replace an absolute jump-table load: START:END:NAME:TARGET,TARGET,...",
    )
    parser.add_argument(
        "--objdump",
        default=shutil.which("ee-objdump") or "ee-objdump",
        help="Objdump executable to use",
    )
    args = parser.parse_args()

    blob = extract_bytes(args.listing, args.start, args.end)
    instructions = disassemble(blob, args.start, args.objdump)
    labels = collect_labels(
        instructions,
        args.start,
        args.end,
        args.symbol,
        dict(args.label),
        args.switch_table,
    )
    emit_asm(
        instructions,
        args.output,
        args.start,
        args.end,
        args.symbol,
        labels,
        args.switch_table,
    )
    print(f"Wrote {len(instructions)} instructions -> {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
