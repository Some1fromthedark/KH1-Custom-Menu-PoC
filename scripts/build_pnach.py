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
DEFAULT_HOOK = 0x003F4C90
DEFAULT_CAVE = 0x01800000
DEFAULT_ENTRY = 0x01800000  # cave_entry at CODE_CAVE_BASE


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


def assemble(asm_path: Path, cave_base: int) -> bytes:
    as_bin = find_assembler()
    ld_bin = find_linker()
    objcopy_bin = find_objcopy()

    if not as_bin:
        raise RuntimeError(
            "No MIPS assembler found (ee-as / mips64-elf-as). "
            "Install PS2DEV or pass --bin with a prebuilt binary. "
            "See docs/workflow.md."
        )

    BUILD_DIR.mkdir(parents=True, exist_ok=True)
    obj_path = BUILD_DIR / "code_cave.o"
    elf_path = BUILD_DIR / "code_cave.elf"
    bin_path = BUILD_DIR / "code_cave.bin"

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
        word = struct.unpack(">I", chunk)[0]
        lines.append(f"{base + offset:08X}: {word:08X}\n")
    out_path.write_text("".join(lines), encoding="utf-8")


def emit_pnach(
    data: bytes,
    cave_base: int,
    hook_addr: int,
    entry_addr: int,
    out_path: Path,
) -> None:
    lines: list[str] = [
        f"gametitle={GAME_TITLE}\n",
        "\n",
        "[KH1 Custom Config Menu PoC]\n",
        "author=KH1-Custom-Menu-Poc\n",
        "description=Hook config options menu handler; custom rows + scrollbar PoC\n",
        "\n",
        "// --- Hook: redirect options menu handler pointer ---\n",
        f"patch=2,EE,{encode_extended_addr(hook_addr, 4)},extended,{entry_addr:08X}\n",
        "\n",
        "// --- Code cave payload (boot-time write) ---\n",
    ]

    for offset in range(0, len(data), 4):
        chunk = data[offset : offset + 4]
        while len(chunk) < 4:
            chunk += b"\x00"
        word = struct.unpack(">I", chunk)[0]
        addr = cave_base + offset
        lines.append(
            f"patch=0,EE,{encode_extended_addr(addr, 4)},extended,{word:08X}\n"
        )

    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text("".join(lines), encoding="utf-8")


def main() -> int:
    parser = argparse.ArgumentParser(description="Build BD3FB233 PNACH from EE assembly.")
    parser.add_argument("--asm", type=Path, default=DEFAULT_ASM, help="Main assembly source")
    parser.add_argument("--bin", type=Path, help="Use prebuilt binary instead of assembling")
    parser.add_argument("--cave-base", type=lambda s: int(s, 0), default=DEFAULT_CAVE)
    parser.add_argument("--hook-addr", type=lambda s: int(s, 0), default=DEFAULT_HOOK)
    parser.add_argument("--entry-addr", type=lambda s: int(s, 0), default=DEFAULT_ENTRY)
    parser.add_argument(
        "--output",
        type=Path,
        default=PATCHES_DIR / f"{GAME_CRC}_custom_config_menu.pnach",
    )
    args = parser.parse_args()

    if args.bin:
        data = args.bin.read_bytes()
    else:
        if not args.asm.is_file():
            print(f"Assembly file not found: {args.asm}", file=sys.stderr)
            return 1
        data = assemble(args.asm, args.cave_base)

    BUILD_DIR.mkdir(parents=True, exist_ok=True)
    bin_out = BUILD_DIR / "code_cave.bin"
    bin_out.write_bytes(data)
    write_hex_dump(data, args.cave_base, BUILD_DIR / "code_cave.hex")
    emit_pnach(data, args.cave_base, args.hook_addr, args.entry_addr, args.output)

    print(f"Wrote {len(data)} bytes -> {bin_out}")
    print(f"Hex dump -> {BUILD_DIR / 'code_cave.hex'}")
    print(f"PNACH -> {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
