# PoC implementation plan

## Success criteria

In the Accessory Shop config menu:

- [ ] Extra option row(s) visible and selectable
- [ ] Scrollbar when row count exceeds the visible window
- [ ] At least one custom option value stored at a fixed address in the code cave
- [ ] Description text updates for the selected custom option (phase 2 — `0x003F4BD0`)

Sounds and other polish reuse vanilla code paths.

## Steps

| Step | Task | Artifact |
|------|------|----------|
| 0 | Project scaffold + build pipeline | `scripts/build_pnach.py`, empty `asm/main.s` |
| 1 | Ghidra export: vanilla config **options** handler | `reference/config_options_handler.txt` |
| 2 | Ghidra export: Stock / Gummi scrollbar helpers | `reference/stock_scrollbar.txt`, etc. |
| 3 | Minimal hook: jump to cave, call original, return | `asm/main.s`, first working `.pnach` |
| 4 | Add extra rows + cursor bounds | `asm/options_handler.s` |
| 5 | Port scrollbar logic from reference menus | `asm/scrollbar.s` |
| 6 | Wire custom option value read/write | scratch equates in `kh1_addresses.inc` |
| 7 | Hook descriptions handler | `asm/descriptions_handler.s` |

## Out of scope (PoC)

- Room gating / stability outside Accessory Shop
- Save file persistence for custom options
- Top-level config menu changes (`0x003F4CC0`)
