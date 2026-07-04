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
        li   $a1,0x1f
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
        # Properly get the relative selected row index to prevent flickering
        lhu  $v0,0xd2($s4)
        sll  $v0,$v0,16
        sra  $v0,$v0,20
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
        /* 0021A63C */ li	$s3,71
        # Add Scrollbar
        jal  0x202fc0
        move $a0,$s4
        /* 0021A640 */ move	$s2,$zero
        /* 0021A644 */ li	$s7,6
        /* 0021A648 */ lw	$v0,0($s6)
        /* 0021A64C */ nop
L_0021A650:
        /* 0021A650 */ bne	$s2,$v0,L_0021A6E0
        /* 0021A654 */ move	$s1,$zero
        /* 0021A658 */ slti	$v0,$s2,7
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
        /* 0021A70C */ addiu	$s2,$s2,1
        /* 0021A710 */ jal	0x2078f0
        /* 0021A714 */ sw	$v0,0($sp)
        /* 0021A718 */ slti	$v0,$s2,8
        /* 0021A71C */ bnezl	$v0,L_0021A650
        /* 0021A720 */ lw	$v0,0($s6)
        /* 0021A724 */ lui	$v1,0x3f
        /* 0021A728 */ lw	$v0,13496($v1)
        /* 0021A72C */ lw	$v1,11556($fp)
        /* 0021A730 */ bnez	$v1,L_0021A748
        /* 0021A734 */ lw	$s1,0($v0)
        /* 0021A738 */ lui	$v0,0x3f
        /* 0021A73C */ sll	$v1,$s1,0x3
        /* 0021A740 */ b	L_0021A754
        /* 0021A744 */ addiu	$v0,$v0,19560
L_0021A748:
        /* 0021A748 */ lui	$v0,0x3f
        /* 0021A74C */ sll	$v1,$s1,0x3
        /* 0021A750 */ addiu	$v0,$v0,19576
L_0021A754:
        /* 0021A754 */ addu	$a1,$v1,$v0
        /* 0021A758 */ move	$v1,$a1
        /* 0021A75C */ lw	$v0,4($a1)
        /* 0021A760 */ lw	$a0,0($v1)
        /* 0021A764 */ sw	$v0,20($sp)
        /* 0021A768 */ sw	$a0,16($sp)
        /* 0021A76C */ lw	$a1,16($sp)
        /* 0021A770 */ li	$v0,295
        /* 0021A774 */ move	$a0,$s4
        /* 0021A778 */ li	$a2,2
        /* 0021A77C */ li	$a3,2
        /* 0021A780 */ li	$t0,159
        /* 0021A784 */ li	$t1,71
        /* 0021A788 */ li	$t2,162
        /* 0021A78C */ li	$t3,240
        /* 0021A790 */ jal	0x2078f0
        /* 0021A794 */ sw	$v0,0($sp)
        /* 0021A798 */ li	$v0,296
        /* 0021A79C */ lw	$a1,20($sp)
        /* 0021A7A0 */ move	$a0,$s4
        /* 0021A7A4 */ li	$a2,2
        /* 0021A7A8 */ li	$a3,2
        /* 0021A7AC */ li	$t0,327
        /* 0021A7B0 */ li	$t1,71
        /* 0021A7B4 */ li	$t2,162
        /* 0021A7B8 */ li	$t3,408
        /* 0021A7BC */ jal	0x2078f0
        /* 0021A7C0 */ sw	$v0,0($sp)
        /* 0021A7C4 */ lui	$v0,0x3f
        /* 0021A7C8 */ li	$a0,1
        /* 0021A7CC */ lw	$v1,13496($v0)
        /* 0021A7D0 */ lw	$v0,11556($fp)
        /* 0021A7D4 */ bne	$v0,$a0,L_0021A7F0
        /* 0021A7D8 */ lw	$s1,4($v1)
        /* 0021A7DC */ lui	$v0,0x3f
        /* 0021A7E0 */ sll	$v1,$s1,0x3
        /* 0021A7E4 */ b	L_0021A7FC
        /* 0021A7E8 */ addiu	$v0,$v0,19560
        /* 0021A7EC */ nop
L_0021A7F0:
        /* 0021A7F0 */ lui	$v0,0x3f
        /* 0021A7F4 */ sll	$v1,$s1,0x3
        /* 0021A7F8 */ addiu	$v0,$v0,19576
