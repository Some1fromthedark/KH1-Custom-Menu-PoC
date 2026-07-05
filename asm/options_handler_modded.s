/*
 * Generated from a Ghidra listing export.
 *
 * Source range: 0x00219F98-0x0021AC34
 * Internal branches/jumps were relocated to local labels.
 */

        .set noreorder
        .set noat

        .globl custom_config_options_handler

custom_config_options_handler:
        /* 00219F98 */ addiu	$sp,$sp,-128
        /* 00219F9C */ sd	$s4,80($sp)
        /* 00219FA0 */ sd	$s0,48($sp)
        /* 00219FA4 */ sd	$s1,56($sp)
        /* 00219FA8 */ sd	$s2,64($sp)
        /* 00219FAC */ sd	$s3,72($sp)
        /* 00219FB0 */ sd	$s5,88($sp)
        /* 00219FB4 */ sd	$s6,96($sp)
        /* 00219FB8 */ sd	$s7,104($sp)
        /* 00219FBC */ sd	$fp,112($sp)
        /* 00219FC0 */ sd	$ra,120($sp)
        # Paged Menu Setup
        move $s4,$a0
        jal  0x1fd5e0
        li   $a1,0x30
        move $a0,$s4
        jal  0x1fd610
        li   $a1,8
        jal  0x1fd688
        move $a0,$s4
        /* 00219FC4 */ jal	0x1f42b8
        move $a0,$s4
        /* 00219FCC */ beqz	$v0,L_invalid_handle
        /* 00219FD0 */ lui	$v0,0x42
        /* 00219FD4 */ addiu	$s3,$v0,23496
        /* 00219FD8 */ lw	$v1,0($s3)
        /* 00219FDC */ lw	$v1,8($v1)
        /* 00219FE0 */ andi	$v0,$v1,0x4000
        /* 00219FE4 */ beqz	$v0,L_input_confirm_check
        /* 00219FE8 */ lui	$v0,0x64
        /* 00219FEC */ lui	$fp,0x64
        /* 00219FF0 */ jal	0x1f3758
        /* 00219FF4 */ lw	$a0,11552($v0)
        /* 00219FF8 */ jal	0x11d768
        /* 00219FFC */ li	$a0,3
        /* 0021A000 */ b	L_render_rows
        /* 0021A004 */ lui	$v0,0x64
L_input_confirm_check:
        /* 0021A008 */ andi	$v0,$v1,0x2000
        /* 0021A00C */ beqz	$v0,L_no_confirm_update_lr
        /* 0021A010 */ move	$a0,$s4
        /* 0021A014 */ lui	$fp,0x64
        /* 0021A018 */ lw	$v1,11556($fp)
        /* 0021A01C */ sltiu	$v0,$v1,8
        /* 0021A020 */ beqz	$v0,L_setup_render_state
        /* 0021A024 */ move	$s1,$fp
        /* 0021A028 */ sll	$v0,$v1,0x2
        /* 0021A02C: local switch table address */
        lui     $v1,%hi(config_options_confirm_switch_table)
        addiu   $v1,$v1,%lo(config_options_confirm_switch_table)
        addu    $v1,$v1,$v0
        lw      $v1,0($v1)
        /* 0021A038 */ jr	$v1
        /* 0021A03C */ nop
L_confirm_case_0_camera:
        /* 0021A040 */ jal	0x1f4468
        /* 0021A044 */ move	$a0,$s4
        /* 0021A048 */ move	$a0,$s4
        /* 0021A04C */ li	$a1,5
        /* 0021A050 */ jal	0x1f3d58
        /* 0021A054 */ move	$s0,$v0
        /* 0021A058 */ jal	0x1f3758
        /* 0021A05C */ move	$a0,$s4
        /* 0021A060 */ jal	0x11d768
        /* 0021A064 */ li	$a0,2
        /* 0021A068 */ lui	$v0,0x3f
        /* 0021A06C */ addiu	$t1,$v0,13516
        /* 0021A070 */ lw	$v1,0($t1)
        /* 0021A074 */ bnez	$v1,L_0021A0BC
        /* 0021A078 */ lui	$a0,0x3f
        /* 0021A07C */ lui	$t0,0x3f
        /* 0021A080 */ lui	$v0,0x3f
        /* 0021A084 */ addiu	$t0,$t0,13512
        /* 0021A088 */ lw	$a1,13520($v0)
        /* 0021A08C */ lw	$v1,0($t0)
        /* 0021A090 */ li	$v0,1
        /* 0021A094 */ lui	$a0,0x49
        /* 0021A098 */ lui	$a2,0x22
        /* 0021A09C */ addiu	$v1,$v1,1
        /* 0021A0A0 */ sw	$v0,0($t1)
        /* 0021A0A4 */ sw	$v1,0($t0)
        /* 0021A0A8 */ addiu	$a0,$a0,3856
        /* 0021A0AC */ addiu	$a2,$a2,-27440
        /* 0021A0B0 */ jal	0x120748
        /* 0021A0B4 */ move	$a3,$zero
        /* 0021A0B8 */ lui	$a0,0x3f
