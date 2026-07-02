/*
 * Generated from a Ghidra listing export.
 *
 * Source range: 0x0020FC58-0x0020FEA0
 * Internal branches/jumps were relocated to local labels.
 */

        .set noreorder
        .set noat

        .globl cave_items_gummi_handler

cave_items_gummi_handler:
        /* 0020FC58 */ addiu	$sp,$sp,-848
        /* 0020FC5C */ sd	$s0,768($sp)
        /* 0020FC60 */ sd	$s1,776($sp)
        /* 0020FC64 */ move	$s1,$a0
        /* 0020FC68 */ sd	$s2,784($sp)
        /* 0020FC6C */ move	$s2,$zero
        /* 0020FC70 */ sd	$s7,824($sp)
        /* 0020FC74 */ sd	$s3,792($sp)
        /* 0020FC78 */ sd	$s4,800($sp)
        /* 0020FC7C */ sd	$s5,808($sp)
        /* 0020FC80 */ sd	$s6,816($sp)
        /* 0020FC84 */ sd	$ra,832($sp)
        /* 0020FC88 */ jal	0x1ba3d8
        /* 0020FC8C */ lui	$s7,0x64
        /* 0020FC90 */ move	$s0,$v0
        /* 0020FC94 */ addiu	$v0,$s7,7064
        /* 0020FC98 */ blez	$s0,L_0020FCE0
        /* 0020FC9C */ sw	$zero,0($v0)
        /* 0020FCA0 */ move	$s3,$v0
        /* 0020FCA4 */ nop
L_0020FCA8:
        /* 0020FCA8 */ jal	0x1ba3f0
        /* 0020FCAC */ move	$a0,$s2
        /* 0020FCB0 */ beqzl	$v0,L_0020FCD4
        /* 0020FCB4 */ addiu	$s2,$s2,1
        /* 0020FCB8 */ lw	$v0,0($s3)
        /* 0020FCBC */ addiu	$a0,$v0,1
        /* 0020FCC0 */ sll	$v0,$v0,0x2
        /* 0020FCC4 */ addu	$v1,$sp,$v0
        /* 0020FCC8 */ sw	$a0,0($s3)
        /* 0020FCCC */ sw	$s2,0($v1)
        /* 0020FCD0 */ addiu	$s2,$s2,1
L_0020FCD4:
        /* 0020FCD4 */ slt	$v0,$s2,$s0
        /* 0020FCD8 */ bnez	$v0,L_0020FCA8
        /* 0020FCDC */ nop
L_0020FCE0:
        /* 0020FCE0 */ lw	$a1,7064($s7)
        /* 0020FCE4 */ beqzl	$a1,L_0020FE78
        /* 0020FCE8 */ ld	$s0,768($sp)
        /* 0020FCEC */ jal	0x1fd5e0
        /* 0020FCF0 */ move	$a0,$s1
        /* 0020FCF4 */ move	$a0,$s1
        /* 0020FCF8 */ jal	0x1fd610
        /* 0020FCFC */ li	$a1,8
        /* 0020FD00 */ jal	0x1fd688
        /* 0020FD04 */ move	$a0,$s1
        /* 0020FD08 */ jal	0x1f42b8
        /* 0020FD0C */ move	$a0,$s1
        /* 0020FD10 */ beqz	$v0,L_0020FDCC
        /* 0020FD14 */ lui	$v0,0x42
        /* 0020FD18 */ lw	$a0,23496($v0)
        /* 0020FD1C */ lw	$v1,8($a0)
        /* 0020FD20 */ andi	$v1,$v1,0x4000
        /* 0020FD24 */ beqz	$v1,L_0020FD48
        /* 0020FD28 */ nop
        /* 0020FD2C */ jal	0x1f3758
        /* 0020FD30 */ move	$a0,$s1
        /* 0020FD34 */ jal	0x11d768
        /* 0020FD38 */ li	$a0,3
        /* 0020FD3C */ lui	$v0,0x64
        /* 0020FD40 */ b	L_0020FDCC
        /* 0020FD44 */ sw	$zero,4644($v0)