L_0021A7FC:
        /* 0021A7FC */ addu	$a1,$v1,$v0
        /* 0021A800 */ move	$v1,$a1
        /* 0021A804 */ lw	$v0,4($a1)
        /* 0021A808 */ lw	$a0,0($v1)
        /* 0021A80C */ sw	$v0,20($sp)
        /* 0021A810 */ sw	$a0,16($sp)
        /* 0021A814 */ lw	$a1,16($sp)
        /* 0021A818 */ li	$v0,300
        /* 0021A81C */ move	$a0,$s4
        /* 0021A820 */ li	$a2,2
        /* 0021A824 */ li	$a3,2
        /* 0021A828 */ li	$t0,159
        /* 0021A82C */ li	$t1,99
        /* 0021A830 */ li	$t2,162
        /* 0021A834 */ li	$t3,240
        /* 0021A838 */ jal	0x2078f0
        /* 0021A83C */ sw	$v0,0($sp)
        /* 0021A840 */ li	$v0,301
        /* 0021A844 */ lw	$a1,20($sp)
        /* 0021A848 */ move	$a0,$s4
        /* 0021A84C */ li	$a2,2
        /* 0021A850 */ li	$a3,2
        /* 0021A854 */ li	$t0,327
        /* 0021A858 */ li	$t1,99
        /* 0021A85C */ li	$t2,162
        /* 0021A860 */ li	$t3,408
        /* 0021A864 */ jal	0x2078f0
        /* 0021A868 */ sw	$v0,0($sp)
        /* 0021A86C */ lui	$v0,0x3f
        /* 0021A870 */ li	$a0,2
        /* 0021A874 */ lw	$v1,13496($v0)
        /* 0021A878 */ lw	$v0,11556($fp)
        /* 0021A87C */ bne	$v0,$a0,L_0021A898
        /* 0021A880 */ lw	$s1,8($v1)
        /* 0021A884 */ lui	$v0,0x3f
        /* 0021A888 */ sll	$v1,$s1,0x3
        /* 0021A88C */ b	L_0021A8A4
        /* 0021A890 */ addiu	$v0,$v0,19560
        /* 0021A894 */ nop
L_0021A898:
        /* 0021A898 */ lui	$v0,0x3f
        /* 0021A89C */ sll	$v1,$s1,0x3
        /* 0021A8A0 */ addiu	$v0,$v0,19576
L_0021A8A4:
        /* 0021A8A4 */ addu	$a1,$v1,$v0
        /* 0021A8A8 */ move	$v1,$a1
        /* 0021A8AC */ lw	$v0,4($a1)
        /* 0021A8B0 */ lw	$a0,0($v1)
        /* 0021A8B4 */ sw	$v0,20($sp)
        /* 0021A8B8 */ sw	$a0,16($sp)
        /* 0021A8BC */ lw	$a1,16($sp)
        /* 0021A8C0 */ li	$v0,304
        /* 0021A8C4 */ move	$a0,$s4
        /* 0021A8C8 */ li	$a2,2
        /* 0021A8CC */ li	$a3,2
        /* 0021A8D0 */ li	$t0,159
        /* 0021A8D4 */ li	$t1,127
        /* 0021A8D8 */ li	$t2,162
        /* 0021A8DC */ li	$t3,240
        /* 0021A8E0 */ jal	0x2078f0
        /* 0021A8E4 */ sw	$v0,0($sp)
        /* 0021A8E8 */ li	$v0,305
        /* 0021A8EC */ lw	$a1,20($sp)
        /* 0021A8F0 */ move	$a0,$s4
        /* 0021A8F4 */ li	$a2,2
        /* 0021A8F8 */ li	$a3,2
        /* 0021A8FC */ li	$t0,327
        /* 0021A900 */ li	$t1,127
        /* 0021A904 */ li	$t2,162
        /* 0021A908 */ li	$t3,408
        /* 0021A90C */ jal	0x2078f0
        /* 0021A910 */ sw	$v0,0($sp)
        /* 0021A914 */ lui	$v0,0x3f
        /* 0021A918 */ li	$a0,3
        /* 0021A91C */ lw	$v1,13496($v0)
        /* 0021A920 */ lw	$v0,11556($fp)
        /* 0021A924 */ bne	$v0,$a0,L_0021A940
        /* 0021A928 */ lw	$s1,16($v1)
        /* 0021A92C */ lui	$v0,0x3f
        /* 0021A930 */ sll	$v1,$s1,0x3
        /* 0021A934 */ b	L_0021A94C
        /* 0021A938 */ addiu	$v0,$v0,19560
        /* 0021A93C */ nop
