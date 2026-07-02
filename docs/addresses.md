# KH1FM (English Patched) — Known Addresses

Game CRC (PCSX2): `BD3FB233`

All addresses are EE (Emotion Engine) unless noted otherwise.

## Menu dispatch structures

Each structure’s first four bytes are a pointer to the per-frame handler (input + rendering).

| Address    | Role                                      | PoC hook?        |
|------------|-------------------------------------------|------------------|
| `0x003F4CC0` | Top-level config menu (title + spawns parts) | No (leave vanilla) |
| `0x003F4C90` | Config options rows                       | **Yes — primary hook** |
| `0x003F4BD0` | Config option descriptions                | Later phase      |

## Code cave

| Address      | Role                                      |
|--------------|-------------------------------------------|
| `0x01800000` | Start of dynamic object buffer tail (Accessory Shop testing) |

Assume all EE RAM from `0x01800000` onward is available for code + scratch data unless we hit limits during development.

## Layout convention (code cave)

Suggested layout (adjust as assembly grows):

```
0x01800000  Entry / hook trampoline
0x01800100  Custom options handler (main logic)
0x01801000  Scrollbar / list helpers (ported from Stock/Gummi reference)
0x0180F000  Scratch data (cursor index, scroll offset, custom option values)
```

## Reference menus (vanilla)

Use these when porting scrollbar / long-list behavior:

- Stock menu
- Gummi Items menu

Place Ghidra exports under `reference/` (see `docs/workflow.md`).
