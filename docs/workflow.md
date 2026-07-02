# Development workflow

## Overview

```
Ghidra (reverse) → reference/*.txt + asm/*.s (write/port) → build_pnach.py → patches/BD3FB233_*.pnach → PCSX2 test
```

## Phase 1 — Options menu only

1. Export vanilla **config options** handler from Ghidra (`0x003F4C90` → target function).
2. Export **Stock** and **Gummi Items** scrollbar-related functions as references.
3. Write custom handler in `asm/` (start from vanilla behavior, add rows + scrollbar + one tunable option).
4. Run `python scripts/build_pnach.py` to assemble and emit the `.pnach`.
5. Load into PCSX2 cheats folder, test in Accessory Shop.
6. Add descriptions hook (`0x003F4BD0`) once options selection works.



## Exporting assembly from Ghidra

Pick one format and stay consistent. Recommended order:

### Option A — Copy listing (fastest)

1. Open the function in the **Listing** window.
2. Select from the function entry through `jr ra` (or end of basic block chain).
3. Copy (`Ctrl+C`) and paste into `reference/<name>.txt`.

Ghidra pastes address + bytes + mnemonic, for example:

```
003a1234: 27bdfff0  addiu sp,sp,-0x10
003a1238: afbf000c  sw    ra,0xc(sp)
```

That is enough for us to rewrite into `asm/` with labels and comments.

### Option B — Create a Ghidra `.s` fragment (best for large functions)

1. **Window → Bytes** or use a script to dump the function byte range.
2. Or use **File → Export Program → Format: Intel Hex / Binary** for a single function range (set export selection in Memory Map).

For hand porting, Option A is usually faster than fighting export formats.

### Option C — Ghidra script (repeatable)

Community scripts such as “ExportFunctionAssembly” dump selected functions to `.s`-like text. If you install one:

1. Select function(s) in the Symbol Tree.
2. Run the script → save output to `reference/<name>.txt`.

We can add a project script later if you export often.

### What to include when sharing a function

At the top of each reference file:

```
# Function: config_options_update
# Handler pointer at: 0x003F4C90
# Function address: 0x00XXXXXX
# Notes: called every frame while config options visible
```

Also note which registers hold menu state, cursor index, and row count if you have already identified them.

## Assembly conventions (`asm/`)

- EE MIPS III / R5900, **big-endian**.
- Use `.set noreorder` and explicit delay-slot `nop` where needed.
- Addresses and equates live in `asm/include/kh1_addresses.inc`.
- One logical unit per file (e.g. `options_handler.s`, `scrollbar.s`).
- `main.s` includes the others and defines the cave entry point.



## Converting a Ghidra listing to editable assembly

Use `scripts/ghidra_listing_to_asm.py` when you have a Ghidra text listing with
address/byte/mnemonic rows and want a relocatable `.s` file for the code cave.
The script reads the bytes from the listing, disassembles them with
`ee-objdump`, rewrites internal branches/jumps to local labels, and optionally
replaces vanilla jump-table loads with cave-local `.word` tables.

Config options handler example:

```powershell
python scripts\ghidra_listing_to_asm.py `
  reference\config_options_handler.txt `
  asm\options_handler_vanilla_port.s `
  --start 0x00219F98 `
  --end 0x0021AC34 `
  --symbol custom_config_options_handler `
  --switch-table 0x0021A02C:0x0021A038:config_options_confirm_switch_table:0x0021A040,0x0021A150,0x0021A250,0x0021A380,0x0021A380,0x0021A3F8,0x0021A450,0x0021A460 `
  --label 0x0021A008=L_input_confirm_check `
  --label 0x0021A040=L_confirm_case_0_camera `
  --label 0x0021A150=L_confirm_case_1 `
  --label 0x0021A250=L_confirm_case_2 `
  --label 0x0021A380=L_confirm_case_3_4_toggle_value `
  --label 0x0021A3F8=L_confirm_case_5_sound `
  --label 0x0021A450=L_confirm_case_6_error `
  --label 0x0021A460=L_confirm_case_7_accept_close `
  --label 0x0021A498=L_no_confirm_update_lr `
  --label 0x0021A628=L_invalid_handle `
  --label 0x0021A62C=L_setup_render_state `
  --label 0x0021A630=L_render_rows `
  --label 0x0021AC08=L_epilogue
```



## Building PNACH patches



### Prerequisites

Install a PS2-capable MIPS assembler. **PS2DEV** (`ee-as`, `ee-ld`, `ee-objcopy`) is the usual choice:

- [https://github.com/ps2dev/ps2dev](https://github.com/ps2dev/ps2dev)
- On Windows: MSYS2 or WSL install of ps2dev toolchain.

The build script searches `PATH` for `ee-as` or `mips64-elf-as`.

### Build

```powershell
python scripts/build_pnach.py
```

Outputs:

- `build/code_cave.bin` — raw machine code
- `build/code_cave.hex` — human-readable word dump
- `patches/BD3FB233_custom_config_menu.pnach` — PCSX2 patch file



### PNACH encoding notes

- **Extended writes** encode size in the first hex digit of the address operand (`2` = 32-bit, `1` = 16-bit, `0` = 8-bit).
- `patch=0`: apply once at boot — used for writing the code cave payload.
- `patch=1`: apply at every vblank — used for the handler pointer hook if the game overwrites it.

Example hook (32-bit pointer at `0x003F4C90` → `0x01800000`):

```
patch=1,EE,203F4C90,extended,01800000
```



### Testing in PCSX2

1. Copy `patches/BD3FB233_custom_config_menu.pnach` to your PCSX2 cheats folder.
2. Filename must start with `BD3FB233` (or `SLPM-xxx_BD3FB233` on newer PCSX2).
3. Enable cheats for the game → load save / boot into Accessory Shop → open config menu.
4. **Tools → Reload Cheats/Patches** after rebuilding.



### Fallback without assembler

If the toolchain is not installed yet, you can still test PNACH generation:

1. Place a raw binary at `build/code_cave.bin`.
2. Run `python scripts/build_pnach.py --bin build/code_cave.bin`.



## Debugging tips

- Compare `build/code_cave.hex` against Ghidra bytes at the same offsets.
- If the hook fires but the game crashes, check register save/restore and delay slots.
- If the menu is vanilla, verify the pointer at `0x003F4C90` in Cheat Engine (eemem base) or a debugger.