L_0020FD48:
        /* 0020FD48 */ jal	0x1fd858
        /* 0020FD4C */ move	$a0,$s1
        /* 0020FD50 */ move	$a0,$s1
        /* 0020FD54 */ jal	0x20bd18
        /* 0020FD58 */ li	$a1,8
        /* 0020FD5C */ lui	$a1,0x64
        /* 0020FD60 */ lhu	$v1,208($s1)
        /* 0020FD64 */ lui	$a2,0x64
        /* 0020FD68 */ move	$a0,$s1
        /* 0020FD6C */ sll	$v1,$v1,0x10
        /* 0020FD70 */ sra	$v1,$v1,0x14
        /* 0020FD74 */ sw	$v1,4716($a1)
        /* 0020FD78 */ lhu	$v0,210($s1)
        /* 0020FD7C */ sll	$v0,$v0,0x10
        /* 0020FD80 */ sra	$v0,$v0,0x14
        /* 0020FD84 */ jal	0x1fd548
        /* 0020FD88 */ sw	$v0,4720($a2)
        /* 0020FD8C */ sll	$v0,$v0,0x2
        /* 0020FD90 */ lw	$s0,16($s1)
        /* 0020FD94 */ addu	$v1,$sp,$v0
        /* 0020FD98 */ beqz	$s0,L_0020FDAC
        /* 0020FD9C */ lw	$a0,0($v1)
        /* 0020FDA0 */ jal	0x1ba268
        /* 0020FDA4 */ nop
        /* 0020FDA8 */ sw	$v0,64($s0)
L_0020FDAC:
        /* 0020FDAC */ jal	0x1fe570
        /* 0020FDB0 */ move	$a0,$s1
        /* 0020FDB4 */ beqzl	$v0,L_0020FDD0
        /* 0020FDB8 */ move	$a0,$s1
        /* 0020FDBC */ jal	0x1f3758
        /* 0020FDC0 */ move	$a0,$s1
        /* 0020FDC4 */ lui	$v1,0x64
        /* 0020FDC8 */ sw	$zero,4644($v1)
L_0020FDCC:
        /* 0020FDCC */ move	$a0,$s1
L_0020FDD0:
        /* 0020FDD0 */ jal	0x202fc0
        /* 0020FDD4 */ move	$s2,$zero
        /* 0020FDD8 */ jal	0x1fd518
        /* 0020FDDC */ move	$a0,$s1
        /* 0020FDE0 */ move	$a0,$s1
        /* 0020FDE4 */ jal	0x1fd618
        /* 0020FDE8 */ move	$s6,$v0
        /* 0020FDEC */ move	$a0,$s1
        /* 0020FDF0 */ jal	0x1fd590
        /* 0020FDF4 */ move	$s0,$v0
        /* 0020FDF8 */ lw	$s5,40($s1)
        /* 0020FDFC */ move	$a0,$s1
        /* 0020FE00 */ jal	0x1f8ee0
        /* 0020FE04 */ move	$s4,$v0
        /* 0020FE08 */ lw	$v0,7064($s7)
        /* 0020FE0C */ slt	$v0,$s0,$v0
        /* 0020FE10 */ beqz	$v0,L_0020FE6C
        /* 0020FE14 */ sll	$v0,$s0,0x2
        /* 0020FE18 */ addu	$s3,$v0,$sp
        /* 0020FE1C */ lw	$t1,0($s3)
L_0020FE20:
        /* 0020FE20 */ addiu	$s3,$s3,4
        /* 0020FE24 */ beqz	$s5,L_0020FE34
        /* 0020FE28 */ li	$a1,2
        /* 0020FE2C */ xor	$v0,$s2,$s6
        /* 0020FE30 */ sltiu	$a1,$v0,1
L_0020FE34:
        /* 0020FE34 */ move	$a3,$s4
        /* 0020FE38 */ addiu	$s4,$s4,28
        /* 0020FE3C */ move	$a0,$s1
        /* 0020FE40 */ move	$a2,$zero
        /* 0020FE44 */ li	$t0,166
        /* 0020FE48 */ jal	0x20e090
        /* 0020FE4C */ addiu	$s2,$s2,1
        /* 0020FE50 */ slti	$v0,$s2,9
        /* 0020FE54 */ beqz	$v0,L_0020FE6C
        /* 0020FE58 */ addiu	$s0,$s0,1
        /* 0020FE5C */ lw	$v0,7064($s7)
        /* 0020FE60 */ slt	$v0,$s0,$v0
        /* 0020FE64 */ bnezl	$v0,L_0020FE20
        /* 0020FE68 */ lw	$t1,0($s3)
L_0020FE6C:
        /* 0020FE6C */ jal	0x1f8f30
        /* 0020FE70 */ nop
        /* 0020FE74 */ ld	$s0,768($sp)
L_0020FE78:
        /* 0020FE78 */ ld	$s1,776($sp)
        /* 0020FE7C */ ld	$s2,784($sp)
        /* 0020FE80 */ ld	$s3,792($sp)
        /* 0020FE84 */ ld	$s4,800($sp)
        /* 0020FE88 */ ld	$s5,808($sp)
        /* 0020FE8C */ ld	$s6,816($sp)
        /* 0020FE90 */ ld	$s7,824($sp)
        /* 0020FE94 */ ld	$ra,832($sp)
        /* 0020FE98 */ jr	$ra
        /* 0020FE9C */ addiu	$sp,$sp,848
