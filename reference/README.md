# Ghidra reference dumps

Place exported disassembly here before porting to `asm/`.

Suggested files for phase 1:


| File                         | Source                                       |
| ---------------------------- | -------------------------------------------- |
| `config_options_handler.txt` | Function pointed to by `0x003F4C90`          |
| `config_options_struct.txt`  | Optional: fields after the handler pointer   |
| `items_stock_handler.txt`    | Items menu stock option with scrollbar logic |
| `items_gummi_handler.txt`    | Items menu gummi option with scrollbar logic |


Use the header format described in `docs/workflow.md`.