L_0021A0BC:
        /* 0021A0BC */ li	$a1,6
        /* 0021A0C0 */ jal	0x1f3520
        /* 0021A0C4 */ addiu	$a0,$a0,19264
        /* 0021A0C8 */ beqz	$v0,L_setup_render_state
        /* 0021A0CC */ sw	$v0,32($sp)
        /* 0021A0D0 */ move	$a1,$v0
        /* 0021A0D4 */ jal	0x1f3e90
        /* 0021A0D8 */ move	$a0,$s0
        /* 0021A0DC */ move	$a1,$s0
        /* 0021A0E0 */ jal	0x1f3e20
        /* 0021A0E4 */ lw	$a0,32($sp)
        /* 0021A0E8 */ lui	$v0,0x3f
        /* 0021A0EC */ lw	$v1,13496($v0)
        /* 0021A0F0 */ lui	$a0,0x3f
        /* 0021A0F4 */ lw	$a2,32($sp)
        /* 0021A0F8 */ addiu	$a0,$a0,19216
        /* 0021A0FC */ lhu	$v0,0($v1)
        /* 0021A100 */ li	$a1,6
        /* 0021A104 */ sll	$v0,$v0,0x4
        /* 0021A108 */ jal	0x1f31a8
        /* 0021A10C */ sh	$v0,218($a2)
        /* 0021A110 */ beqz	$v0,L_setup_render_state
        /* 0021A114 */ sw	$v0,36($sp)
        /* 0021A118 */ lw	$a0,32($sp)
        /* 0021A11C */ jal	0x1f3e90
        /* 0021A120 */ move	$a1,$v0
        /* 0021A124 */ lw	$a0,36($sp)
        /* 0021A128 */ jal	0x1f3e20
        /* 0021A12C */ lw	$a1,32($sp)
        /* 0021A130 */ li	$v1,96
        /* 0021A134 */ lw	$v0,36($sp)
        /* 0021A138 */ lui	$a0,0x3f
        /* 0021A13C */ addiu	$a0,$a0,18416
        /* 0021A140 */ li	$a1,6
        /* 0021A144 */ b	L_0021A348
        /* 0021A148 */ sh	$v1,210($v0)
        /* 0021A14C */ nop
L_confirm_case_1:
        /* 0021A150 */ jal	0x1f4468
        /* 0021A154 */ move	$a0,$s4
        /* 0021A158 */ move	$a0,$s4
        /* 0021A15C */ jal	0x1f3758
        /* 0021A160 */ move	$s0,$v0
        /* 0021A164 */ jal	0x11d768
        /* 0021A168 */ li	$a0,2
        /* 0021A16C */ lui	$v0,0x3f
        /* 0021A170 */ addiu	$t1,$v0,13516
        /* 0021A174 */ lw	$v1,0($t1)
        /* 0021A178 */ bnez	$v1,L_0021A1C0
        /* 0021A17C */ lui	$a0,0x3f
        /* 0021A180 */ lui	$t0,0x3f
        /* 0021A184 */ lui	$v0,0x3f
        /* 0021A188 */ addiu	$t0,$t0,13512
        /* 0021A18C */ lw	$a1,13520($v0)
        /* 0021A190 */ lw	$v1,0($t0)
        /* 0021A194 */ li	$v0,1
        /* 0021A198 */ lui	$a0,0x49
        /* 0021A19C */ lui	$a2,0x22
        /* 0021A1A0 */ addiu	$v1,$v1,1
        /* 0021A1A4 */ sw	$v0,0($t1)
        /* 0021A1A8 */ sw	$v1,0($t0)
        /* 0021A1AC */ addiu	$a0,$a0,3856
        /* 0021A1B0 */ addiu	$a2,$a2,-27440
        /* 0021A1B4 */ jal	0x120748
        /* 0021A1B8 */ move	$a3,$zero
        /* 0021A1BC */ lui	$a0,0x3f
