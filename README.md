# KH1FM Custom Config Menu — Proof of Concept

Modify **Kingdom Hearts Final Mix** (PS2, PCSX2) config menu options via PNACH patches: hook the options menu handler, run custom MIPS code from a code cave, add rows, scrollbar, and custom option values.

**Game CRC:** `BD3FB233` (English Patched ISO)

## Project layout

```
asm/           MIPS source (human-editable)
  include/     Address equates and scratch layout
docs/          Addresses, workflow, implementation plan
reference/     Ghidra listing exports (vanilla + Stock/Gummi references)
scripts/       build_pnach.py — assemble → .pnach
patches/       Generated PCSX2 patch files
build/         Generated binaries and hex dumps (gitignored)
```

## Quick start

1. Install a PS2 MIPS toolchain ([PS2DEV](https://github.com/ps2dev/ps2dev)) so `ee-as` is on `PATH`.
2. Build the patch:

   ```powershell
   python scripts/build_pnach.py
   ```

3. Copy `patches/BD3FB233_custom_config_menu.pnach` to your PCSX2 cheats folder and enable cheats.

See [docs/workflow.md](docs/workflow.md) for Ghidra export tips and [docs/plan.md](docs/plan.md) for implementation phases.

## Current status

Scaffold only — placeholder infinite loop at `0x01800000` to verify the hook. Next step: share Ghidra export for the vanilla config **options** handler (`0x003F4C90`).