L_0021A940:
        /* 0021A940 */ lui	$v0,0x3f
        /* 0021A944 */ sll	$v1,$s1,0x3
        /* 0021A948 */ addiu	$v0,$v0,19576
L_0021A94C:
        /* 0021A94C */ addu	$a1,$v1,$v0
        /* 0021A950 */ move	$v1,$a1
        /* 0021A954 */ lw	$v0,4($a1)
        /* 0021A958 */ lw	$a0,0($v1)
        /* 0021A95C */ sw	$v0,20($sp)
        /* 0021A960 */ sw	$a0,16($sp)
        /* 0021A964 */ lw	$a1,16($sp)
        /* 0021A968 */ li	$v0,312
        /* 0021A96C */ move	$a0,$s4
        /* 0021A970 */ li	$a2,2
        /* 0021A974 */ li	$a3,2
        /* 0021A978 */ li	$t0,159
        /* 0021A97C */ li	$t1,155
        /* 0021A980 */ li	$t2,162
        /* 0021A984 */ li	$t3,240
        /* 0021A988 */ jal	0x2078f0
        /* 0021A98C */ sw	$v0,0($sp)
        /* 0021A990 */ li	$v0,313
        /* 0021A994 */ lw	$a1,20($sp)
        /* 0021A998 */ move	$a0,$s4
        /* 0021A99C */ li	$a2,2
        /* 0021A9A0 */ li	$a3,2
        /* 0021A9A4 */ li	$t0,327
        /* 0021A9A8 */ li	$t1,155
        /* 0021A9AC */ li	$t2,162
        /* 0021A9B0 */ li	$t3,408
        /* 0021A9B4 */ jal	0x2078f0
        /* 0021A9B8 */ sw	$v0,0($sp)
        /* 0021A9BC */ lui	$v0,0x3f
        /* 0021A9C0 */ li	$a0,4
        /* 0021A9C4 */ lw	$v1,13496($v0)
        /* 0021A9C8 */ lw	$v0,11556($fp)
        /* 0021A9CC */ bne	$v0,$a0,L_0021A9E8
        /* 0021A9D0 */ lw	$s1,20($v1)
        /* 0021A9D4 */ lui	$v0,0x3f
        /* 0021A9D8 */ sll	$v1,$s1,0x3
        /* 0021A9DC */ b	L_0021A9F4
        /* 0021A9E0 */ addiu	$v0,$v0,19560
        /* 0021A9E4 */ nop
L_0021A9E8:
        /* 0021A9E8 */ lui	$v0,0x3f
        /* 0021A9EC */ sll	$v1,$s1,0x3
        /* 0021A9F0 */ addiu	$v0,$v0,19576
L_0021A9F4:
        /* 0021A9F4 */ addu	$a1,$v1,$v0
        /* 0021A9F8 */ move	$v1,$a1
        /* 0021A9FC */ lw	$v0,4($a1)
        /* 0021AA00 */ lw	$a0,0($v1)
        /* 0021AA04 */ sw	$v0,20($sp)
        /* 0021AA08 */ sw	$a0,16($sp)
        /* 0021AA0C */ lw	$a1,16($sp)
        /* 0021AA10 */ li	$v0,316
        /* 0021AA14 */ move	$a0,$s4
        /* 0021AA18 */ li	$a2,2
        /* 0021AA1C */ li	$a3,2
        /* 0021AA20 */ li	$t0,159
        /* 0021AA24 */ li	$t1,183
        /* 0021AA28 */ li	$t2,162
        /* 0021AA2C */ li	$t3,240
        /* 0021AA30 */ jal	0x2078f0
        /* 0021AA34 */ sw	$v0,0($sp)
        /* 0021AA38 */ li	$v0,317
        /* 0021AA3C */ lw	$a1,20($sp)
        /* 0021AA40 */ move	$a0,$s4
        /* 0021AA44 */ li	$a2,2
        /* 0021AA48 */ li	$a3,2
        /* 0021AA4C */ li	$t0,327
        /* 0021AA50 */ li	$t1,183
        /* 0021AA54 */ li	$t2,162
        /* 0021AA58 */ li	$t3,408
        /* 0021AA5C */ jal	0x2078f0
        /* 0021AA60 */ sw	$v0,0($sp)
        /* 0021AA64 */ lui	$v0,0x3f
        /* 0021AA68 */ li	$a0,5
        /* 0021AA6C */ lw	$v1,13496($v0)
        /* 0021AA70 */ lw	$v0,11556($fp)
        /* 0021AA74 */ bne	$v0,$a0,L_0021AA90
        /* 0021AA78 */ lw	$s1,24($v1)
        /* 0021AA7C */ lui	$v0,0x3f
        /* 0021AA80 */ sll	$v1,$s1,0x3
        /* 0021AA84 */ b	L_0021AA9C
        /* 0021AA88 */ addiu	$v0,$v0,19560
        /* 0021AA8C */ nop