L_0021A1C0:
        /* 0021A1C0 */ li	$a1,6
        /* 0021A1C4 */ jal	0x1f3520
        /* 0021A1C8 */ addiu	$a0,$a0,19312
        /* 0021A1CC */ beqz	$v0,L_setup_render_state
        /* 0021A1D0 */ sw	$v0,32($sp)
        /* 0021A1D4 */ move	$a1,$v0
        /* 0021A1D8 */ jal	0x1f3e90
        /* 0021A1DC */ move	$a0,$s0
        /* 0021A1E0 */ move	$a1,$s0
        /* 0021A1E4 */ jal	0x1f3e20
        /* 0021A1E8 */ lw	$a0,32($sp)
        /* 0021A1EC */ lui	$v0,0x3f
        /* 0021A1F0 */ lw	$v1,13496($v0)
        /* 0021A1F4 */ lui	$a0,0x3f
        /* 0021A1F8 */ lw	$a2,32($sp)
        /* 0021A1FC */ addiu	$a0,$a0,19216
        /* 0021A200 */ lhu	$v0,4($v1)
        /* 0021A204 */ li	$a1,6
        /* 0021A208 */ sll	$v0,$v0,0x4
        /* 0021A20C */ jal	0x1f31a8
        /* 0021A210 */ sh	$v0,218($a2)
        /* 0021A214 */ beqz	$v0,L_setup_render_state
        /* 0021A218 */ sw	$v0,36($sp)
        /* 0021A21C */ lw	$a0,32($sp)
        /* 0021A220 */ jal	0x1f3e90
        /* 0021A224 */ move	$a1,$v0
        /* 0021A228 */ lw	$a0,36($sp)
        /* 0021A22C */ jal	0x1f3e20
        /* 0021A230 */ lw	$a1,32($sp)
        /* 0021A234 */ li	$v1,96
        /* 0021A238 */ lw	$v0,36($sp)
        /* 0021A23C */ lui	$a0,0x3f
        /* 0021A240 */ addiu	$a0,$a0,18416
        /* 0021A244 */ li	$a1,6
        /* 0021A248 */ b	L_0021A348
        /* 0021A24C */ sh	$v1,210($v0)
L_confirm_case_2:
        /* 0021A250 */ jal	0x1f4468
        /* 0021A254 */ move	$a0,$s4
        /* 0021A258 */ move	$a0,$s4
        /* 0021A25C */ jal	0x1f3758
        /* 0021A260 */ move	$s0,$v0
        /* 0021A264 */ jal	0x11d768
        /* 0021A268 */ li	$a0,2
        /* 0021A26C */ lui	$v0,0x3f
        /* 0021A270 */ addiu	$t1,$v0,13516
        /* 0021A274 */ lw	$v1,0($t1)
        /* 0021A278 */ bnez	$v1,L_0021A2C0
        /* 0021A27C */ lui	$a0,0x3f
        /* 0021A280 */ lui	$t0,0x3f
        /* 0021A284 */ lui	$v0,0x3f
        /* 0021A288 */ addiu	$t0,$t0,13512
        /* 0021A28C */ lw	$a1,13520($v0)
        /* 0021A290 */ lw	$v1,0($t0)
        /* 0021A294 */ li	$v0,1
        /* 0021A298 */ lui	$a0,0x49
        /* 0021A29C */ lui	$a2,0x22
        /* 0021A2A0 */ addiu	$v1,$v1,1
        /* 0021A2A4 */ sw	$v0,0($t1)
        /* 0021A2A8 */ sw	$v1,0($t0)
        /* 0021A2AC */ addiu	$a0,$a0,3856
        /* 0021A2B0 */ addiu	$a2,$a2,-27440
        /* 0021A2B4 */ jal	0x120748
        /* 0021A2B8 */ move	$a3,$zero
        /* 0021A2BC */ lui	$a0,0x3f
L_0021A2C0:
        /* 0021A2C0 */ li	$a1,6
        /* 0021A2C4 */ jal	0x1f3520
        /* 0021A2C8 */ addiu	$a0,$a0,19360
        /* 0021A2CC */ beqz	$v0,L_setup_render_state
        /* 0021A2D0 */ sw	$v0,32($sp)
        /* 0021A2D4 */ move	$a1,$v0
        /* 0021A2D8 */ jal	0x1f3e90
        /* 0021A2DC */ move	$a0,$s0
        /* 0021A2E0 */ move	$a1,$s0
        /* 0021A2E4 */ jal	0x1f3e20
        /* 0021A2E8 */ lw	$a0,32($sp)
        /* 0021A2EC */ lui	$v0,0x3f
        /* 0021A2F0 */ lw	$v1,13496($v0)
        /* 0021A2F4 */ lui	$a0,0x3f
        /* 0021A2F8 */ lw	$a2,32($sp)
        /* 0021A2FC */ addiu	$a0,$a0,19216
        /* 0021A300 */ lhu	$v0,8($v1)
        /* 0021A304 */ li	$a1,6
        /* 0021A308 */ sll	$v0,$v0,0x4
        /* 0021A30C */ jal	0x1f31a8
        /* 0021A310 */ sh	$v0,218($a2)
        /* 0021A314 */ beqz	$v0,L_setup_render_state
        /* 0021A318 */ sw	$v0,36($sp)
        /* 0021A31C */ lw	$a0,32($sp)
        /* 0021A320 */ jal	0x1f3e90
        /* 0021A324 */ move	$a1,$v0
        /* 0021A328 */ lw	$a0,36($sp)
        /* 0021A32C */ jal	0x1f3e20
        /* 0021A330 */ lw	$a1,32($sp)
        /* 0021A334 */ lui	$a0,0x3f
        /* 0021A338 */ lw	$v0,36($sp)
        /* 0021A33C */ addiu	$a0,$a0,18416
        /* 0021A340 */ li	$a1,6
        /* 0021A344 */ sh	$zero,210($v0)
