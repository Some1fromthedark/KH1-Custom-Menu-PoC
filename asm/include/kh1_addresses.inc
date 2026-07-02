/* KH1FM EE addresses and code-cave layout (English Patched, CRC BD3FB233) */

.set CODE_CAVE_BASE,      0x01800000

.set MENU_CONFIG_TOP,     0x003F4CC0   /* do not hook in PoC phase 1 */
.set MENU_CONFIG_OPTIONS, 0x003F4C90   /* hook: options rows handler ptr */
.set MENU_CONFIG_DESC,    0x003F4BD0   /* phase 2 */

/* Scratch / custom option storage (inside code cave) */
.set SCRATCH_BASE,        0x0180F000
.set SCRATCH_CURSOR,      (SCRATCH_BASE + 0x00)
.set SCRATCH_SCROLL,      (SCRATCH_BASE + 0x04)
.set SCRATCH_CUSTOM_OPT,  (SCRATCH_BASE + 0x08)

/* Code cave regions (offsets from CODE_CAVE_BASE) */
.set CAVE_ENTRY,          0x0000
.set CAVE_OPTIONS_HANDLER,(CODE_CAVE_BASE + 0x0100)
