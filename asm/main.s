/*
 * KH1FM custom config menu - code cave entry
 *
 * Baseline payload: a cave-resident source port of the vanilla config options
 * handler. The previous infinite-loop landing test is preserved in
 * asm/main_infinite_loop.s.
 */
.include "asm/include/kh1_addresses.inc"

        .set noreorder
        .set noat

        .globl cave_entry
        .globl cave_options_handler

cave_entry:
.include "asm/options_handler_modded.s"