L_0021A348:
        /* 0021A348 */ jal	0x1f31a8
        /* 0021A34C */ nop
        /* 0021A350 */ beqz	$v0,L_setup_render_state
        /* 0021A354 */ sw	$v0,40($sp)
        /* 0021A358 */ lw	$a0,36($sp)
        /* 0021A35C */ jal	0x1f3e90
        /* 0021A360 */ move	$a1,$v0
        /* 0021A364 */ lw	$a0,40($sp)
        /* 0021A368 */ jal	0x1f3e20
        /* 0021A36C */ lw	$a1,36($sp)
        /* 0021A370 */ jal	0x1f3dc0
        /* 0021A374 */ lw	$a0,32($sp)
        /* 0021A378 */ b	L_render_rows
        /* 0021A37C */ lui	$v0,0x64
L_confirm_case_3_4_toggle_value:
        /* 0021A380 */ addiu	$s0,$s1,11556
        /* 0021A384 */ jal	0x219158
        /* 0021A388 */ lw	$a0,0($s0)
        /* 0021A38C */ lw	$a1,0($s0)
        /* 0021A390 */ sll	$v1,$a1,0x2
        /* 0021A394 */ lui	$a0,0x3f
        /* 0021A398 */ addu	$a0,$a0,$v1
        /* 0021A39C */ lw	$a0,19480($a0)
        /* 0021A3A0 */ slt	$v0,$v0,$a0
        /* 0021A3A4 */ beqzl	$v0,L_0021A3C8
        /* 0021A3A8 */ move	$a0,$a1
        /* 0021A3AC */ jal	0x219158
        /* 0021A3B0 */ move	$a0,$a1
        /* 0021A3B4 */ lw	$a0,0($s0)
        /* 0021A3B8 */ jal	0x2191f0
        /* 0021A3BC */ addiu	$a1,$v0,1
        /* 0021A3C0 */ b	L_0021A3D0
        /* 0021A3C4 */ nop
L_0021A3C8:
        /* 0021A3C8 */ jal	0x2191f0
        /* 0021A3CC */ move	$a1,$zero
L_0021A3D0:
        /* 0021A3D0 */ jal	0x11d768
        /* 0021A3D4 */ li	$a0,1
        /* 0021A3D8 */ lw	$v1,11556($s1)
        /* 0021A3DC */ li	$v0,4
        /* 0021A3E0 */ bnel	$v1,$v0,L_render_rows
        /* 0021A3E4 */ lui	$v0,0x64
        /* 0021A3E8 */ jal	0x219380
        /* 0021A3EC */ nop
        /* 0021A3F0 */ b	L_0021A614
        /* 0021A3F4 */ nop
L_confirm_case_5_sound:
        /* 0021A3F8 */ jal	0x219428
        /* 0021A3FC */ nop
        /* 0021A400 */ beqz	$v0,L_confirm_case_6_error
        /* 0021A404 */ nop
        /* 0021A408 */ jal	0x219158
        /* 0021A40C */ li	$a0,5
        /* 0021A410 */ bgtzl	$v0,L_0021A438
        /* 0021A414 */ li	$a0,5
        /* 0021A418 */ jal	0x219158
        /* 0021A41C */ li	$a0,5
        /* 0021A420 */ li	$a0,5
        /* 0021A424 */ jal	0x2191f0
        /* 0021A428 */ addiu	$a1,$v0,1
        /* 0021A42C */ b	L_0021A440
        /* 0021A430 */ nop
        /* 0021A434 */ nop
L_0021A438:
        /* 0021A438 */ jal	0x2191f0
        /* 0021A43C */ move	$a1,$zero
L_0021A440:
        /* 0021A440 */ jal	0x11d768
        /* 0021A444 */ li	$a0,1
        /* 0021A448 */ b	L_render_rows
        /* 0021A44C */ lui	$v0,0x64
L_confirm_case_6_error:
        /* 0021A450 */ jal	0x11d768
        /* 0021A454 */ li	$a0,4
        /* 0021A458 */ b	L_render_rows
        /* 0021A45C */ lui	$v0,0x64
L_confirm_case_7_accept_close:
        /* 0021A460 */ jal	0x11d768
        /* 0021A464 */ li	$a0,2
        /* 0021A468 */ lui	$v1,0x3f
        /* 0021A46C */ lw	$v0,13496($v1)
        /* 0021A470 */ li	$a0,1
        /* 0021A474 */ sw	$zero,24($v0)
        /* 0021A478 */ sw	$zero,0($v0)
        /* 0021A47C */ sw	$zero,4($v0)
        /* 0021A480 */ sw	$zero,8($v0)
        /* 0021A484 */ sw	$zero,16($v0)
        /* 0021A488 */ jal	0x1edaf0
        /* 0021A48C */ sw	$zero,20($v0)
        /* 0021A490 */ b	L_render_rows
        /* 0021A494 */ lui	$v0,0x64
