#!/usr/bin/env python3
"""
Assemble asm/main.s (EE MIPS) and emit a PCSX2 .pnach patch file.

Usage:
  python scripts/build_pnach.py
  python scripts/build_pnach.py --bin build/code_cave.bin
  python scripts/build_pnach.py --asm asm/main.s --hook-addr 0x003F4C90
"""

from __future__ import annotations

import argparse
import json
import re
import shutil
import struct
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BUILD_DIR = ROOT / "build"
PATCHES_DIR = ROOT / "patches"

GAME_CRC = "BD3FB233"
GAME_TITLE = "Kingdom Hearts Final Mix [English Patched] (BD3FB233)"
DEFAULT_ASM = ROOT / "asm" / "main.s"
DEFAULT_CONFIG = ROOT / "configs" / "empty-config.json"
DEFAULT_CAVE = 0x01800000

obj_path = BUILD_DIR / "code_cave.o"
elf_path = BUILD_DIR / "code_cave.elf"
bin_path = BUILD_DIR / "code_cave.bin"
hex_path = BUILD_DIR / "code_cave.hex"

def find_assembler() -> list[str] | None:
    for candidate in ("ee-as", "mips64-elf-as", "mips-linux-gnu-as", "mipsel-linux-gnu-as"):
        if shutil.which(candidate):
            return [candidate]
    return None


def find_linker() -> str | None:
    for candidate in ("ee-ld", "mips64-elf-ld", "mips-linux-gnu-ld"):
        if shutil.which(candidate):
            return candidate
    return None


def find_objcopy() -> str | None:
    for candidate in ("ee-objcopy", "mips64-elf-objcopy", "mips-linux-gnu-objcopy"):
        if shutil.which(candidate):
            return candidate
    return None


def find_obj_dump() -> str | None:
    for candidate in ("ee-objdump", "mips64-elf-objdump", "mips-linux-gnu-objdump"):
        if shutil.which(candidate):
            return candidate
    return None


def assemble(asm_path: Path, cave_base: int) -> bytes:
    as_bin = find_assembler()
    ld_bin = find_linker()
    objcopy_bin = find_objcopy()
    objdump_bin = find_obj_dump()
    
    if not as_bin:
        raise RuntimeError(
            "No MIPS assembler found (ee-as / mips64-elf-as). "
            "Install PS2DEV or pass --bin with a prebuilt binary. "
            "See docs/workflow.md."
        )

    BUILD_DIR.mkdir(parents=True, exist_ok=True)

    as_flags = ["-O0", "-G0", "-march=r5900", "-mabi=32", "-o", str(obj_path), str(asm_path)]
    # Some toolchains use -march=mips3 instead of r5900
    try:
        subprocess.run([*as_bin, *as_flags], check=True, capture_output=True, text=True)
    except subprocess.CalledProcessError:
        as_flags[3] = "-march=mips3"
        result = subprocess.run([*as_bin, *as_flags], capture_output=True, text=True)
        if result.returncode != 0:
            sys.stderr.write(result.stdout)
            sys.stderr.write(result.stderr)
            raise RuntimeError(f"Assembly failed: {asm_path}")

    if ld_bin and objcopy_bin:
        ld_script = BUILD_DIR / "cave.ld"
        ld_script.write_text(
            f"SECTIONS {{\n  . = 0x{cave_base:08X};\n  .text : {{ *(.text*) }}\n  .data : {{ *(.data*) }}\n  .bss  : {{ *(.bss*) }}\n}}\n",
            encoding="utf-8",
        )
        subprocess.run(
            [ld_bin, "-T", str(ld_script), "-o", str(elf_path), str(obj_path)],
            check=True,
            capture_output=True,
            text=True,
        )
        subprocess.run(
            [objcopy_bin, "-O", "binary", str(elf_path), str(bin_path)],
            check=True,
            capture_output=True,
            text=True,
        )
        return bin_path.read_bytes()

    # No linker: try objcopy -O binary on .o (may not work for all toolchains)
    if objcopy_bin:
        subprocess.run(
            [objcopy_bin, "-O", "binary", str(obj_path), str(bin_path)],
            check=True,
            capture_output=True,
            text=True,
        )
        return bin_path.read_bytes()

    raise RuntimeError("Assembler found but no linker/objcopy for binary extraction.")


def encode_extended_addr(address: int, width_bytes: int) -> str:
    """PS2RD extended format: leading digit encodes write width."""
    prefix = {1: "0", 2: "1", 4: "2"}[width_bytes]
    body = f"{address:07X}"[-7:]
    return prefix + body