L_0021AA90:
        /* 0021AA90 */ lui	$v0,0x3f
        /* 0021AA94 */ sll	$v1,$s1,0x3
        /* 0021AA98 */ addiu	$v0,$v0,19576
L_0021AA9C:
        /* 0021AA9C */ addu	$a1,$v1,$v0
        /* 0021AAA0 */ move	$v1,$a1
        /* 0021AAA4 */ lw	$v0,4($a1)
        /* 0021AAA8 */ lw	$a0,0($v1)
        /* 0021AAAC */ sw	$v0,20($sp)
        /* 0021AAB0 */ sw	$a0,16($sp)
        /* 0021AAB4 */ lw	$a1,16($sp)
        /* 0021AAB8 */ li	$v0,452
        /* 0021AABC */ move	$a0,$s4
        /* 0021AAC0 */ li	$a2,2
        /* 0021AAC4 */ li	$a3,2
        /* 0021AAC8 */ li	$t0,159
        /* 0021AACC */ li	$t1,211
        /* 0021AAD0 */ li	$t2,162
        /* 0021AAD4 */ li	$t3,240
        /* 0021AAD8 */ jal	0x2078f0
        /* 0021AADC */ sw	$v0,0($sp)
        /* 0021AAE0 */ li	$v0,453
        /* 0021AAE4 */ lw	$a1,20($sp)
        /* 0021AAE8 */ move	$a0,$s4
        /* 0021AAEC */ li	$a2,2
        /* 0021AAF0 */ li	$a3,2
        /* 0021AAF4 */ li	$t0,327
        /* 0021AAF8 */ li	$t1,211
        /* 0021AAFC */ li	$t2,162
        /* 0021AB00 */ li	$t3,408
        /* 0021AB04 */ jal	0x2078f0
        /* 0021AB08 */ sw	$v0,0($sp)
        /* 0021AB0C */ lui	$v0,0x3f
        /* 0021AB10 */ li	$a0,6
        /* 0021AB14 */ lw	$v1,13496($v0)
        /* 0021AB18 */ lw	$v0,11556($fp)
        /* 0021AB1C */ bne	$v0,$a0,L_0021AB30
        /* 0021AB20 */ lw	$s1,44($v1)
        /* 0021AB24 */ lui	$v0,0x3f
        /* 0021AB28 */ b	L_0021AB38
        /* 0021AB2C */ lw	$v1,19560($v0)
L_0021AB30:
        /* 0021AB30 */ lui	$v0,0x3f
        /* 0021AB34 */ lw	$v1,19576($v0)
L_0021AB38:
        /* 0021AB38 */ sw	$v1,16($sp)
        /* 0021AB3C */ sll	$v0,$s1,0x2
        /* 0021AB40 */ lw	$a1,16($sp)
        /* 0021AB44 */ lui	$v1,0x3f
        /* 0021AB48 */ addu	$v1,$v1,$v0
        /* 0021AB4C */ lw	$v1,19544($v1)
        /* 0021AB50 */ move	$a0,$s4
        /* 0021AB54 */ li	$a2,2
        /* 0021AB58 */ li	$a3,2
        /* 0021AB5C */ li	$t0,159
        /* 0021AB60 */ li	$t1,239
        /* 0021AB64 */ li	$t2,330
        /* 0021AB68 */ li	$t3,324
        /* 0021AB6C */ jal	0x2078f0
        /* 0021AB70 */ sw	$v1,0($sp)
        /* 0021AB74 */ lw	$v1,11556($fp)
        /* 0021AB78 */ slti	$v0,$v1,5
        /* 0021AB7C */ beqz	$v0,L_epilogue
        /* 0021AB80 */ ld	$s0,48($sp)
        /* 0021AB84 */ sll	$v0,$v1,0x3
        /* 0021AB88 */ move	$a0,$v1
        /* 0021AB8C */ subu	$v0,$v0,$v1
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