L_no_confirm_update_lr:
        /* 0021A498 */ jal	0x1fd858
        /* 0021A49C */ lui	$fp,0x64
        /* 0021A4A0 */ move	$a0,$s4
        /* 0021A4A4 */ li	$a1,8
        /* 0021A4A8 */ jal	0x20bd18
        /* 0021A4AC */ addiu	$s1,$fp,11556
        # Use Global Selected Row Index instead of Relative Index
        jal  0x1fd548
        /* 0021A4B4 */ move	$a0,$s4
        /* 0021A4B8 */ move	$s5,$fp
        /* 0021A4BC */ move	$v1,$v0
        /* 0021A4C0 */ move	$s2,$zero
        /* 0021A4C4 */ addiu	$v0,$v1,-6
        /* 0021A4C8 */ sltiu	$v0,$v0,2
        /* 0021A4CC */ bnez	$v0,L_setup_render_state
        /* 0021A4D0 */ sw	$v1,0($s1)
        /* 0021A4D4 */ li	$v0,5
        /* 0021A4D8 */ bnel	$v1,$v0,L_0021A4F4
        /* 0021A4DC */ lw	$v1,0($s3)
        /* 0021A4E0 */ jal	0x219428
        /* 0021A4E4 */ nop
        /* 0021A4E8 */ beqz	$v0,L_render_rows
        /* 0021A4EC */ lui	$v0,0x64
        /* 0021A4F0 */ lw	$v1,0($s3)
L_0021A4F4:
        /* 0021A4F4 */ lui	$s0,0x8000
        /* 0021A4F8 */ ori	$s0,$s0,0x80
        /* 0021A4FC */ lw	$v1,16($v1)
        /* 0021A500 */ and	$v0,$v1,$s0
        /* 0021A504 */ beqzl	$v0,L_0021A578
        /* 0021A508 */ lui	$s0,0x2000
        /* 0021A50C */ jal	0x219158
        /* 0021A510 */ lw	$a0,0($s1)
        /* 0021A514 */ blezl	$v0,L_0021A540
        /* 0021A518 */ lw	$v1,0($s3)
        /* 0021A51C */ lw	$a0,0($s1)
        /* 0021A520 */ jal	0x219158
        /* 0021A524 */ li	$s2,1
        /* 0021A528 */ lw	$a0,0($s1)
        /* 0021A52C */ jal	0x2191f0
        /* 0021A530 */ addiu	$a1,$v0,-1
        /* 0021A534 */ b	L_0021A5EC
        /* 0021A538 */ nop
        /* 0021A53C */ nop
L_0021A540:
        /* 0021A540 */ lw	$v0,8($v1)
        /* 0021A544 */ and	$v0,$v0,$s0
        /* 0021A548 */ beqz	$v0,L_0021A5EC
        /* 0021A54C */ nop
        /* 0021A550 */ lw	$a0,0($s1)
        /* 0021A554 */ sll	$v0,$a0,0x2
        /* 0021A558 */ lui	$a1,0x3f
        /* 0021A55C */ addu	$a1,$a1,$v0
        /* 0021A560 */ lw	$a1,19480($a1)
        /* 0021A564 */ jal	0x2191f0
        /* 0021A568 */ li	$s2,1
        /* 0021A56C */ b	L_0021A5EC
        /* 0021A570 */ nop
        /* 0021A574 */ nop
L_0021A578:
        /* 0021A578 */ ori	$s0,$s0,0x20
        /* 0021A57C */ and	$v0,$v1,$s0
        /* 0021A580 */ beqz	$v0,L_0021A5EC
        /* 0021A584 */ nop
        /* 0021A588 */ jal	0x219158
        /* 0021A58C */ lw	$a0,0($s1)
        /* 0021A590 */ lw	$a1,0($s1)
        /* 0021A594 */ sll	$v1,$a1,0x2
        /* 0021A598 */ lui	$a0,0x3f
        /* 0021A59C */ addu	$a0,$a0,$v1
        /* 0021A5A0 */ lw	$a0,19480($a0)
        /* 0021A5A4 */ slt	$v0,$v0,$a0
        /* 0021A5A8 */ beqzl	$v0,L_0021A5D0
        /* 0021A5AC */ lw	$v1,0($s3)
        /* 0021A5B0 */ move	$a0,$a1
        /* 0021A5B4 */ jal	0x219158
        /* 0021A5B8 */ li	$s2,1
        /* 0021A5BC */ lw	$a0,0($s1)
        /* 0021A5C0 */ jal	0x2191f0
        /* 0021A5C4 */ addiu	$a1,$v0,1
        /* 0021A5C8 */ b	L_0021A5EC
        /* 0021A5CC */ nop
