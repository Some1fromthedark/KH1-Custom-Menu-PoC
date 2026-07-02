/*
 * KH1FM custom config menu — code cave entry
 *
 * Phase 1 placeholder: infinite loop so we can verify the hook lands here.
 * Replace with trampoline to vanilla handler once Ghidra reference is available.
 */
#include "include/kh1_addresses.inc"

        .set noreorder
        .set noat

        .globl cave_entry
        .org CODE_CAVE_BASE

cave_entry:
        /* TODO: save registers, run custom logic, call/jump to vanilla handler */
1:      j       1b
        nop
