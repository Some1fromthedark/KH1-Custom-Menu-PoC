/* KH1FM EE addresses and code-cave layout (English Patched, CRC BD3FB233) */

.equ CODE_CAVE_BASE,      0x01800000

.equ MENU_CONFIG_TOP,     0x003F4CC0   /* do not hook in PoC phase 1 */
.equ MENU_CONFIG_OPTIONS, 0x003F4C90   /* hook: options rows handler ptr */
.equ MENU_CONFIG_DESC,    0x003F4BD0   /* phase 2 */

/* Scratch / custom option storage (inside code cave) */
.equ SCRATCH_BASE,        0x0180F000
.equ SCRATCH_CURSOR,      (SCRATCH_BASE + 0x00)
.equ SCRATCH_SCROLL,      (SCRATCH_BASE + 0x04)
.equ SCRATCH_CUSTOM_OPT,  (SCRATCH_BASE + 0x08)

/* Code cave regions (offsets from CODE_CAVE_BASE) */
.equ CAVE_ENTRY,          0x0000
.equ CAVE_OPTIONS_HANDLER,(CODE_CAVE_BASE + 0x0100)