L_0021A5D0:
        /* 0021A5D0 */ lw	$v0,8($v1)
        /* 0021A5D4 */ and	$v0,$v0,$s0
        /* 0021A5D8 */ beqz	$v0,L_0021A5EC
        /* 0021A5DC */ move	$a0,$a1
        /* 0021A5E0 */ jal	0x2191f0
        /* 0021A5E4 */ move	$a1,$zero
        /* 0021A5E8 */ li	$s2,1
L_0021A5EC:
        /* 0021A5EC */ beqz	$s2,L_render_rows
        /* 0021A5F0 */ lui	$v0,0x64
        /* 0021A5F4 */ jal	0x11d768
        /* 0021A5F8 */ li	$a0,1
        /* 0021A5FC */ lw	$v1,11556($s5)
        /* 0021A600 */ li	$v0,4
        /* 0021A604 */ bne	$v1,$v0,L_render_rows
        /* 0021A608 */ lui	$v0,0x64
        /* 0021A60C */ jal	0x219380
        /* 0021A610 */ nop
L_0021A614:
        /* 0021A614 */ jal	0x1edaf0
        /* 0021A618 */ sltiu	$a0,$v0,1
        /* 0021A61C */ b	L_render_rows
        /* 0021A620 */ lui	$v0,0x64
        /* 0021A624 */ nop
L_invalid_handle:
        /* 0021A628 */ lui	$fp,0x64
L_setup_render_state:
        /* 0021A62C */ lui	$v0,0x64
L_render_rows:
        /* 0021A630 */ lui	$v1,0x3f
        /* 0021A634 */ addiu	$s6,$v0,11556
        /* 0021A638 */ addiu	$s5,$v1,19512
        # Get page index
        jal  0x1fd618
        move $a0,$s4
        sll  $v0,$v0,2
        add  $s5,$s5,$v0
        /* 0021A63C */ li	$s3,71
        # Add Scrollbar
        jal  0x202fc0
        move $a0,$s4
        /* 0021A640 */ move	$s2,$zero
        /* 0021A644 */ li	$s7,6
        # Get the relative selected row index
        lw   $v0,0xd2($s4)
L_0021A650:
        sll  $v0,$v0,16
        sra  $v0,$v0,20
        /* 0021A650 */ bne	$s2,$v0,L_0021A6E0
        /* 0021A654 */ move	$s1,$zero
        # Get global selected row index
        lw   $v0,0($s6)
        slti $v0,$v0,7
        /* 0021A65C */ beqzl	$v0,L_0021A6E0
        /* 0021A660 */ li	$s1,1
        /* 0021A664 */ addiu	$s0,$s3,12
        /* 0021A668 */ li	$a1,-64
        /* 0021A66C */ move	$a2,$s0
        /* 0021A670 */ li	$a3,75
        /* 0021A674 */ move	$a0,$s4
        /* 0021A678 */ jal	0x206690
        /* 0021A67C */ li	$s1,11
        /* 0021A680 */ move	$a0,$s4
        /* 0021A684 */ li	$a1,153
        /* 0021A688 */ move	$a2,$s0
        /* 0021A68C */ jal	0x206690
        /* 0021A690 */ li	$a3,6
        /* 0021A694 */ lw	$v0,0($s6)
        /* 0021A698 */ beq	$v0,$s7,L_0021A6C0
        /* 0021A69C */ li	$a1,321
        /* 0021A6A0 */ move	$a2,$s0
        /* 0021A6A4 */ li	$a3,6
        /* 0021A6A8 */ jal	0x206690
        /* 0021A6AC */ move	$a0,$s4
        /* 0021A6B0 */ move	$a0,$s4
        /* 0021A6B4 */ li	$a1,489
        /* 0021A6B8 */ b	L_0021A6CC
        /* 0021A6BC */ move	$a2,$s0
L_0021A6C0:
        /* 0021A6C0 */ move	$a2,$s0
        /* 0021A6C4 */ move	$a0,$s4
        /* 0021A6C8 */ li	$a1,489
L_0021A6CC:
        /* 0021A6CC */ jal	0x206690
        /* 0021A6D0 */ li	$a3,23
        /* 0021A6D4 */ b	L_0021A6E4
        /* 0021A6D8 */ lw	$v0,0($s5)
        /* 0021A6DC */ nop
L_0021A6E0:
        /* 0021A6E0 */ lw	$v0,0($s5)
