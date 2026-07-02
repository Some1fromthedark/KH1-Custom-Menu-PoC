# Ghidra reference dumps

Place exported disassembly here before porting to `asm/`.

Suggested files for phase 1:

| File | Source |
|------|--------|
| `config_options_handler.txt` | Function pointed to by `0x003F4C90` |
| `config_options_struct.txt` | Optional: fields after the handler pointer |
| `stock_scrollbar.txt` | Stock menu scrollbar logic |
| `gummi_items_scrollbar.txt` | Gummi Items menu scrollbar logic |

Use the header format described in `docs/workflow.md`.