def write_hex_dump(data: bytes, base: int, out_path: Path) -> None:
    lines = [f"# Code cave dump @ 0x{base:08X}\n"]
    for offset in range(0, len(data), 4):
        chunk = data[offset : offset + 4]
        while len(chunk) < 4:
            chunk += b"\x00"
        word = struct.unpack("<I", chunk)[0]
        lines.append(f"{base + offset:08X}: {word:08X}\n")
    out_path.write_text("".join(lines), encoding="utf-8")


def emit_pnach(
    data: bytes,
    cave_base: int,
    hooks: list[tuple[int, int]],
    out_path: Path,
) -> None:
    lines = [
        f"gametitle={GAME_TITLE}\n",
        "\n",
        "[KH1 Custom Config Menu]\n",
        "\n",
        "// --- Hooks ---\n",
    ]
    
    for hook_addr, entry_addr in hooks:
        lines.append(
            f"patch=0,EE,{encode_extended_addr(hook_addr,4)},extended,{entry_addr:08X}\n"
        )
    
    lines.append("\n")
    lines.append("// --- Code cave payload ---\n")

    for offset in range(0, len(data), 4):
        chunk = data[offset : offset + 4]
        while len(chunk) < 4:
            chunk += b"\x00"
        word = struct.unpack("<I", chunk)[0]
        addr = cave_base + offset
        lines.append(
            f"patch=1,EE,{encode_extended_addr(addr, 4)},extended,{word:08X}\n"
        )

    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text("".join(lines), encoding="utf-8")


def extract_symbols(elf_path: Path) -> dict[str, int]:
    objdump = find_obj_dump()

    if not objdump:
        raise RuntimeError("Could not locate ee-objdump.")

    result = subprocess.run(
        [objdump, "-t", str(elf_path)],
        capture_output=True,
        text=True,
        check=True,
    )

    symbols = {}

    pattern = re.compile(
        r"^([0-9A-Fa-f]{8})\s+g\s+.*?\s+(\S+)$"
    )

    for line in result.stdout.splitlines():
        match = pattern.match(line.strip())

        if not match:
            continue

        address = int(match.group(1), 16)
        name = match.group(2)

        symbols[name] = address

    return symbols


def load_config(path: Path) -> dict:
    return json.loads(path.read_text())
 
 
def load_hooks(config_data) -> list[tuple[int, str]]:
    hooks = []

    for hook in config_data.get("hooks", []):
        hooks.append(
            (
                int(hook["address"], 0),
                hook["symbol"],
            )
        )

    return hooks


def main() -> int:
    parser = argparse.ArgumentParser(description="Build BD3FB233 PNACH from EE assembly.")
    parser.add_argument("--asm", type=Path, default=DEFAULT_ASM, help="Main assembly source")
    parser.add_argument("--bin", type=Path, help="Use prebuilt binary instead of assembling")
    parser.add_argument(
        "--config",
        type=Path,
        default=DEFAULT_CONFIG,
        help="JSON configuration"
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=PATCHES_DIR / f"{GAME_CRC}_custom_config_menu.pnach",
    )
    args = parser.parse_args()
    
    config_data = load_config(args.config)
    cave_base = config_data.get("code_cave_address", DEFAULT_CAVE)
    if type(cave_base) == str:
        cave_base = int(cave_base, 0)

    if args.bin:
        data = args.bin.read_bytes()
    else:
        if not args.asm.is_file():
            print(f"Assembly file not found: {args.asm}", file=sys.stderr)
            return 1
        data = assemble(args.asm, cave_base)

    BUILD_DIR.mkdir(parents=True, exist_ok=True)
    bin_path.write_bytes(data)

    print(f"Wrote {len(data)} bytes -> {bin_path}")
    
    write_hex_dump(data, cave_base, hex_path)

    print(f"Hex dump -> {hex_path}")
    
    symbols = extract_symbols(elf_path)
    configured_hooks = load_hooks(config_data)
    
    resolved_hooks = []
    
    for hook_addr, symbol_name in configured_hooks:
        if symbol_name not in symbols:
            raise RuntimeError(
                f"Symbol `{symbol_name}` not found in ELF."
            )
        
        resolved_hooks.append(
            (
                hook_addr,
                symbols[symbol_name],
            )
        )
    
    emit_pnach(data, cave_base, resolved_hooks, args.output)

    print(f"PNACH -> {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