L_0021A6E4:
        /* 0021A6E4 */ addiu	$s5,$s5,4
        /* 0021A6E8 */ move	$t1,$s3
        /* 0021A6EC */ addiu	$s3,$s3,28
        /* 0021A6F0 */ move	$a1,$s1
        /* 0021A6F4 */ move	$a0,$s4
        /* 0021A6F8 */ li	$a2,2
        /* 0021A6FC */ move	$a3,$zero
        /* 0021A700 */ li	$t0,11
        /* 0021A704 */ li	$t2,142
        /* 0021A708 */ li	$t3,27
        /* 0021A710 */ jal	0x2078f0
        /* 0021A714 */ sw	$v0,0($sp)
        

        # Get global index for relative row index i
        jal 0x1fd618
        move $a0,$s4
        add  $t2,$v0,$s2
        sll  $t0,$t2,2
        lui  $t1,%hi(config_options_row_value_counts)
        addiu $t1,$t1,%lo(config_options_row_value_counts)
        add  $t1,$t1,$t0
        lw   $t1,0($t1)
        /* 0021A724 */ lui	$v1,0x3f
        slti $t0,$t1,1
        bnez $t0,L_done_rendering_rows
        /* 0021A728 */ lw	$v0,13496($v1)

        # Get relative selected row index
        lw   $v1,0xd2($s4)
        sll  $v1,$v1,16
        sra  $v1,$v1,20
        sll  $t3,$t2,2
        slti $t0,$t2,3
        bnez $t0,L_skip_adjustment
        add  $t3,$t3,$v0
        addiu $t0,$t2,-6
        bnez $t0,L_skip_adjustment
        addiu $t3,$t3,4
        slti $t0,$t2,8
        bnez $t0,L_skip_adjustment
        addiu $t3,$t3,16
        lui  $t3,%hi(config_options_new_row_values)
        addiu $t3,$t3,%lo(config_options_new_row_values)
        addiu $t4,$t2,-8
        sll  $t4,$t4,2
        add  $t3,$t3,$t4
L_skip_adjustment:
        li   $t4,1
        beq  $t1,$t4,L_check_is_selected
        li   $s1,0
        lw	 $s1,0($t3)
L_check_is_selected:
        bne	 $s2,$v1,L_0021A748
        /* 0021A738 */ lui	$v0,0x3f
        /* 0021A73C */ sll	$v1,$s1,0x3
        /* 0021A740 */ b	L_0021A754
        /* 0021A744 */ addiu	$v0,$v0,19560
L_0021A748:
        /* 0021A74C */ sll	$v1,$s1,0x3
        /* 0021A750 */ addiu	$v0,$v0,19576
L_0021A754:
        /* 0021A754 */ addu	$a1,$v1,$v0
        /* 0021A758 */ move	$v1,$a1
        /* 0021A75C */ lw	$v0,4($a1)
        /* 0021A760 */ lw	$a0,0($v1)
        /* 0021A764 */ sw	$v0,20($sp)
        /* 0021A768 */ sw	$a0,16($sp)
        lui  $v0,%hi(config_options_row_value_text_ids)
        sll  $t4,$t2,3
        add  $v0,$v0,$t4
        /* 0021A76C */ lw	$a1,16($sp)
        /* 0021A774 */ move	$a0,$s4
        /* 0021A778 */ li	$a2,2
        /* 0021A77C */ li	$a3,2
        /* 0021A780 */ li	$t0,159
        /* 0021A788 */ li	$t2,162
        /* 0021A78C */ li	$t3,240
        li   $t4,2
        beq  $t1,$t4,L_draw_options
        lw   $v0,%lo(config_options_row_value_text_ids)($v0)
        li   $t2,330
        li   $t3,324
L_draw_options:
        sll  $t1,$s2,3
        sub  $t1,$t1,$s2
        sll  $t1,$t1,2
        add  $t1,$t1,71
        /* 0021A790 */ jal	0x2078f0
        /* 0021A794 */ sw	$v0,0($sp)

        # Get global index for relative row index i
        jal 0x1fd618
        move $a0,$s4
        add  $t2,$v0,$s2
        sll  $t0,$t2,2
        lui  $t1,%hi(config_options_row_value_counts)
        addiu $t1,$t1,%lo(config_options_row_value_counts)
        add  $t1,$t1,$t0
        lw   $t1,0($t1)
        slti $t0,$t1,2
        bnez $t0,L_done_rendering_rows
        lui  $v0,%hi(config_options_row_value_text_ids)
        
        sll  $t4,$t2,3
        add  $t4,$t4,4
        add  $v0,$v0,$t4
        /* 0021A79C */ lw	$a1,20($sp)
        /* 0021A7A0 */ move	$a0,$s4
        /* 0021A7A4 */ li	$a2,2
        /* 0021A7A8 */ li	$a3,2
        /* 0021A7AC */ li	$t0,327
        sll  $t1,$s2,3
        sub  $t1,$t1,$s2
        sll  $t1,$t1,2
        add  $t1,$t1,71
        /* 0021A7B4 */ li	$t2,162
        /* 0021A7B8 */ li	$t3,408
        lw   $v0,%lo(config_options_row_value_text_ids)($v0)
        /* 0021A7BC */ jal	0x2078f0
        /* 0021A7C0 */ sw	$v0,0($sp)

