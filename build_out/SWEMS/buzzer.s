	.file	"buzzer.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_f2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.globl	__gedf2
	.section	.text.task_buzzer,"ax",@progbits
	.align	1
	.globl	task_buzzer
	.type	task_buzzer, @function
task_buzzer:
.LFB4:
	.file 1 "/home/parag/bl_iot_sdk/customer_app/SWEMS/SWEMS/buzzer.c"
	.loc 1 24 1
	.cfi_startproc
	.loc 1 26 5
	.loc 1 24 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	.loc 1 26 5
	li	a2,0
	li	a1,0
	li	a0,1
	.loc 1 24 1
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	sw	s4,8(sp)
	sw	s5,4(sp)
	sw	s6,0(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.loc 1 26 5
	call	bl_gpio_enable_output
.LVL0:
	.loc 1 27 5 is_stmt 1
	li	a1,0
	li	a0,1
	call	bl_gpio_output_set
.LVL1:
	.loc 1 31 12 is_stmt 0
	lui	a5,%hi(.LC0)
	lw	s2,%lo(.LC0)(a5)
	lw	s3,%lo(.LC0+4)(a5)
	.loc 1 31 17
	lui	s0,%hi(ppm)
	.loc 1 31 38
	lui	s1,%hi(temp)
	.loc 1 31 43
	li	s4,309
	.loc 1 31 82
	lui	s5,%hi(humidity)
	.loc 1 31 63
	li	s6,799
.L2:
	.loc 1 29 5 is_stmt 1
	.loc 1 31 9
	.loc 1 31 12 is_stmt 0
	lw	a0,%lo(ppm)(s0)
	lw	a1,%lo(ppm+4)(s0)
	mv	a2,s2
	mv	a3,s3
	call	__gedf2
.LVL2:
	bge	a0,zero,.L3
	.loc 1 31 43 discriminator 1
	lhu	a5,%lo(temp)(s1)
	addi	a5,a5,-100
	slli	a5,a5,16
	srli	a5,a5,16
	bgtu	a5,s4,.L3
	.loc 1 31 63 discriminator 3
	lhu	a5,%lo(humidity)(s5)
	bleu	a5,s6,.L4
.L3:
	.loc 1 35 13 is_stmt 1
	li	a1,1
	li	a0,1
	call	bl_gpio_output_set
.LVL3:
	.loc 1 36 13
	li	a0,200
	call	vTaskDelay
.LVL4:
	.loc 1 39 13
	li	a1,0
	li	a0,1
	call	bl_gpio_output_set
.LVL5:
	.loc 1 40 13
	li	a0,100
	call	vTaskDelay
.LVL6:
	j	.L2
.L4:
	.loc 1 44 13
	li	a1,0
	li	a0,1
	call	bl_gpio_output_set
.LVL7:
	j	.L2
	.cfi_endproc
.LFE4:
	.size	task_buzzer, .-task_buzzer
	.section	.rodata.task_buzzer.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	0
	.word	1078198272
	.text
.Letext0:
	.file 2 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/lib/gcc/riscv64-unknown-elf/8.3.0/include/stdint-gcc.h"
	.file 3 "/home/parag/bl_iot_sdk/components/bl602/freertos_riscv_ram/portable/GCC/RISC-V/portmacro.h"
	.file 4 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/lib/gcc/riscv64-unknown-elf/8.3.0/include/stddef.h"
	.file 5 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/riscv64-unknown-elf/include/sys/_types.h"
	.file 6 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/riscv64-unknown-elf/include/sys/reent.h"
	.file 7 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/riscv64-unknown-elf/include/sys/lock.h"
	.file 8 "/home/parag/bl_iot_sdk/components/hal_drv/bl602_hal/bl_gpio.h"
	.file 9 "/home/parag/bl_iot_sdk/components/bl602/freertos_riscv_ram/config/task.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xa5d
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF131
	.byte	0xc
	.4byte	.LASF132
	.4byte	.LASF133
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF0
	.byte	0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF1
	.byte	0x4
	.4byte	.LASF3
	.byte	0x2
	.byte	0x25
	.byte	0x13
	.4byte	0x46
	.byte	0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.byte	0x4
	.4byte	.LASF4
	.byte	0x2
	.byte	0x28
	.byte	0x12
	.4byte	0x59
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF5
	.byte	0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.byte	0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF7
	.byte	0x4
	.4byte	.LASF8
	.byte	0x2
	.byte	0x31
	.byte	0x1c
	.4byte	0x7a
	.byte	0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF9
	.byte	0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.byte	0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.byte	0x5
	.byte	0x4
	.byte	0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x3f
	.byte	0x11
	.4byte	0x4d
	.byte	0x6
	.4byte	.LASF121
	.byte	0x3
	.byte	0x54
	.byte	0x13
	.4byte	0x91
	.byte	0x7
	.byte	0x4
	.4byte	0xb6
	.byte	0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF13
	.byte	0x8
	.4byte	0xaf
	.byte	0x9
	.4byte	.LASF14
	.byte	0x4
	.2byte	0x165
	.byte	0x16
	.4byte	0x2c
	.byte	0x4
	.4byte	.LASF15
	.byte	0x5
	.byte	0x2e
	.byte	0xe
	.4byte	0x59
	.byte	0x4
	.4byte	.LASF16
	.byte	0x5
	.byte	0x74
	.byte	0xe
	.4byte	0x59
	.byte	0x4
	.4byte	.LASF17
	.byte	0x5
	.byte	0x93
	.byte	0x14
	.4byte	0x25
	.byte	0xa
	.byte	0x4
	.byte	0x5
	.byte	0xa5
	.byte	0x3
	.4byte	0x10e
	.byte	0xb
	.4byte	.LASF18
	.byte	0x5
	.byte	0xa7
	.byte	0xc
	.4byte	0xbb
	.byte	0xb
	.4byte	.LASF19
	.byte	0x5
	.byte	0xa8
	.byte	0x13
	.4byte	0x10e
	.byte	0
	.byte	0xc
	.4byte	0x67
	.4byte	0x11e
	.byte	0xd
	.4byte	0x2c
	.byte	0x3
	.byte	0
	.byte	0xe
	.byte	0x8
	.byte	0x5
	.byte	0xa2
	.byte	0x9
	.4byte	0x142
	.byte	0xf
	.4byte	.LASF20
	.byte	0x5
	.byte	0xa4
	.byte	0x7
	.4byte	0x25
	.byte	0
	.byte	0xf
	.4byte	.LASF21
	.byte	0x5
	.byte	0xa9
	.byte	0x5
	.4byte	0xec
	.byte	0x4
	.byte	0
	.byte	0x4
	.4byte	.LASF22
	.byte	0x5
	.byte	0xaa
	.byte	0x3
	.4byte	0x11e
	.byte	0x4
	.4byte	.LASF23
	.byte	0x6
	.byte	0x16
	.byte	0x17
	.4byte	0x81
	.byte	0x4
	.4byte	.LASF24
	.byte	0x7
	.byte	0xc
	.byte	0xd
	.4byte	0x25
	.byte	0x4
	.4byte	.LASF25
	.byte	0x6
	.byte	0x23
	.byte	0x1b
	.4byte	0x15a
	.byte	0x10
	.4byte	.LASF30
	.byte	0x18
	.byte	0x6
	.byte	0x34
	.byte	0x8
	.4byte	0x1cc
	.byte	0xf
	.4byte	.LASF26
	.byte	0x6
	.byte	0x36
	.byte	0x13
	.4byte	0x1cc
	.byte	0
	.byte	0x11
	.string	"_k"
	.byte	0x6
	.byte	0x37
	.byte	0x7
	.4byte	0x25
	.byte	0x4
	.byte	0xf
	.4byte	.LASF27
	.byte	0x6
	.byte	0x37
	.byte	0xb
	.4byte	0x25
	.byte	0x8
	.byte	0xf
	.4byte	.LASF28
	.byte	0x6
	.byte	0x37
	.byte	0x14
	.4byte	0x25
	.byte	0xc
	.byte	0xf
	.4byte	.LASF29
	.byte	0x6
	.byte	0x37
	.byte	0x1b
	.4byte	0x25
	.byte	0x10
	.byte	0x11
	.string	"_x"
	.byte	0x6
	.byte	0x38
	.byte	0xb
	.4byte	0x1d2
	.byte	0x14
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x172
	.byte	0xc
	.4byte	0x14e
	.4byte	0x1e2
	.byte	0xd
	.4byte	0x2c
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF31
	.byte	0x24
	.byte	0x6
	.byte	0x3c
	.byte	0x8
	.4byte	0x265
	.byte	0xf
	.4byte	.LASF32
	.byte	0x6
	.byte	0x3e
	.byte	0x7
	.4byte	0x25
	.byte	0
	.byte	0xf
	.4byte	.LASF33
	.byte	0x6
	.byte	0x3f
	.byte	0x7
	.4byte	0x25
	.byte	0x4
	.byte	0xf
	.4byte	.LASF34
	.byte	0x6
	.byte	0x40
	.byte	0x7
	.4byte	0x25
	.byte	0x8
	.byte	0xf
	.4byte	.LASF35
	.byte	0x6
	.byte	0x41
	.byte	0x7
	.4byte	0x25
	.byte	0xc
	.byte	0xf
	.4byte	.LASF36
	.byte	0x6
	.byte	0x42
	.byte	0x7
	.4byte	0x25
	.byte	0x10
	.byte	0xf
	.4byte	.LASF37
	.byte	0x6
	.byte	0x43
	.byte	0x7
	.4byte	0x25
	.byte	0x14
	.byte	0xf
	.4byte	.LASF38
	.byte	0x6
	.byte	0x44
	.byte	0x7
	.4byte	0x25
	.byte	0x18
	.byte	0xf
	.4byte	.LASF39
	.byte	0x6
	.byte	0x45
	.byte	0x7
	.4byte	0x25
	.byte	0x1c
	.byte	0xf
	.4byte	.LASF40
	.byte	0x6
	.byte	0x46
	.byte	0x7
	.4byte	0x25
	.byte	0x20
	.byte	0
	.byte	0x12
	.4byte	.LASF41
	.2byte	0x108
	.byte	0x6
	.byte	0x4f
	.byte	0x8
	.4byte	0x2aa
	.byte	0xf
	.4byte	.LASF42
	.byte	0x6
	.byte	0x50
	.byte	0x9
	.4byte	0x2aa
	.byte	0
	.byte	0xf
	.4byte	.LASF43
	.byte	0x6
	.byte	0x51
	.byte	0x9
	.4byte	0x2aa
	.byte	0x80
	.byte	0x13
	.4byte	.LASF44
	.byte	0x6
	.byte	0x53
	.byte	0xa
	.4byte	0x14e
	.2byte	0x100
	.byte	0x13
	.4byte	.LASF45
	.byte	0x6
	.byte	0x56
	.byte	0xa
	.4byte	0x14e
	.2byte	0x104
	.byte	0
	.byte	0xc
	.4byte	0x8f
	.4byte	0x2ba
	.byte	0xd
	.4byte	0x2c
	.byte	0x1f
	.byte	0
	.byte	0x12
	.4byte	.LASF46
	.2byte	0x190
	.byte	0x6
	.byte	0x62
	.byte	0x8
	.4byte	0x2fd
	.byte	0xf
	.4byte	.LASF26
	.byte	0x6
	.byte	0x63
	.byte	0x12
	.4byte	0x2fd
	.byte	0
	.byte	0xf
	.4byte	.LASF47
	.byte	0x6
	.byte	0x64
	.byte	0x6
	.4byte	0x25
	.byte	0x4
	.byte	0xf
	.4byte	.LASF48
	.byte	0x6
	.byte	0x66
	.byte	0x9
	.4byte	0x303
	.byte	0x8
	.byte	0xf
	.4byte	.LASF41
	.byte	0x6
	.byte	0x67
	.byte	0x1e
	.4byte	0x265
	.byte	0x88
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x2ba
	.byte	0xc
	.4byte	0x313
	.4byte	0x313
	.byte	0xd
	.4byte	0x2c
	.byte	0x1f
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x319
	.byte	0x14
	.byte	0x10
	.4byte	.LASF49
	.byte	0x8
	.byte	0x6
	.byte	0x7a
	.byte	0x8
	.4byte	0x342
	.byte	0xf
	.4byte	.LASF50
	.byte	0x6
	.byte	0x7b
	.byte	0x11
	.4byte	0x342
	.byte	0
	.byte	0xf
	.4byte	.LASF51
	.byte	0x6
	.byte	0x7c
	.byte	0x6
	.4byte	0x25
	.byte	0x4
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x67
	.byte	0x10
	.4byte	.LASF52
	.byte	0x68
	.byte	0x6
	.byte	0xba
	.byte	0x8
	.4byte	0x48b
	.byte	0x11
	.string	"_p"
	.byte	0x6
	.byte	0xbb
	.byte	0x12
	.4byte	0x342
	.byte	0
	.byte	0x11
	.string	"_r"
	.byte	0x6
	.byte	0xbc
	.byte	0x7
	.4byte	0x25
	.byte	0x4
	.byte	0x11
	.string	"_w"
	.byte	0x6
	.byte	0xbd
	.byte	0x7
	.4byte	0x25
	.byte	0x8
	.byte	0xf
	.4byte	.LASF53
	.byte	0x6
	.byte	0xbe
	.byte	0x9
	.4byte	0x46
	.byte	0xc
	.byte	0xf
	.4byte	.LASF54
	.byte	0x6
	.byte	0xbf
	.byte	0x9
	.4byte	0x46
	.byte	0xe
	.byte	0x11
	.string	"_bf"
	.byte	0x6
	.byte	0xc0
	.byte	0x11
	.4byte	0x31a
	.byte	0x10
	.byte	0xf
	.4byte	.LASF55
	.byte	0x6
	.byte	0xc1
	.byte	0x7
	.4byte	0x25
	.byte	0x18
	.byte	0xf
	.4byte	.LASF56
	.byte	0x6
	.byte	0xc8
	.byte	0xa
	.4byte	0x8f
	.byte	0x1c
	.byte	0xf
	.4byte	.LASF57
	.byte	0x6
	.byte	0xca
	.byte	0xe
	.4byte	0x603
	.byte	0x20
	.byte	0xf
	.4byte	.LASF58
	.byte	0x6
	.byte	0xcc
	.byte	0xe
	.4byte	0x627
	.byte	0x24
	.byte	0xf
	.4byte	.LASF59
	.byte	0x6
	.byte	0xcf
	.byte	0xd
	.4byte	0x64b
	.byte	0x28
	.byte	0xf
	.4byte	.LASF60
	.byte	0x6
	.byte	0xd0
	.byte	0x9
	.4byte	0x665
	.byte	0x2c
	.byte	0x11
	.string	"_ub"
	.byte	0x6
	.byte	0xd3
	.byte	0x11
	.4byte	0x31a
	.byte	0x30
	.byte	0x11
	.string	"_up"
	.byte	0x6
	.byte	0xd4
	.byte	0x12
	.4byte	0x342
	.byte	0x38
	.byte	0x11
	.string	"_ur"
	.byte	0x6
	.byte	0xd5
	.byte	0x7
	.4byte	0x25
	.byte	0x3c
	.byte	0xf
	.4byte	.LASF61
	.byte	0x6
	.byte	0xd8
	.byte	0x11
	.4byte	0x66b
	.byte	0x40
	.byte	0xf
	.4byte	.LASF62
	.byte	0x6
	.byte	0xd9
	.byte	0x11
	.4byte	0x67b
	.byte	0x43
	.byte	0x11
	.string	"_lb"
	.byte	0x6
	.byte	0xdc
	.byte	0x11
	.4byte	0x31a
	.byte	0x44
	.byte	0xf
	.4byte	.LASF63
	.byte	0x6
	.byte	0xdf
	.byte	0x7
	.4byte	0x25
	.byte	0x4c
	.byte	0xf
	.4byte	.LASF64
	.byte	0x6
	.byte	0xe0
	.byte	0xa
	.4byte	0xc8
	.byte	0x50
	.byte	0xf
	.4byte	.LASF65
	.byte	0x6
	.byte	0xe3
	.byte	0x12
	.4byte	0x4a9
	.byte	0x54
	.byte	0xf
	.4byte	.LASF66
	.byte	0x6
	.byte	0xe7
	.byte	0xc
	.4byte	0x166
	.byte	0x58
	.byte	0xf
	.4byte	.LASF67
	.byte	0x6
	.byte	0xe9
	.byte	0xe
	.4byte	0x142
	.byte	0x5c
	.byte	0xf
	.4byte	.LASF68
	.byte	0x6
	.byte	0xea
	.byte	0x7
	.4byte	0x25
	.byte	0x64
	.byte	0
	.byte	0x15
	.4byte	0xe0
	.4byte	0x4a9
	.byte	0x16
	.4byte	0x4a9
	.byte	0x16
	.4byte	0x8f
	.byte	0x16
	.4byte	0x5fd
	.byte	0x16
	.4byte	0x25
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x4b4
	.byte	0x8
	.4byte	0x4a9
	.byte	0x17
	.4byte	.LASF69
	.2byte	0x428
	.byte	0x6
	.2byte	0x265
	.byte	0x8
	.4byte	0x5fd
	.byte	0x18
	.4byte	.LASF70
	.byte	0x6
	.2byte	0x267
	.byte	0x7
	.4byte	0x25
	.byte	0
	.byte	0x18
	.4byte	.LASF71
	.byte	0x6
	.2byte	0x26c
	.byte	0xb
	.4byte	0x6d7
	.byte	0x4
	.byte	0x18
	.4byte	.LASF72
	.byte	0x6
	.2byte	0x26c
	.byte	0x14
	.4byte	0x6d7
	.byte	0x8
	.byte	0x18
	.4byte	.LASF73
	.byte	0x6
	.2byte	0x26c
	.byte	0x1e
	.4byte	0x6d7
	.byte	0xc
	.byte	0x18
	.4byte	.LASF74
	.byte	0x6
	.2byte	0x26e
	.byte	0x7
	.4byte	0x25
	.byte	0x10
	.byte	0x18
	.4byte	.LASF75
	.byte	0x6
	.2byte	0x26f
	.byte	0x8
	.4byte	0x8d7
	.byte	0x14
	.byte	0x18
	.4byte	.LASF76
	.byte	0x6
	.2byte	0x272
	.byte	0x7
	.4byte	0x25
	.byte	0x30
	.byte	0x18
	.4byte	.LASF77
	.byte	0x6
	.2byte	0x273
	.byte	0x16
	.4byte	0x8ec
	.byte	0x34
	.byte	0x18
	.4byte	.LASF78
	.byte	0x6
	.2byte	0x275
	.byte	0x7
	.4byte	0x25
	.byte	0x38
	.byte	0x18
	.4byte	.LASF79
	.byte	0x6
	.2byte	0x277
	.byte	0xa
	.4byte	0x8fd
	.byte	0x3c
	.byte	0x18
	.4byte	.LASF80
	.byte	0x6
	.2byte	0x27a
	.byte	0x13
	.4byte	0x1cc
	.byte	0x40
	.byte	0x18
	.4byte	.LASF81
	.byte	0x6
	.2byte	0x27b
	.byte	0x7
	.4byte	0x25
	.byte	0x44
	.byte	0x18
	.4byte	.LASF82
	.byte	0x6
	.2byte	0x27c
	.byte	0x13
	.4byte	0x1cc
	.byte	0x48
	.byte	0x18
	.4byte	.LASF83
	.byte	0x6
	.2byte	0x27d
	.byte	0x14
	.4byte	0x903
	.byte	0x4c
	.byte	0x18
	.4byte	.LASF84
	.byte	0x6
	.2byte	0x280
	.byte	0x7
	.4byte	0x25
	.byte	0x50
	.byte	0x18
	.4byte	.LASF85
	.byte	0x6
	.2byte	0x281
	.byte	0x9
	.4byte	0x5fd
	.byte	0x54
	.byte	0x18
	.4byte	.LASF86
	.byte	0x6
	.2byte	0x2a4
	.byte	0x7
	.4byte	0x8b2
	.byte	0x58
	.byte	0x19
	.4byte	.LASF46
	.byte	0x6
	.2byte	0x2a8
	.byte	0x13
	.4byte	0x2fd
	.2byte	0x148
	.byte	0x19
	.4byte	.LASF87
	.byte	0x6
	.2byte	0x2a9
	.byte	0x12
	.4byte	0x2ba
	.2byte	0x14c
	.byte	0x19
	.4byte	.LASF88
	.byte	0x6
	.2byte	0x2ad
	.byte	0xc
	.4byte	0x914
	.2byte	0x2dc
	.byte	0x19
	.4byte	.LASF89
	.byte	0x6
	.2byte	0x2b2
	.byte	0x10
	.4byte	0x698
	.2byte	0x2e0
	.byte	0x19
	.4byte	.LASF90
	.byte	0x6
	.2byte	0x2b4
	.byte	0xa
	.4byte	0x920
	.2byte	0x2ec
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xaf
	.byte	0x7
	.byte	0x4
	.4byte	0x48b
	.byte	0x15
	.4byte	0xe0
	.4byte	0x627
	.byte	0x16
	.4byte	0x4a9
	.byte	0x16
	.4byte	0x8f
	.byte	0x16
	.4byte	0xa9
	.byte	0x16
	.4byte	0x25
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x609
	.byte	0x15
	.4byte	0xd4
	.4byte	0x64b
	.byte	0x16
	.4byte	0x4a9
	.byte	0x16
	.4byte	0x8f
	.byte	0x16
	.4byte	0xd4
	.byte	0x16
	.4byte	0x25
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x62d
	.byte	0x15
	.4byte	0x25
	.4byte	0x665
	.byte	0x16
	.4byte	0x4a9
	.byte	0x16
	.4byte	0x8f
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x651
	.byte	0xc
	.4byte	0x67
	.4byte	0x67b
	.byte	0xd
	.4byte	0x2c
	.byte	0x2
	.byte	0
	.byte	0xc
	.4byte	0x67
	.4byte	0x68b
	.byte	0xd
	.4byte	0x2c
	.byte	0
	.byte	0
	.byte	0x9
	.4byte	.LASF91
	.byte	0x6
	.2byte	0x124
	.byte	0x18
	.4byte	0x348
	.byte	0x1a
	.4byte	.LASF92
	.byte	0xc
	.byte	0x6
	.2byte	0x128
	.byte	0x8
	.4byte	0x6d1
	.byte	0x18
	.4byte	.LASF26
	.byte	0x6
	.2byte	0x12a
	.byte	0x11
	.4byte	0x6d1
	.byte	0
	.byte	0x18
	.4byte	.LASF93
	.byte	0x6
	.2byte	0x12b
	.byte	0x7
	.4byte	0x25
	.byte	0x4
	.byte	0x18
	.4byte	.LASF94
	.byte	0x6
	.2byte	0x12c
	.byte	0xb
	.4byte	0x6d7
	.byte	0x8
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x698
	.byte	0x7
	.byte	0x4
	.4byte	0x68b
	.byte	0x1a
	.4byte	.LASF95
	.byte	0xe
	.byte	0x6
	.2byte	0x144
	.byte	0x8
	.4byte	0x716
	.byte	0x18
	.4byte	.LASF96
	.byte	0x6
	.2byte	0x145
	.byte	0x12
	.4byte	0x716
	.byte	0
	.byte	0x18
	.4byte	.LASF97
	.byte	0x6
	.2byte	0x146
	.byte	0x12
	.4byte	0x716
	.byte	0x6
	.byte	0x18
	.4byte	.LASF98
	.byte	0x6
	.2byte	0x147
	.byte	0x12
	.4byte	0x7a
	.byte	0xc
	.byte	0
	.byte	0xc
	.4byte	0x7a
	.4byte	0x726
	.byte	0xd
	.4byte	0x2c
	.byte	0x2
	.byte	0
	.byte	0x1b
	.byte	0xd0
	.byte	0x6
	.2byte	0x285
	.byte	0x7
	.4byte	0x83b
	.byte	0x18
	.4byte	.LASF99
	.byte	0x6
	.2byte	0x287
	.byte	0x18
	.4byte	0x2c
	.byte	0
	.byte	0x18
	.4byte	.LASF100
	.byte	0x6
	.2byte	0x288
	.byte	0x12
	.4byte	0x5fd
	.byte	0x4
	.byte	0x18
	.4byte	.LASF101
	.byte	0x6
	.2byte	0x289
	.byte	0x10
	.4byte	0x83b
	.byte	0x8
	.byte	0x18
	.4byte	.LASF102
	.byte	0x6
	.2byte	0x28a
	.byte	0x17
	.4byte	0x1e2
	.byte	0x24
	.byte	0x18
	.4byte	.LASF103
	.byte	0x6
	.2byte	0x28b
	.byte	0xf
	.4byte	0x25
	.byte	0x48
	.byte	0x18
	.4byte	.LASF104
	.byte	0x6
	.2byte	0x28c
	.byte	0x2c
	.4byte	0x88
	.byte	0x50
	.byte	0x18
	.4byte	.LASF105
	.byte	0x6
	.2byte	0x28d
	.byte	0x1a
	.4byte	0x6dd
	.byte	0x58
	.byte	0x18
	.4byte	.LASF106
	.byte	0x6
	.2byte	0x28e
	.byte	0x16
	.4byte	0x142
	.byte	0x68
	.byte	0x18
	.4byte	.LASF107
	.byte	0x6
	.2byte	0x28f
	.byte	0x16
	.4byte	0x142
	.byte	0x70
	.byte	0x18
	.4byte	.LASF108
	.byte	0x6
	.2byte	0x290
	.byte	0x16
	.4byte	0x142
	.byte	0x78
	.byte	0x18
	.4byte	.LASF109
	.byte	0x6
	.2byte	0x291
	.byte	0x10
	.4byte	0x84b
	.byte	0x80
	.byte	0x18
	.4byte	.LASF110
	.byte	0x6
	.2byte	0x292
	.byte	0x10
	.4byte	0x85b
	.byte	0x88
	.byte	0x18
	.4byte	.LASF111
	.byte	0x6
	.2byte	0x293
	.byte	0xf
	.4byte	0x25
	.byte	0xa0
	.byte	0x18
	.4byte	.LASF112
	.byte	0x6
	.2byte	0x294
	.byte	0x16
	.4byte	0x142
	.byte	0xa4
	.byte	0x18
	.4byte	.LASF113
	.byte	0x6
	.2byte	0x295
	.byte	0x16
	.4byte	0x142
	.byte	0xac
	.byte	0x18
	.4byte	.LASF114
	.byte	0x6
	.2byte	0x296
	.byte	0x16
	.4byte	0x142
	.byte	0xb4
	.byte	0x18
	.4byte	.LASF115
	.byte	0x6
	.2byte	0x297
	.byte	0x16
	.4byte	0x142
	.byte	0xbc
	.byte	0x18
	.4byte	.LASF116
	.byte	0x6
	.2byte	0x298
	.byte	0x16
	.4byte	0x142
	.byte	0xc4
	.byte	0x18
	.4byte	.LASF117
	.byte	0x6
	.2byte	0x299
	.byte	0x8
	.4byte	0x25
	.byte	0xcc
	.byte	0
	.byte	0xc
	.4byte	0xaf
	.4byte	0x84b
	.byte	0xd
	.4byte	0x2c
	.byte	0x19
	.byte	0
	.byte	0xc
	.4byte	0xaf
	.4byte	0x85b
	.byte	0xd
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.byte	0xc
	.4byte	0xaf
	.4byte	0x86b
	.byte	0xd
	.4byte	0x2c
	.byte	0x17
	.byte	0
	.byte	0x1b
	.byte	0xf0
	.byte	0x6
	.2byte	0x29e
	.byte	0x7
	.4byte	0x892
	.byte	0x18
	.4byte	.LASF118
	.byte	0x6
	.2byte	0x2a1
	.byte	0x1b
	.4byte	0x892
	.byte	0
	.byte	0x18
	.4byte	.LASF119
	.byte	0x6
	.2byte	0x2a2
	.byte	0x18
	.4byte	0x8a2
	.byte	0x78
	.byte	0
	.byte	0xc
	.4byte	0x342
	.4byte	0x8a2
	.byte	0xd
	.4byte	0x2c
	.byte	0x1d
	.byte	0
	.byte	0xc
	.4byte	0x2c
	.4byte	0x8b2
	.byte	0xd
	.4byte	0x2c
	.byte	0x1d
	.byte	0
	.byte	0x1c
	.byte	0xf0
	.byte	0x6
	.2byte	0x283
	.byte	0x3
	.4byte	0x8d7
	.byte	0x1d
	.4byte	.LASF69
	.byte	0x6
	.2byte	0x29a
	.byte	0xb
	.4byte	0x726
	.byte	0x1d
	.4byte	.LASF120
	.byte	0x6
	.2byte	0x2a3
	.byte	0xb
	.4byte	0x86b
	.byte	0
	.byte	0xc
	.4byte	0xaf
	.4byte	0x8e7
	.byte	0xd
	.4byte	0x2c
	.byte	0x18
	.byte	0
	.byte	0x1e
	.4byte	.LASF134
	.byte	0x7
	.byte	0x4
	.4byte	0x8e7
	.byte	0x1f
	.4byte	0x8fd
	.byte	0x16
	.4byte	0x4a9
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x8f2
	.byte	0x7
	.byte	0x4
	.4byte	0x1cc
	.byte	0x1f
	.4byte	0x914
	.byte	0x16
	.4byte	0x25
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x91a
	.byte	0x7
	.byte	0x4
	.4byte	0x909
	.byte	0xc
	.4byte	0x68b
	.4byte	0x930
	.byte	0xd
	.4byte	0x2c
	.byte	0x2
	.byte	0
	.byte	0x20
	.4byte	.LASF122
	.byte	0x6
	.2byte	0x333
	.byte	0x17
	.4byte	0x4a9
	.byte	0x20
	.4byte	.LASF123
	.byte	0x6
	.2byte	0x334
	.byte	0x1d
	.4byte	0x4af
	.byte	0x6
	.4byte	.LASF124
	.byte	0x1
	.byte	0x13
	.byte	0xc
	.4byte	0x25
	.byte	0x6
	.4byte	.LASF125
	.byte	0x1
	.byte	0x14
	.byte	0x11
	.4byte	0x6e
	.byte	0x6
	.4byte	.LASF126
	.byte	0x1
	.byte	0x15
	.byte	0x10
	.4byte	0x3a
	.byte	0x21
	.string	"ppm"
	.byte	0x1
	.byte	0x16
	.byte	0xf
	.4byte	0x97a
	.byte	0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF127
	.byte	0x22
	.4byte	.LASF135
	.byte	0x1
	.byte	0x17
	.byte	0x6
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x1
	.byte	0x9c
	.4byte	0xa3b
	.byte	0x23
	.4byte	.LVL0
	.4byte	0xa3b
	.4byte	0x9b4
	.byte	0x24
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x24
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x24
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x23
	.4byte	.LVL1
	.4byte	0xa47
	.4byte	0x9cc
	.byte	0x24
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x24
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x23
	.4byte	.LVL3
	.4byte	0xa47
	.4byte	0x9e4
	.byte	0x24
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x24
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x23
	.4byte	.LVL4
	.4byte	0xa53
	.4byte	0x9f8
	.byte	0x24
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0xc8
	.byte	0
	.byte	0x23
	.4byte	.LVL5
	.4byte	0xa47
	.4byte	0xa11
	.byte	0x24
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x24
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x23
	.4byte	.LVL6
	.4byte	0xa53
	.4byte	0xa25
	.byte	0x24
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.byte	0x25
	.4byte	.LVL7
	.4byte	0xa47
	.byte	0x24
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x24
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0
	.byte	0x26
	.4byte	.LASF128
	.4byte	.LASF128
	.byte	0x8
	.byte	0x2c
	.byte	0x5
	.byte	0x26
	.4byte	.LASF129
	.4byte	.LASF129
	.byte	0x8
	.byte	0x2e
	.byte	0x5
	.byte	0x27
	.4byte	.LASF130
	.4byte	.LASF130
	.byte	0x9
	.2byte	0x2f6
	.byte	0x6
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0x1b
	.byte	0xe
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x17
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x13
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x13
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x17
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0xd
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x13
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x1f
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x20
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x21
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x22
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x96,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x23
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x24
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x25
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0xe
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x27
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0xe
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LFB4
	.4byte	.LFE4
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF41:
	.string	"_on_exit_args"
.LASF108:
	.string	"_wctomb_state"
.LASF105:
	.string	"_r48"
.LASF110:
	.string	"_signal_buf"
.LASF0:
	.string	"unsigned int"
.LASF55:
	.string	"_lbfsize"
.LASF53:
	.string	"_flags"
.LASF128:
	.string	"bl_gpio_enable_output"
.LASF70:
	.string	"_errno"
.LASF24:
	.string	"_LOCK_RECURSIVE_T"
.LASF57:
	.string	"_read"
.LASF112:
	.string	"_mbrlen_state"
.LASF72:
	.string	"_stdout"
.LASF16:
	.string	"_fpos_t"
.LASF48:
	.string	"_fns"
.LASF56:
	.string	"_cookie"
.LASF30:
	.string	"_Bigint"
.LASF38:
	.string	"__tm_wday"
.LASF80:
	.string	"_result"
.LASF34:
	.string	"__tm_hour"
.LASF20:
	.string	"__count"
.LASF33:
	.string	"__tm_min"
.LASF122:
	.string	"_impure_ptr"
.LASF118:
	.string	"_nextf"
.LASF3:
	.string	"int16_t"
.LASF95:
	.string	"_rand48"
.LASF81:
	.string	"_result_k"
.LASF11:
	.string	"long long unsigned int"
.LASF101:
	.string	"_asctime_buf"
.LASF52:
	.string	"__sFILE"
.LASF29:
	.string	"_wds"
.LASF91:
	.string	"__FILE"
.LASF64:
	.string	"_offset"
.LASF75:
	.string	"_emergency"
.LASF121:
	.string	"TrapNetCounter"
.LASF32:
	.string	"__tm_sec"
.LASF39:
	.string	"__tm_yday"
.LASF74:
	.string	"_inc"
.LASF47:
	.string	"_ind"
.LASF26:
	.string	"_next"
.LASF114:
	.string	"_mbsrtowcs_state"
.LASF133:
	.string	"/home/parag/bl_iot_sdk/customer_app/SWEMS/build_out/SWEMS"
.LASF130:
	.string	"vTaskDelay"
.LASF21:
	.string	"__value"
.LASF82:
	.string	"_p5s"
.LASF116:
	.string	"_wcsrtombs_state"
.LASF106:
	.string	"_mblen_state"
.LASF13:
	.string	"char"
.LASF35:
	.string	"__tm_mday"
.LASF88:
	.string	"_sig_func"
.LASF113:
	.string	"_mbrtowc_state"
.LASF87:
	.string	"_atexit0"
.LASF25:
	.string	"_flock_t"
.LASF18:
	.string	"__wch"
.LASF94:
	.string	"_iobs"
.LASF60:
	.string	"_close"
.LASF78:
	.string	"__sdidinit"
.LASF71:
	.string	"_stdin"
.LASF103:
	.string	"_gamma_signgam"
.LASF6:
	.string	"long long int"
.LASF50:
	.string	"_base"
.LASF83:
	.string	"_freelist"
.LASF97:
	.string	"_mult"
.LASF23:
	.string	"__ULong"
.LASF132:
	.string	"/home/parag/bl_iot_sdk/customer_app/SWEMS/SWEMS/buzzer.c"
.LASF115:
	.string	"_wcrtomb_state"
.LASF12:
	.string	"BaseType_t"
.LASF54:
	.string	"_file"
.LASF79:
	.string	"__cleanup"
.LASF22:
	.string	"_mbstate_t"
.LASF131:
	.string	"GNU C99 8.3.0 -march=rv32imfc -mabi=ilp32f -gdwarf -Os -std=gnu99 -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -fshort-enums -ffreestanding -fno-strict-aliasing"
.LASF42:
	.string	"_fnargs"
.LASF40:
	.string	"__tm_isdst"
.LASF117:
	.string	"_h_errno"
.LASF36:
	.string	"__tm_mon"
.LASF8:
	.string	"uint16_t"
.LASF58:
	.string	"_write"
.LASF124:
	.string	"buzz"
.LASF135:
	.string	"task_buzzer"
.LASF46:
	.string	"_atexit"
.LASF67:
	.string	"_mbstate"
.LASF129:
	.string	"bl_gpio_output_set"
.LASF2:
	.string	"short int"
.LASF5:
	.string	"long int"
.LASF90:
	.string	"__sf"
.LASF28:
	.string	"_sign"
.LASF126:
	.string	"temp"
.LASF65:
	.string	"_data"
.LASF19:
	.string	"__wchb"
.LASF123:
	.string	"_global_impure_ptr"
.LASF37:
	.string	"__tm_year"
.LASF102:
	.string	"_localtime_buf"
.LASF120:
	.string	"_unused"
.LASF86:
	.string	"_new"
.LASF84:
	.string	"_cvtlen"
.LASF27:
	.string	"_maxwds"
.LASF109:
	.string	"_l64a_buf"
.LASF63:
	.string	"_blksize"
.LASF31:
	.string	"__tm"
.LASF66:
	.string	"_lock"
.LASF10:
	.string	"long unsigned int"
.LASF93:
	.string	"_niobs"
.LASF14:
	.string	"wint_t"
.LASF4:
	.string	"int32_t"
.LASF43:
	.string	"_dso_handle"
.LASF85:
	.string	"_cvtbuf"
.LASF7:
	.string	"unsigned char"
.LASF111:
	.string	"_getdate_err"
.LASF98:
	.string	"_add"
.LASF49:
	.string	"__sbuf"
.LASF92:
	.string	"_glue"
.LASF89:
	.string	"__sglue"
.LASF100:
	.string	"_strtok_last"
.LASF107:
	.string	"_mbtowc_state"
.LASF77:
	.string	"_locale"
.LASF17:
	.string	"_ssize_t"
.LASF1:
	.string	"signed char"
.LASF69:
	.string	"_reent"
.LASF9:
	.string	"short unsigned int"
.LASF44:
	.string	"_fntypes"
.LASF51:
	.string	"_size"
.LASF127:
	.string	"double"
.LASF15:
	.string	"_off_t"
.LASF62:
	.string	"_nbuf"
.LASF99:
	.string	"_unused_rand"
.LASF76:
	.string	"_unspecified_locale_info"
.LASF125:
	.string	"humidity"
.LASF68:
	.string	"_flags2"
.LASF45:
	.string	"_is_cxa"
.LASF96:
	.string	"_seed"
.LASF104:
	.string	"_rand_next"
.LASF134:
	.string	"__locale_t"
.LASF59:
	.string	"_seek"
.LASF73:
	.string	"_stderr"
.LASF119:
	.string	"_nmalloc"
.LASF61:
	.string	"_ubuf"
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"