L_done_rendering_rows:
        /* 0021A70C */ addiu	$s2,$s2,1
        /* 0021A718 */ slti	$v0,$s2,8
        /* 0021A71C */ bnezl	$v0,L_0021A650
        # Get relative selected row index
        lw   $v0,0xd2($s4)
        /* 0021AB74 */ lw	$v1,11556($fp)
        /* 0021AB78 */ slti	$v0,$v1,5
        /* 0021AB7C */ beqz	$v0,L_epilogue
        /* 0021AB80 */ ld	$s0,48($sp)
        # Get relative selected row index
        lw   $v0,0xd2($s4)
        sll  $v0,$v0,16
        sra  $v0,$v0,20
        sll  $t0,$v0,0x3
        /* 0021AB88 */ move	$a0,$v1
        # Fix y_coord calculation after above changes
        subu $v0,$t0,$v0
        /* 0021AB90 */ sll	$v0,$v0,0x2
        /* 0021AB94 */ jal	0x219158
        /* 0021AB98 */ addiu	$s3,$v0,78
        /* 0021AB9C */ bnez	$v0,L_0021ABD8
        /* 0021ABA0 */ move	$a0,$s4
        /* 0021ABA4 */ lui	$v0,0x8080
        /* 0021ABA8 */ ori	$v0,$v0,0x8080
        /* 0021ABAC */ move	$a2,$s3
        /* 0021ABB0 */ li	$a1,304
        /* 0021ABB4 */ move	$a3,$zero
        /* 0021ABB8 */ move	$t0,$zero
        /* 0021ABBC */ li	$t1,16
        /* 0021ABC0 */ move	$t2,$zero
        /* 0021ABC4 */ move	$t3,$v0
        /* 0021ABC8 */ jal	0x1fc308
        /* 0021ABCC */ sw	$v0,0($sp)
        /* 0021ABD0 */ b	L_epilogue
        /* 0021ABD4 */ ld	$s0,48($sp)
L_0021ABD8:
        /* 0021ABD8 */ lui	$v0,0x8080
        /* 0021ABDC */ ori	$v0,$v0,0x8080
        /* 0021ABE0 */ move	$a2,$s3
        /* 0021ABE4 */ li	$a1,335
        /* 0021ABE8 */ move	$a3,$zero
        /* 0021ABEC */ move	$t0,$zero
        /* 0021ABF0 */ li	$t1,15
        /* 0021ABF4 */ move	$t2,$zero
        /* 0021ABF8 */ move	$t3,$v0
        /* 0021ABFC */ jal	0x1fc308
        /* 0021AC00 */ sw	$v0,0($sp)
        /* 0021AC04 */ ld	$s0,48($sp)
L_epilogue:
        /* 0021AC08 */ ld	$s1,56($sp)
        /* 0021AC0C */ ld	$s2,64($sp)
        /* 0021AC10 */ ld	$s3,72($sp)
        /* 0021AC14 */ ld	$s4,80($sp)
        /* 0021AC18 */ ld	$s5,88($sp)
        /* 0021AC1C */ ld	$s6,96($sp)
        /* 0021AC20 */ ld	$s7,104($sp)
        /* 0021AC24 */ ld	$fp,112($sp)
        /* 0021AC28 */ ld	$ra,120($sp)
        /* 0021AC2C */ jr	$ra
        /* 0021AC30 */ addiu	$sp,$sp,128

        .align 2
config_options_confirm_switch_table:
        .word   L_confirm_case_0_camera
        .word   L_confirm_case_1
        .word   L_confirm_case_2
        .word   L_confirm_case_3_4_toggle_value
        .word   L_confirm_case_3_4_toggle_value
        .word   L_confirm_case_5_sound
        .word   L_confirm_case_6_error
        .word   L_confirm_case_7_accept_close
config_options_row_value_counts:
        .word   2
        .word   2
        .word   2
        .word   2
        .word   2
        .word   2
        .word   1
        .word   0
        .word   0
        .word   1
        .word   2
        .word   2
        .word   1
        .word   0
        .word   0
        .word   1
        .word   2
        .word   2
        .word   1
        .word   0
        .word   0
        .word   1
        .word   2
        .word   2
        .word   1
        .word   0
        .word   0
        .word   1
        .word   2
        .word   2
        .word   1
        .word   0
        .word   0
        .word   1
        .word   2
        .word   2
        .word   1
        .word   0
        .word   0
        .word   1
        .word   2
        .word   2
        .word   1
        .word   0
        .word   0
        .word   1
        .word   2
        .word   2
config_options_row_value_text_ids:
        .word   295
        .word   296
        .word   300
        .word   301
        .word   304
        .word   305
        .word   312
        .word   313
        .word   316
        .word   317
        .word   452
        .word   453
        .word   0
        .word   0
        .word   0
        .word   0
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
        .word   127
        .word   128
config_options_new_row_values:
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0
        .word   0