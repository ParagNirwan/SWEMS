	.file	"mq4.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0_f2p0_c2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.init_adc.part.0,"ax",@progbits
	.align	1
	.type	init_adc.part.0, @function
init_adc.part.0:
.LFB32:
	.file 1 "/home/parag/bl_iot_sdk/customer_app/SWEMS/SWEMS/mq4.c"
	.loc 1 97 6
	.cfi_startproc
.LVL0:
	.loc 1 103 5
	.loc 1 110 3
	.loc 1 97 6 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 110 3
	li	a1,4096
	li	a0,1
	.loc 1 97 6
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.loc 1 110 3
	call	bl_adc_freq_init
.LVL1:
	.loc 1 112 3 is_stmt 1
	li	a1,14
	li	a0,1
	call	bl_adc_init
.LVL2:
	.loc 1 114 3
.LBB10:
.LBB11:
	.loc 1 69 3
	.loc 1 69 12 is_stmt 0
	li	a3,1073807360
	lw	a5,-1772(a3)
.LVL3:
	.loc 1 71 3 is_stmt 1
	.loc 1 72 3
	.loc 1 74 3
	.loc 1 76 5
	.loc 1 83 3
	li	a4,-264355840
	addi	a4,a4,-1
	and	a5,a5,a4
.LVL4:
	.loc 1 84 3
	.loc 1 86 5
	.loc 1 86 9 is_stmt 0
	li	a4,37822464
	or	a5,a5,a4
.LVL5:
	.loc 1 93 3 is_stmt 1
	.loc 1 93 59 is_stmt 0
	sw	a5,-1772(a3)
	.loc 1 94 3 is_stmt 1
.LVL6:
.LBE11:
.LBE10:
	.loc 1 116 3
	li	a1,1024
	li	a0,1
	call	bl_adc_dma_init
.LVL7:
	.loc 1 118 3
	li	a0,14
	call	bl_adc_gpio_init
.LVL8:
	.loc 1 120 3
	.loc 1 120 17 is_stmt 0
	li	a0,14
	call	bl_adc_get_channel_by_gpio
.LVL9:
	mv	s0,a0
.LVL10:
	.loc 1 121 3 is_stmt 1
	.loc 1 121 20 is_stmt 0
	li	a0,1
	call	bl_dma_find_ctx_by_channel
.LVL11:
	.loc 1 122 3 is_stmt 1
	.loc 1 122 30 is_stmt 0
	li	a5,1
	sll	a4,a5,s0
	.loc 1 122 24
	lw	a5,16(a0)
	or	a5,a5,a4
	sw	a5,16(a0)
	.loc 1 124 3 is_stmt 1
	.loc 1 125 1 is_stmt 0
	lw	s0,8(sp)
	.cfi_restore 8
.LVL12:
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 1 124 3
	tail	bl_adc_start
.LVL13:
	.cfi_endproc
.LFE32:
	.size	init_adc.part.0, .-init_adc.part.0
	.globl	__gedf2
	.section	.text.task_buzzer,"ax",@progbits
	.align	1
	.globl	task_buzzer
	.type	task_buzzer, @function
task_buzzer:
.LFB5:
	.file 2 "/home/parag/bl_iot_sdk/customer_app/SWEMS/SWEMS/buzzer.c"
	.loc 2 24 1 is_stmt 1
	.cfi_startproc
	.loc 2 26 5
	.loc 2 24 1 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	.loc 2 26 5
	li	a2,0
	li	a1,0
	li	a0,1
	.loc 2 24 1
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
	.loc 2 26 5
	call	bl_gpio_enable_output
.LVL14:
	.loc 2 27 5 is_stmt 1
	li	a1,0
	li	a0,1
	call	bl_gpio_output_set
.LVL15:
	.loc 2 31 12 is_stmt 0
	lui	a5,%hi(.LC0)
	lw	s2,%lo(.LC0)(a5)
	lw	s3,%lo(.LC0+4)(a5)
	.loc 2 31 17
	lui	s0,%hi(.LANCHOR0)
	.loc 2 31 39
	lui	s1,%hi(temp)
	.loc 2 31 44
	li	s4,309
	.loc 2 31 83
	lui	s5,%hi(humidity)
	.loc 2 31 64
	li	s6,599
.L4:
	.loc 2 29 5 is_stmt 1
	.loc 2 31 9
	.loc 2 31 12 is_stmt 0
	lw	a0,%lo(.LANCHOR0)(s0)
	lw	a1,%lo(.LANCHOR0+4)(s0)
	mv	a2,s2
	mv	a3,s3
	call	__gedf2
.LVL16:
	bge	a0,zero,.L5
	.loc 2 31 44 discriminator 1
	lhu	a5,%lo(temp)(s1)
	addi	a5,a5,-100
	slli	a5,a5,16
	srli	a5,a5,16
	bgtu	a5,s4,.L5
	.loc 2 31 64 discriminator 3
	lhu	a5,%lo(humidity)(s5)
	bleu	a5,s6,.L6
.L5:
	.loc 2 35 13 is_stmt 1
	li	a1,1
	li	a0,1
	call	bl_gpio_output_set
.LVL17:
	.loc 2 36 13
	li	a0,200
	call	vTaskDelay
.LVL18:
	.loc 2 39 13
	li	a1,0
	li	a0,1
	call	bl_gpio_output_set
.LVL19:
	.loc 2 40 13
	li	a0,100
	call	vTaskDelay
.LVL20:
	j	.L4
.L6:
	.loc 2 44 13
	li	a1,0
	li	a0,1
	call	bl_gpio_output_set
.LVL21:
	j	.L4
	.cfi_endproc
.LFE5:
	.size	task_buzzer, .-task_buzzer
	.section	.text.init_adc,"ax",@progbits
	.align	1
	.globl	init_adc
	.type	init_adc, @function
init_adc:
.LFB30:
	.loc 1 98 1
	.cfi_startproc
.LVL22:
	.loc 1 99 3
	li	a5,14
	beq	a0,a5,.L10
	.loc 1 106 5
	lui	a0,%hi(.LC1)
.LVL23:
	addi	a0,a0,%lo(.LC1)
	tail	printf
.LVL24:
.L10:
	tail	init_adc.part.0
.LVL25:
	.cfi_endproc
.LFE30:
	.size	init_adc, .-init_adc
	.section	.text.read_adc,"ax",@progbits
	.align	1
	.globl	read_adc
	.type	read_adc, @function
read_adc:
.LFB31:
	.loc 1 128 1
	.cfi_startproc
	.loc 1 129 3
	.loc 1 131 3
	.loc 1 128 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 1 131 20
	li	a0,1
	.loc 1 128 1
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.loc 1 131 20
	call	bl_dma_find_ctx_by_channel
.LVL26:
	.loc 1 133 3 is_stmt 1
	.loc 1 133 10 is_stmt 0
	lw	a1,4(a0)
	li	a0,0
.LVL27:
	.loc 1 133 6
	beq	a1,zero,.L11
	.loc 1 138 3 is_stmt 1
	lui	s0,%hi(adc_data.4352)
	li	a2,4096
	addi	a0,s0,%lo(adc_data.4352)
	call	memcpy
.LVL28:
	.loc 1 143 3
	.loc 1 144 3
	.loc 1 144 8
	addi	a5,s0,%lo(adc_data.4352)
	li	a3,4096
.LBB16:
.LBB17:
.LBB18:
.LBB19:
	.loc 1 146 37 is_stmt 0
	li	a1,65536
	.loc 1 146 47
	li	a2,32768
	add	a3,a5,a3
.LBE19:
.LBE18:
	.loc 1 143 12
	li	a0,0
.LBB21:
.LBB20:
	.loc 1 146 37
	addi	a1,a1,-1
	.loc 1 146 47
	addi	a2,a2,-768
.LVL29:
.L13:
	.loc 1 146 5 is_stmt 1
	.loc 1 147 5
	.loc 1 146 37 is_stmt 0
	lw	a4,0(a5)
	addi	a5,a5,4
.LVL30:
	and	a4,a4,a1
.LVL31:
	.loc 1 146 47
	mul	a4,a4,a2
	.loc 1 146 14
	srli	a4,a4,16
	.loc 1 147 9
	add	a0,a0,a4
.LVL32:
.LBE20:
	.loc 1 144 3
	bne	a3,a5,.L13
.LBE21:
	.loc 1 150 3 is_stmt 1
	.loc 1 150 14 is_stmt 0
	srli	a0,a0,10
.LVL33:
.L11:
.LBE17:
.LBE16:
	.loc 1 151 1
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE31:
	.size	read_adc, .-read_adc
	.globl	__floatunsidf
	.globl	__divdf3
	.globl	__muldf3
	.globl	__nedf2
	.globl	__subdf3
	.globl	__adddf3
	.section	.text.task_mq4,"ax",@progbits
	.align	1
	.globl	task_mq4
	.type	task_mq4, @function
task_mq4:
.LFB28:
	.loc 1 29 1 is_stmt 1
	.cfi_startproc
.LVL34:
	.loc 1 31 3
.LBB22:
.LBB23:
	.loc 1 99 3
.LBE23:
.LBE22:
	.loc 1 29 1 is_stmt 0
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	sw	s8,24(sp)
	sw	s9,20(sp)
	sw	s10,16(sp)
	sw	s11,12(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	.cfi_offset 27, -52
.LBB25:
.LBB24:
	call	init_adc.part.0
.LVL35:
.LBE24:
.LBE25:
	.loc 1 33 3 is_stmt 1
	li	a0,2000
	call	vTaskDelay
.LVL36:
.LBB26:
	.loc 1 39 12 is_stmt 0
	lui	a5,%hi(.LC2)
	lw	s8,%lo(.LC2)(a5)
	lw	s9,%lo(.LC2+4)(a5)
	.loc 1 41 12
	lui	a5,%hi(.LC3)
	lw	s0,%lo(.LC3)(a5)
	lw	s1,%lo(.LC3+4)(a5)
.LBB27:
	.loc 1 53 36
	lui	a5,%hi(.LC4)
	lw	s2,%lo(.LC4)(a5)
	lw	s3,%lo(.LC4+4)(a5)
	.loc 1 53 14
	lui	a5,%hi(.LC5)
	lw	s4,%lo(.LC5)(a5)
	lw	s5,%lo(.LC5+4)(a5)
	.loc 1 56 13
	lui	a5,%hi(.LC9)
	lw	s6,%lo(.LC9)(a5)
	lw	s7,%lo(.LC9+4)(a5)
.L21:
.LBE27:
.LBE26:
	.loc 1 35 3 is_stmt 1
.LBB29:
	.loc 1 37 5
	.loc 1 37 25 is_stmt 0
	call	read_adc
.LVL37:
	.loc 1 39 5 is_stmt 1
	.loc 1 41 5
	.loc 1 39 26 is_stmt 0
	call	__floatunsidf
.LVL38:
	.loc 1 39 12
	mv	a2,s8
	mv	a3,s9
	call	__divdf3
.LVL39:
	.loc 1 41 12
	mv	a2,s0
	mv	a3,s1
	call	__muldf3
.LVL40:
	.loc 1 48 8
	li	a2,0
	li	a3,0
	.loc 1 41 12
	mv	s10,a0
	mv	s11,a1
.LVL41:
	.loc 1 48 5 is_stmt 1
	.loc 1 48 8 is_stmt 0
	call	__nedf2
.LVL42:
	beq	a0,zero,.L19
.LBB28:
	.loc 1 50 7 is_stmt 1
.LVL43:
	.loc 1 51 7
	.loc 1 52 7
	.loc 1 53 7
	.loc 1 54 7
	.loc 1 55 7
	.loc 1 53 36 is_stmt 0
	mv	a2,s10
	mv	a3,s11
	mv	a0,s2
	mv	a1,s3
	call	__divdf3
.LVL44:
	.loc 1 53 14
	mv	a2,s4
	mv	a3,s5
	call	__subdf3
.LVL45:
	.loc 1 54 14
	lui	a5,%hi(.LC6)
	lw	a2,%lo(.LC6)(a5)
	lw	a3,%lo(.LC6+4)(a5)
	call	__divdf3
.LVL46:
	.loc 1 55 25
	call	log10
.LVL47:
	.loc 1 56 7 is_stmt 1
	.loc 1 55 38 is_stmt 0
	lui	a5,%hi(.LC7)
	lw	a2,%lo(.LC7)(a5)
	lw	a3,%lo(.LC7+4)(a5)
	call	__subdf3
.LVL48:
	.loc 1 55 14
	lui	a5,%hi(.LC8)
	lw	a2,%lo(.LC8)(a5)
	lw	a3,%lo(.LC8+4)(a5)
	call	__divdf3
.LVL49:
	.loc 1 56 13
	mv	a2,a0
	mv	a3,a1
	mv	a0,s6
	mv	a1,s7
	call	pow
.LVL50:
	.loc 1 56 30
	lui	a5,%hi(.LC10)
	lw	a2,%lo(.LC10)(a5)
	lw	a3,%lo(.LC10+4)(a5)
	call	__adddf3
.LVL51:
	.loc 1 56 11
	lui	a5,%hi(.LANCHOR0)
	.loc 1 56 30
	mv	a2,a0
	.loc 1 56 11
	sw	a0,%lo(.LANCHOR0)(a5)
	.loc 1 58 7
	lui	a0,%hi(.LC11)
	.loc 1 56 30
	mv	a3,a1
	.loc 1 58 7
	addi	a0,a0,%lo(.LC11)
	.loc 1 56 11
	sw	a1,%lo(.LANCHOR0+4)(a5)
	.loc 1 58 7 is_stmt 1
	call	printf
.LVL52:
.L19:
.LBE28:
	.loc 1 61 5
	li	a0,4096
	addi	a0,a0,904
	call	vTaskDelay
.LVL53:
.LBE29:
	.loc 1 36 3 is_stmt 0
	j	.L21
	.cfi_endproc
.LFE28:
	.size	task_mq4, .-task_mq4
	.globl	ppm
	.globl	sensor_volt
	.section	.bss.adc_data.4352,"aw",@nobits
	.align	2
	.type	adc_data.4352, @object
	.size	adc_data.4352, 4096
adc_data.4352:
	.zero	4096
	.section	.rodata.init_adc.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"Invalid pin selected for ADC\r\n"
	.section	.rodata.task_buzzer.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	0
	.word	1081262080
	.section	.rodata.task_mq4.cst8,"aM",@progbits,8
	.align	3
.LC2:
	.word	0
	.word	1082081280
.LC3:
	.word	1078989829
	.word	1064568065
.LC4:
	.word	0
	.word	1075052544
.LC5:
	.word	0
	.word	1072693248
.LC6:
	.word	2576980378
	.word	1076337049
.LC7:
	.word	2611340116
	.word	1072832708
.LC8:
	.word	2886218023
	.word	-1076602340
.LC9:
	.word	0
	.word	1076101120
.LC10:
	.word	0
	.word	1080623104
	.section	.rodata.task_mq4.str1.4,"aMS",@progbits,1
	.align	2
.LC11:
	.string	"\033[35mGas ppm = %f\r\n"
	.section	.sbss.sensor_volt,"aw",@nobits
	.align	3
	.type	sensor_volt, @object
	.size	sensor_volt, 8
sensor_volt:
	.zero	8
	.section	.sdata.ppm,"aw"
	.align	3
	.set	.LANCHOR0,. + 0
	.type	ppm, @object
	.size	ppm, 8
ppm:
	.word	0
	.word	1072693248
	.text
.Letext0:
	.file 3 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/lib/gcc/riscv64-unknown-elf/8.3.0/include/stdint-gcc.h"
	.file 4 "/home/parag/bl_iot_sdk/components/bl602/freertos_riscv_ram/portable/GCC/RISC-V/portmacro.h"
	.file 5 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/lib/gcc/riscv64-unknown-elf/8.3.0/include/stddef.h"
	.file 6 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/riscv64-unknown-elf/include/sys/_types.h"
	.file 7 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/riscv64-unknown-elf/include/sys/reent.h"
	.file 8 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/riscv64-unknown-elf/include/sys/lock.h"
	.file 9 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/riscv64-unknown-elf/include/math.h"
	.file 10 "/home/parag/bl_iot_sdk/components/bl602/bl602_std/bl602_std/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.h"
	.file 11 "/home/parag/bl_iot_sdk/components/bl602/bl602_std/bl602_std/StdDriver/Inc/bl602_common.h"
	.file 12 "/home/parag/bl_iot_sdk/components/hal_drv/bl602_hal/bl_adc.h"
	.file 13 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/riscv64-unknown-elf/include/stdio.h"
	.file 14 "/home/parag/bl_iot_sdk/components/bl602/freertos_riscv_ram/config/task.h"
	.file 15 "/home/parag/bl_iot_sdk/components/hal_drv/bl602_hal/bl_gpio.h"
	.file 16 "/home/parag/bl_iot_sdk/components/hal_drv/bl602_hal/bl_dma.h"
	.file 17 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/riscv64-unknown-elf/include/string.h"
	.file 18 "/home/parag/bl_iot_sdk/components/bl602/bl602_std/bl602_std/StdDriver/Inc/bl602_adc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x108a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF180
	.byte	0xc
	.4byte	.LASF181
	.4byte	.LASF182
	.4byte	.Ldebug_ranges0+0x78
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x2
	.byte	0x8
	.byte	0x4
	.4byte	.LASF0
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF1
	.byte	0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x4
	.4byte	.LASF4
	.byte	0x3
	.byte	0x25
	.byte	0x13
	.4byte	0x4d
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF3
	.byte	0x4
	.4byte	.LASF5
	.byte	0x3
	.byte	0x28
	.byte	0x12
	.4byte	0x60
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF7
	.byte	0x4
	.4byte	.LASF8
	.byte	0x3
	.byte	0x2e
	.byte	0x17
	.4byte	0x7a
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.byte	0x4
	.4byte	.LASF10
	.byte	0x3
	.byte	0x31
	.byte	0x1c
	.4byte	0x8d
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF11
	.byte	0x4
	.4byte	.LASF12
	.byte	0x3
	.byte	0x34
	.byte	0x1b
	.4byte	0xa0
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF14
	.byte	0x5
	.byte	0x4
	.byte	0x4
	.4byte	.LASF15
	.byte	0x4
	.byte	0x3f
	.byte	0x11
	.4byte	0x54
	.byte	0x4
	.4byte	.LASF16
	.byte	0x4
	.byte	0x41
	.byte	0x12
	.4byte	0x94
	.byte	0x6
	.4byte	.LASF125
	.byte	0x4
	.byte	0x54
	.byte	0x13
	.4byte	0xb0
	.byte	0x7
	.byte	0x4
	.4byte	0xe1
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF17
	.byte	0x8
	.4byte	0xda
	.byte	0x9
	.4byte	.LASF18
	.byte	0x5
	.2byte	0x165
	.byte	0x16
	.4byte	0x2c
	.byte	0x4
	.4byte	.LASF19
	.byte	0x6
	.byte	0x2e
	.byte	0xe
	.4byte	0x60
	.byte	0x4
	.4byte	.LASF20
	.byte	0x6
	.byte	0x74
	.byte	0xe
	.4byte	0x60
	.byte	0x4
	.4byte	.LASF21
	.byte	0x6
	.byte	0x93
	.byte	0x14
	.4byte	0x33
	.byte	0xa
	.byte	0x4
	.byte	0x6
	.byte	0xa5
	.byte	0x3
	.4byte	0x139
	.byte	0xb
	.4byte	.LASF22
	.byte	0x6
	.byte	0xa7
	.byte	0xc
	.4byte	0xe6
	.byte	0xb
	.4byte	.LASF23
	.byte	0x6
	.byte	0xa8
	.byte	0x13
	.4byte	0x139
	.byte	0
	.byte	0xc
	.4byte	0x7a
	.4byte	0x149
	.byte	0xd
	.4byte	0x2c
	.byte	0x3
	.byte	0
	.byte	0xe
	.byte	0x8
	.byte	0x6
	.byte	0xa2
	.byte	0x9
	.4byte	0x16d
	.byte	0xf
	.4byte	.LASF24
	.byte	0x6
	.byte	0xa4
	.byte	0x7
	.4byte	0x33
	.byte	0
	.byte	0xf
	.4byte	.LASF25
	.byte	0x6
	.byte	0xa9
	.byte	0x5
	.4byte	0x117
	.byte	0x4
	.byte	0
	.byte	0x4
	.4byte	.LASF26
	.byte	0x6
	.byte	0xaa
	.byte	0x3
	.4byte	0x149
	.byte	0x4
	.4byte	.LASF27
	.byte	0x7
	.byte	0x16
	.byte	0x17
	.4byte	0xa0
	.byte	0x4
	.4byte	.LASF28
	.byte	0x8
	.byte	0xc
	.byte	0xd
	.4byte	0x33
	.byte	0x4
	.4byte	.LASF29
	.byte	0x7
	.byte	0x23
	.byte	0x1b
	.4byte	0x185
	.byte	0x10
	.4byte	.LASF34
	.byte	0x18
	.byte	0x7
	.byte	0x34
	.byte	0x8
	.4byte	0x1f7
	.byte	0xf
	.4byte	.LASF30
	.byte	0x7
	.byte	0x36
	.byte	0x13
	.4byte	0x1f7
	.byte	0
	.byte	0x11
	.string	"_k"
	.byte	0x7
	.byte	0x37
	.byte	0x7
	.4byte	0x33
	.byte	0x4
	.byte	0xf
	.4byte	.LASF31
	.byte	0x7
	.byte	0x37
	.byte	0xb
	.4byte	0x33
	.byte	0x8
	.byte	0xf
	.4byte	.LASF32
	.byte	0x7
	.byte	0x37
	.byte	0x14
	.4byte	0x33
	.byte	0xc
	.byte	0xf
	.4byte	.LASF33
	.byte	0x7
	.byte	0x37
	.byte	0x1b
	.4byte	0x33
	.byte	0x10
	.byte	0x11
	.string	"_x"
	.byte	0x7
	.byte	0x38
	.byte	0xb
	.4byte	0x1fd
	.byte	0x14
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x19d
	.byte	0xc
	.4byte	0x179
	.4byte	0x20d
	.byte	0xd
	.4byte	0x2c
	.byte	0
	.byte	0
	.byte	0x10
	.4byte	.LASF35
	.byte	0x24
	.byte	0x7
	.byte	0x3c
	.byte	0x8
	.4byte	0x290
	.byte	0xf
	.4byte	.LASF36
	.byte	0x7
	.byte	0x3e
	.byte	0x7
	.4byte	0x33
	.byte	0
	.byte	0xf
	.4byte	.LASF37
	.byte	0x7
	.byte	0x3f
	.byte	0x7
	.4byte	0x33
	.byte	0x4
	.byte	0xf
	.4byte	.LASF38
	.byte	0x7
	.byte	0x40
	.byte	0x7
	.4byte	0x33
	.byte	0x8
	.byte	0xf
	.4byte	.LASF39
	.byte	0x7
	.byte	0x41
	.byte	0x7
	.4byte	0x33
	.byte	0xc
	.byte	0xf
	.4byte	.LASF40
	.byte	0x7
	.byte	0x42
	.byte	0x7
	.4byte	0x33
	.byte	0x10
	.byte	0xf
	.4byte	.LASF41
	.byte	0x7
	.byte	0x43
	.byte	0x7
	.4byte	0x33
	.byte	0x14
	.byte	0xf
	.4byte	.LASF42
	.byte	0x7
	.byte	0x44
	.byte	0x7
	.4byte	0x33
	.byte	0x18
	.byte	0xf
	.4byte	.LASF43
	.byte	0x7
	.byte	0x45
	.byte	0x7
	.4byte	0x33
	.byte	0x1c
	.byte	0xf
	.4byte	.LASF44
	.byte	0x7
	.byte	0x46
	.byte	0x7
	.4byte	0x33
	.byte	0x20
	.byte	0
	.byte	0x12
	.4byte	.LASF45
	.2byte	0x108
	.byte	0x7
	.byte	0x4f
	.byte	0x8
	.4byte	0x2d5
	.byte	0xf
	.4byte	.LASF46
	.byte	0x7
	.byte	0x50
	.byte	0x9
	.4byte	0x2d5
	.byte	0
	.byte	0xf
	.4byte	.LASF47
	.byte	0x7
	.byte	0x51
	.byte	0x9
	.4byte	0x2d5
	.byte	0x80
	.byte	0x13
	.4byte	.LASF48
	.byte	0x7
	.byte	0x53
	.byte	0xa
	.4byte	0x179
	.2byte	0x100
	.byte	0x13
	.4byte	.LASF49
	.byte	0x7
	.byte	0x56
	.byte	0xa
	.4byte	0x179
	.2byte	0x104
	.byte	0
	.byte	0xc
	.4byte	0xae
	.4byte	0x2e5
	.byte	0xd
	.4byte	0x2c
	.byte	0x1f
	.byte	0
	.byte	0x12
	.4byte	.LASF50
	.2byte	0x190
	.byte	0x7
	.byte	0x62
	.byte	0x8
	.4byte	0x328
	.byte	0xf
	.4byte	.LASF30
	.byte	0x7
	.byte	0x63
	.byte	0x12
	.4byte	0x328
	.byte	0
	.byte	0xf
	.4byte	.LASF51
	.byte	0x7
	.byte	0x64
	.byte	0x6
	.4byte	0x33
	.byte	0x4
	.byte	0xf
	.4byte	.LASF52
	.byte	0x7
	.byte	0x66
	.byte	0x9
	.4byte	0x32e
	.byte	0x8
	.byte	0xf
	.4byte	.LASF45
	.byte	0x7
	.byte	0x67
	.byte	0x1e
	.4byte	0x290
	.byte	0x88
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x2e5
	.byte	0xc
	.4byte	0x33e
	.4byte	0x33e
	.byte	0xd
	.4byte	0x2c
	.byte	0x1f
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x344
	.byte	0x14
	.byte	0x10
	.4byte	.LASF53
	.byte	0x8
	.byte	0x7
	.byte	0x7a
	.byte	0x8
	.4byte	0x36d
	.byte	0xf
	.4byte	.LASF54
	.byte	0x7
	.byte	0x7b
	.byte	0x11
	.4byte	0x36d
	.byte	0
	.byte	0xf
	.4byte	.LASF55
	.byte	0x7
	.byte	0x7c
	.byte	0x6
	.4byte	0x33
	.byte	0x4
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x7a
	.byte	0x10
	.4byte	.LASF56
	.byte	0x68
	.byte	0x7
	.byte	0xba
	.byte	0x8
	.4byte	0x4b6
	.byte	0x11
	.string	"_p"
	.byte	0x7
	.byte	0xbb
	.byte	0x12
	.4byte	0x36d
	.byte	0
	.byte	0x11
	.string	"_r"
	.byte	0x7
	.byte	0xbc
	.byte	0x7
	.4byte	0x33
	.byte	0x4
	.byte	0x11
	.string	"_w"
	.byte	0x7
	.byte	0xbd
	.byte	0x7
	.4byte	0x33
	.byte	0x8
	.byte	0xf
	.4byte	.LASF57
	.byte	0x7
	.byte	0xbe
	.byte	0x9
	.4byte	0x4d
	.byte	0xc
	.byte	0xf
	.4byte	.LASF58
	.byte	0x7
	.byte	0xbf
	.byte	0x9
	.4byte	0x4d
	.byte	0xe
	.byte	0x11
	.string	"_bf"
	.byte	0x7
	.byte	0xc0
	.byte	0x11
	.4byte	0x345
	.byte	0x10
	.byte	0xf
	.4byte	.LASF59
	.byte	0x7
	.byte	0xc1
	.byte	0x7
	.4byte	0x33
	.byte	0x18
	.byte	0xf
	.4byte	.LASF60
	.byte	0x7
	.byte	0xc8
	.byte	0xa
	.4byte	0xae
	.byte	0x1c
	.byte	0xf
	.4byte	.LASF61
	.byte	0x7
	.byte	0xca
	.byte	0xe
	.4byte	0x62e
	.byte	0x20
	.byte	0xf
	.4byte	.LASF62
	.byte	0x7
	.byte	0xcc
	.byte	0xe
	.4byte	0x652
	.byte	0x24
	.byte	0xf
	.4byte	.LASF63
	.byte	0x7
	.byte	0xcf
	.byte	0xd
	.4byte	0x676
	.byte	0x28
	.byte	0xf
	.4byte	.LASF64
	.byte	0x7
	.byte	0xd0
	.byte	0x9
	.4byte	0x690
	.byte	0x2c
	.byte	0x11
	.string	"_ub"
	.byte	0x7
	.byte	0xd3
	.byte	0x11
	.4byte	0x345
	.byte	0x30
	.byte	0x11
	.string	"_up"
	.byte	0x7
	.byte	0xd4
	.byte	0x12
	.4byte	0x36d
	.byte	0x38
	.byte	0x11
	.string	"_ur"
	.byte	0x7
	.byte	0xd5
	.byte	0x7
	.4byte	0x33
	.byte	0x3c
	.byte	0xf
	.4byte	.LASF65
	.byte	0x7
	.byte	0xd8
	.byte	0x11
	.4byte	0x696
	.byte	0x40
	.byte	0xf
	.4byte	.LASF66
	.byte	0x7
	.byte	0xd9
	.byte	0x11
	.4byte	0x6a6
	.byte	0x43
	.byte	0x11
	.string	"_lb"
	.byte	0x7
	.byte	0xdc
	.byte	0x11
	.4byte	0x345
	.byte	0x44
	.byte	0xf
	.4byte	.LASF67
	.byte	0x7
	.byte	0xdf
	.byte	0x7
	.4byte	0x33
	.byte	0x4c
	.byte	0xf
	.4byte	.LASF68
	.byte	0x7
	.byte	0xe0
	.byte	0xa
	.4byte	0xf3
	.byte	0x50
	.byte	0xf
	.4byte	.LASF69
	.byte	0x7
	.byte	0xe3
	.byte	0x12
	.4byte	0x4d4
	.byte	0x54
	.byte	0xf
	.4byte	.LASF70
	.byte	0x7
	.byte	0xe7
	.byte	0xc
	.4byte	0x191
	.byte	0x58
	.byte	0xf
	.4byte	.LASF71
	.byte	0x7
	.byte	0xe9
	.byte	0xe
	.4byte	0x16d
	.byte	0x5c
	.byte	0xf
	.4byte	.LASF72
	.byte	0x7
	.byte	0xea
	.byte	0x7
	.4byte	0x33
	.byte	0x64
	.byte	0
	.byte	0x15
	.4byte	0x10b
	.4byte	0x4d4
	.byte	0x16
	.4byte	0x4d4
	.byte	0x16
	.4byte	0xae
	.byte	0x16
	.4byte	0x628
	.byte	0x16
	.4byte	0x33
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x4df
	.byte	0x8
	.4byte	0x4d4
	.byte	0x17
	.4byte	.LASF73
	.2byte	0x428
	.byte	0x7
	.2byte	0x265
	.byte	0x8
	.4byte	0x628
	.byte	0x18
	.4byte	.LASF74
	.byte	0x7
	.2byte	0x267
	.byte	0x7
	.4byte	0x33
	.byte	0
	.byte	0x18
	.4byte	.LASF75
	.byte	0x7
	.2byte	0x26c
	.byte	0xb
	.4byte	0x702
	.byte	0x4
	.byte	0x18
	.4byte	.LASF76
	.byte	0x7
	.2byte	0x26c
	.byte	0x14
	.4byte	0x702
	.byte	0x8
	.byte	0x18
	.4byte	.LASF77
	.byte	0x7
	.2byte	0x26c
	.byte	0x1e
	.4byte	0x702
	.byte	0xc
	.byte	0x18
	.4byte	.LASF78
	.byte	0x7
	.2byte	0x26e
	.byte	0x7
	.4byte	0x33
	.byte	0x10
	.byte	0x18
	.4byte	.LASF79
	.byte	0x7
	.2byte	0x26f
	.byte	0x8
	.4byte	0x902
	.byte	0x14
	.byte	0x18
	.4byte	.LASF80
	.byte	0x7
	.2byte	0x272
	.byte	0x7
	.4byte	0x33
	.byte	0x30
	.byte	0x18
	.4byte	.LASF81
	.byte	0x7
	.2byte	0x273
	.byte	0x16
	.4byte	0x917
	.byte	0x34
	.byte	0x18
	.4byte	.LASF82
	.byte	0x7
	.2byte	0x275
	.byte	0x7
	.4byte	0x33
	.byte	0x38
	.byte	0x18
	.4byte	.LASF83
	.byte	0x7
	.2byte	0x277
	.byte	0xa
	.4byte	0x928
	.byte	0x3c
	.byte	0x18
	.4byte	.LASF84
	.byte	0x7
	.2byte	0x27a
	.byte	0x13
	.4byte	0x1f7
	.byte	0x40
	.byte	0x18
	.4byte	.LASF85
	.byte	0x7
	.2byte	0x27b
	.byte	0x7
	.4byte	0x33
	.byte	0x44
	.byte	0x18
	.4byte	.LASF86
	.byte	0x7
	.2byte	0x27c
	.byte	0x13
	.4byte	0x1f7
	.byte	0x48
	.byte	0x18
	.4byte	.LASF87
	.byte	0x7
	.2byte	0x27d
	.byte	0x14
	.4byte	0x92e
	.byte	0x4c
	.byte	0x18
	.4byte	.LASF88
	.byte	0x7
	.2byte	0x280
	.byte	0x7
	.4byte	0x33
	.byte	0x50
	.byte	0x18
	.4byte	.LASF89
	.byte	0x7
	.2byte	0x281
	.byte	0x9
	.4byte	0x628
	.byte	0x54
	.byte	0x18
	.4byte	.LASF90
	.byte	0x7
	.2byte	0x2a4
	.byte	0x7
	.4byte	0x8dd
	.byte	0x58
	.byte	0x19
	.4byte	.LASF50
	.byte	0x7
	.2byte	0x2a8
	.byte	0x13
	.4byte	0x328
	.2byte	0x148
	.byte	0x19
	.4byte	.LASF91
	.byte	0x7
	.2byte	0x2a9
	.byte	0x12
	.4byte	0x2e5
	.2byte	0x14c
	.byte	0x19
	.4byte	.LASF92
	.byte	0x7
	.2byte	0x2ad
	.byte	0xc
	.4byte	0x93f
	.2byte	0x2dc
	.byte	0x19
	.4byte	.LASF93
	.byte	0x7
	.2byte	0x2b2
	.byte	0x10
	.4byte	0x6c3
	.2byte	0x2e0
	.byte	0x19
	.4byte	.LASF94
	.byte	0x7
	.2byte	0x2b4
	.byte	0xa
	.4byte	0x94b
	.2byte	0x2ec
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xda
	.byte	0x7
	.byte	0x4
	.4byte	0x4b6
	.byte	0x15
	.4byte	0x10b
	.4byte	0x652
	.byte	0x16
	.4byte	0x4d4
	.byte	0x16
	.4byte	0xae
	.byte	0x16
	.4byte	0xd4
	.byte	0x16
	.4byte	0x33
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x634
	.byte	0x15
	.4byte	0xff
	.4byte	0x676
	.byte	0x16
	.4byte	0x4d4
	.byte	0x16
	.4byte	0xae
	.byte	0x16
	.4byte	0xff
	.byte	0x16
	.4byte	0x33
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x658
	.byte	0x15
	.4byte	0x33
	.4byte	0x690
	.byte	0x16
	.4byte	0x4d4
	.byte	0x16
	.4byte	0xae
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x67c
	.byte	0xc
	.4byte	0x7a
	.4byte	0x6a6
	.byte	0xd
	.4byte	0x2c
	.byte	0x2
	.byte	0
	.byte	0xc
	.4byte	0x7a
	.4byte	0x6b6
	.byte	0xd
	.4byte	0x2c
	.byte	0
	.byte	0
	.byte	0x9
	.4byte	.LASF95
	.byte	0x7
	.2byte	0x124
	.byte	0x18
	.4byte	0x373
	.byte	0x1a
	.4byte	.LASF96
	.byte	0xc
	.byte	0x7
	.2byte	0x128
	.byte	0x8
	.4byte	0x6fc
	.byte	0x18
	.4byte	.LASF30
	.byte	0x7
	.2byte	0x12a
	.byte	0x11
	.4byte	0x6fc
	.byte	0
	.byte	0x18
	.4byte	.LASF97
	.byte	0x7
	.2byte	0x12b
	.byte	0x7
	.4byte	0x33
	.byte	0x4
	.byte	0x18
	.4byte	.LASF98
	.byte	0x7
	.2byte	0x12c
	.byte	0xb
	.4byte	0x702
	.byte	0x8
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x6c3
	.byte	0x7
	.byte	0x4
	.4byte	0x6b6
	.byte	0x1a
	.4byte	.LASF99
	.byte	0xe
	.byte	0x7
	.2byte	0x144
	.byte	0x8
	.4byte	0x741
	.byte	0x18
	.4byte	.LASF100
	.byte	0x7
	.2byte	0x145
	.byte	0x12
	.4byte	0x741
	.byte	0
	.byte	0x18
	.4byte	.LASF101
	.byte	0x7
	.2byte	0x146
	.byte	0x12
	.4byte	0x741
	.byte	0x6
	.byte	0x18
	.4byte	.LASF102
	.byte	0x7
	.2byte	0x147
	.byte	0x12
	.4byte	0x8d
	.byte	0xc
	.byte	0
	.byte	0xc
	.4byte	0x8d
	.4byte	0x751
	.byte	0xd
	.4byte	0x2c
	.byte	0x2
	.byte	0
	.byte	0x1b
	.byte	0xd0
	.byte	0x7
	.2byte	0x285
	.byte	0x7
	.4byte	0x866
	.byte	0x18
	.4byte	.LASF103
	.byte	0x7
	.2byte	0x287
	.byte	0x18
	.4byte	0x2c
	.byte	0
	.byte	0x18
	.4byte	.LASF104
	.byte	0x7
	.2byte	0x288
	.byte	0x12
	.4byte	0x628
	.byte	0x4
	.byte	0x18
	.4byte	.LASF105
	.byte	0x7
	.2byte	0x289
	.byte	0x10
	.4byte	0x866
	.byte	0x8
	.byte	0x18
	.4byte	.LASF106
	.byte	0x7
	.2byte	0x28a
	.byte	0x17
	.4byte	0x20d
	.byte	0x24
	.byte	0x18
	.4byte	.LASF107
	.byte	0x7
	.2byte	0x28b
	.byte	0xf
	.4byte	0x33
	.byte	0x48
	.byte	0x18
	.4byte	.LASF108
	.byte	0x7
	.2byte	0x28c
	.byte	0x2c
	.4byte	0xa7
	.byte	0x50
	.byte	0x18
	.4byte	.LASF109
	.byte	0x7
	.2byte	0x28d
	.byte	0x1a
	.4byte	0x708
	.byte	0x58
	.byte	0x18
	.4byte	.LASF110
	.byte	0x7
	.2byte	0x28e
	.byte	0x16
	.4byte	0x16d
	.byte	0x68
	.byte	0x18
	.4byte	.LASF111
	.byte	0x7
	.2byte	0x28f
	.byte	0x16
	.4byte	0x16d
	.byte	0x70
	.byte	0x18
	.4byte	.LASF112
	.byte	0x7
	.2byte	0x290
	.byte	0x16
	.4byte	0x16d
	.byte	0x78
	.byte	0x18
	.4byte	.LASF113
	.byte	0x7
	.2byte	0x291
	.byte	0x10
	.4byte	0x876
	.byte	0x80
	.byte	0x18
	.4byte	.LASF114
	.byte	0x7
	.2byte	0x292
	.byte	0x10
	.4byte	0x886
	.byte	0x88
	.byte	0x18
	.4byte	.LASF115
	.byte	0x7
	.2byte	0x293
	.byte	0xf
	.4byte	0x33
	.byte	0xa0
	.byte	0x18
	.4byte	.LASF116
	.byte	0x7
	.2byte	0x294
	.byte	0x16
	.4byte	0x16d
	.byte	0xa4
	.byte	0x18
	.4byte	.LASF117
	.byte	0x7
	.2byte	0x295
	.byte	0x16
	.4byte	0x16d
	.byte	0xac
	.byte	0x18
	.4byte	.LASF118
	.byte	0x7
	.2byte	0x296
	.byte	0x16
	.4byte	0x16d
	.byte	0xb4
	.byte	0x18
	.4byte	.LASF119
	.byte	0x7
	.2byte	0x297
	.byte	0x16
	.4byte	0x16d
	.byte	0xbc
	.byte	0x18
	.4byte	.LASF120
	.byte	0x7
	.2byte	0x298
	.byte	0x16
	.4byte	0x16d
	.byte	0xc4
	.byte	0x18
	.4byte	.LASF121
	.byte	0x7
	.2byte	0x299
	.byte	0x8
	.4byte	0x33
	.byte	0xcc
	.byte	0
	.byte	0xc
	.4byte	0xda
	.4byte	0x876
	.byte	0xd
	.4byte	0x2c
	.byte	0x19
	.byte	0
	.byte	0xc
	.4byte	0xda
	.4byte	0x886
	.byte	0xd
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.byte	0xc
	.4byte	0xda
	.4byte	0x896
	.byte	0xd
	.4byte	0x2c
	.byte	0x17
	.byte	0
	.byte	0x1b
	.byte	0xf0
	.byte	0x7
	.2byte	0x29e
	.byte	0x7
	.4byte	0x8bd
	.byte	0x18
	.4byte	.LASF122
	.byte	0x7
	.2byte	0x2a1
	.byte	0x1b
	.4byte	0x8bd
	.byte	0
	.byte	0x18
	.4byte	.LASF123
	.byte	0x7
	.2byte	0x2a2
	.byte	0x18
	.4byte	0x8cd
	.byte	0x78
	.byte	0
	.byte	0xc
	.4byte	0x36d
	.4byte	0x8cd
	.byte	0xd
	.4byte	0x2c
	.byte	0x1d
	.byte	0
	.byte	0xc
	.4byte	0x2c
	.4byte	0x8dd
	.byte	0xd
	.4byte	0x2c
	.byte	0x1d
	.byte	0
	.byte	0x1c
	.byte	0xf0
	.byte	0x7
	.2byte	0x283
	.byte	0x3
	.4byte	0x902
	.byte	0x1d
	.4byte	.LASF73
	.byte	0x7
	.2byte	0x29a
	.byte	0xb
	.4byte	0x751
	.byte	0x1d
	.4byte	.LASF124
	.byte	0x7
	.2byte	0x2a3
	.byte	0xb
	.4byte	0x896
	.byte	0
	.byte	0xc
	.4byte	0xda
	.4byte	0x912
	.byte	0xd
	.4byte	0x2c
	.byte	0x18
	.byte	0
	.byte	0x1e
	.4byte	.LASF183
	.byte	0x7
	.byte	0x4
	.4byte	0x912
	.byte	0x1f
	.4byte	0x928
	.byte	0x16
	.4byte	0x4d4
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x91d
	.byte	0x7
	.byte	0x4
	.4byte	0x1f7
	.byte	0x1f
	.4byte	0x93f
	.byte	0x16
	.4byte	0x33
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x945
	.byte	0x7
	.byte	0x4
	.4byte	0x934
	.byte	0xc
	.4byte	0x6b6
	.4byte	0x95b
	.byte	0xd
	.4byte	0x2c
	.byte	0x2
	.byte	0
	.byte	0x20
	.4byte	.LASF126
	.byte	0x7
	.2byte	0x333
	.byte	0x17
	.4byte	0x4d4
	.byte	0x20
	.4byte	.LASF127
	.byte	0x7
	.2byte	0x334
	.byte	0x1d
	.4byte	0x4da
	.byte	0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF128
	.byte	0x21
	.4byte	.LASF184
	.byte	0x5
	.byte	0x1
	.4byte	0x3a
	.byte	0x9
	.2byte	0x25f
	.byte	0x6
	.4byte	0x99c
	.byte	0x22
	.4byte	.LASF129
	.byte	0x7f
	.byte	0x23
	.4byte	.LASF130
	.byte	0
	.byte	0
	.byte	0x20
	.4byte	.LASF131
	.byte	0x9
	.2byte	0x268
	.byte	0x1e
	.4byte	0x97c
	.byte	0x6
	.4byte	.LASF132
	.byte	0x2
	.byte	0x13
	.byte	0xc
	.4byte	0x33
	.byte	0x6
	.4byte	.LASF133
	.byte	0x2
	.byte	0x14
	.byte	0x11
	.4byte	0x81
	.byte	0x6
	.4byte	.LASF134
	.byte	0x2
	.byte	0x15
	.byte	0x10
	.4byte	0x41
	.byte	0x24
	.string	"ppm"
	.byte	0x2
	.byte	0x16
	.byte	0xf
	.4byte	0x25
	.byte	0x6
	.4byte	.LASF135
	.byte	0xa
	.byte	0x8
	.byte	0x11
	.4byte	0x94
	.byte	0x4
	.4byte	.LASF136
	.byte	0xb
	.byte	0x7c
	.byte	0xf
	.4byte	0x344
	.byte	0xc
	.4byte	0x9fc
	.4byte	0x9fc
	.byte	0x25
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xa02
	.byte	0x7
	.byte	0x4
	.4byte	0x9e5
	.byte	0x6
	.4byte	.LASF137
	.byte	0xb
	.byte	0x84
	.byte	0x1c
	.4byte	0x9f1
	.byte	0x26
	.byte	0x7
	.byte	0x1
	.4byte	0x7a
	.byte	0x12
	.byte	0x88
	.byte	0xe
	.4byte	0xa4d
	.byte	0x23
	.4byte	.LASF138
	.byte	0
	.byte	0x23
	.4byte	.LASF139
	.byte	0x1
	.byte	0x23
	.4byte	.LASF140
	.byte	0x2
	.byte	0x23
	.4byte	.LASF141
	.byte	0x3
	.byte	0x23
	.4byte	.LASF142
	.byte	0x4
	.byte	0x23
	.4byte	.LASF143
	.byte	0x5
	.byte	0x23
	.4byte	.LASF144
	.byte	0x6
	.byte	0
	.byte	0x4
	.4byte	.LASF145
	.byte	0xc
	.byte	0x24
	.byte	0x10
	.4byte	0xa59
	.byte	0x7
	.byte	0x4
	.4byte	0xa5f
	.byte	0x1f
	.4byte	0xa74
	.byte	0x16
	.4byte	0x33
	.byte	0x16
	.4byte	0xa74
	.byte	0x16
	.4byte	0x94
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0x94
	.byte	0x10
	.4byte	.LASF146
	.byte	0x1c
	.byte	0xc
	.byte	0x25
	.byte	0x10
	.4byte	0xae2
	.byte	0xf
	.4byte	.LASF147
	.byte	0xc
	.byte	0x26
	.byte	0x9
	.4byte	0x33
	.byte	0
	.byte	0xf
	.4byte	.LASF148
	.byte	0xc
	.byte	0x27
	.byte	0xf
	.4byte	0xa74
	.byte	0x4
	.byte	0xf
	.4byte	.LASF149
	.byte	0xc
	.byte	0x28
	.byte	0xb
	.4byte	0xae
	.byte	0x8
	.byte	0xf
	.4byte	.LASF150
	.byte	0xc
	.byte	0x29
	.byte	0x9
	.4byte	0x33
	.byte	0xc
	.byte	0xf
	.4byte	.LASF151
	.byte	0xc
	.byte	0x2a
	.byte	0xe
	.4byte	0x94
	.byte	0x10
	.byte	0xf
	.4byte	.LASF152
	.byte	0xc
	.byte	0x2b
	.byte	0xe
	.4byte	0x94
	.byte	0x14
	.byte	0x11
	.string	"cb"
	.byte	0xc
	.byte	0x2c
	.byte	0x11
	.4byte	0xa4d
	.byte	0x18
	.byte	0
	.byte	0x4
	.4byte	.LASF153
	.byte	0xc
	.byte	0x2d
	.byte	0x2
	.4byte	0xa7a
	.byte	0x27
	.4byte	.LASF154
	.byte	0x1
	.byte	0x16
	.byte	0x8
	.4byte	0x25
	.byte	0x5
	.byte	0x3
	.4byte	sensor_volt
	.byte	0x28
	.4byte	0x9cd
	.byte	0x1
	.byte	0x17
	.byte	0x8
	.byte	0x5
	.byte	0x3
	.4byte	ppm
	.byte	0x29
	.4byte	.LASF156
	.byte	0x1
	.byte	0x7f
	.byte	0xa
	.4byte	0x94
	.byte	0x1
	.4byte	0xb64
	.byte	0x2a
	.4byte	.LASF161
	.byte	0x1
	.byte	0x81
	.byte	0x13
	.4byte	0xb64
	.byte	0x5
	.byte	0x3
	.4byte	adc_data.4352
	.byte	0x2b
	.string	"ctx"
	.byte	0x1
	.byte	0x83
	.byte	0xe
	.4byte	0xb75
	.byte	0x2b
	.string	"sum"
	.byte	0x1
	.byte	0x8f
	.byte	0xc
	.4byte	0x94
	.byte	0x2c
	.byte	0x2b
	.string	"i"
	.byte	0x1
	.byte	0x90
	.byte	0xc
	.4byte	0x33
	.byte	0x2c
	.byte	0x2d
	.4byte	.LASF155
	.byte	0x1
	.byte	0x92
	.byte	0xe
	.4byte	0x94
	.byte	0
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	0x94
	.4byte	0xb75
	.byte	0x2e
	.4byte	0x2c
	.2byte	0x3ff
	.byte	0
	.byte	0x7
	.byte	0x4
	.4byte	0xae2
	.byte	0x2f
	.4byte	.LASF157
	.byte	0x1
	.byte	0x61
	.byte	0x6
	.byte	0x1
	.4byte	0xbad
	.byte	0x30
	.string	"pin"
	.byte	0x1
	.byte	0x61
	.byte	0x17
	.4byte	0x6e
	.byte	0x2d
	.4byte	.LASF158
	.byte	0x1
	.byte	0x78
	.byte	0x7
	.4byte	0x33
	.byte	0x2b
	.string	"ctx"
	.byte	0x1
	.byte	0x79
	.byte	0xe
	.4byte	0xb75
	.byte	0
	.byte	0x31
	.4byte	.LASF185
	.byte	0x1
	.byte	0x43
	.byte	0xc
	.4byte	0x33
	.byte	0x1
	.4byte	0xbe3
	.byte	0x32
	.4byte	.LASF159
	.byte	0x1
	.byte	0x43
	.byte	0x22
	.4byte	0x94
	.byte	0x32
	.4byte	.LASF160
	.byte	0x1
	.byte	0x43
	.byte	0x32
	.4byte	0x94
	.byte	0x2b
	.string	"reg"
	.byte	0x1
	.byte	0x45
	.byte	0xc
	.4byte	0x94
	.byte	0
	.byte	0x33
	.4byte	.LASF186
	.byte	0x1
	.byte	0x1c
	.byte	0x6
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.4byte	0xd3b
	.byte	0x34
	.4byte	.LASF187
	.byte	0x1
	.byte	0x1c
	.byte	0x15
	.4byte	0xae
	.4byte	.LLST11
	.byte	0x35
	.4byte	.Ldebug_ranges0+0x48
	.4byte	0xcea
	.byte	0x36
	.4byte	.LASF162
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.4byte	0x94
	.4byte	.LLST13
	.byte	0x36
	.4byte	.LASF163
	.byte	0x1
	.byte	0x27
	.byte	0xc
	.4byte	0x25
	.4byte	.LLST14
	.byte	0x2a
	.4byte	.LASF154
	.byte	0x1
	.byte	0x29
	.byte	0xc
	.4byte	0x25
	.byte	0x6
	.byte	0x6a
	.byte	0x93
	.byte	0x4
	.byte	0x6b
	.byte	0x93
	.byte	0x4
	.byte	0x35
	.4byte	.Ldebug_ranges0+0x60
	.4byte	0xccf
	.byte	0x37
	.string	"m"
	.byte	0x1
	.byte	0x32
	.byte	0xe
	.4byte	0x25
	.4byte	.LLST15
	.byte	0x37
	.string	"b"
	.byte	0x1
	.byte	0x33
	.byte	0xe
	.4byte	0x25
	.4byte	.LLST16
	.byte	0x37
	.string	"R0"
	.byte	0x1
	.byte	0x34
	.byte	0xe
	.4byte	0x25
	.4byte	.LLST17
	.byte	0x36
	.4byte	.LASF164
	.byte	0x1
	.byte	0x35
	.byte	0xe
	.4byte	0x25
	.4byte	.LLST18
	.byte	0x36
	.4byte	.LASF165
	.byte	0x1
	.byte	0x36
	.byte	0xe
	.4byte	0x25
	.4byte	.LLST19
	.byte	0x36
	.4byte	.LASF166
	.byte	0x1
	.byte	0x37
	.byte	0xe
	.4byte	0x25
	.4byte	.LLST20
	.byte	0x38
	.4byte	.LVL47
	.4byte	0xfe4
	.byte	0x38
	.4byte	.LVL50
	.4byte	0xff0
	.byte	0x39
	.4byte	.LVL52
	.4byte	0xffc
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC11
	.byte	0
	.byte	0
	.byte	0x38
	.4byte	.LVL37
	.4byte	0xb0e
	.byte	0x39
	.4byte	.LVL53
	.4byte	0x1008
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x1388
	.byte	0
	.byte	0
	.byte	0x3b
	.4byte	0xb7b
	.4byte	.LBB22
	.4byte	.Ldebug_ranges0+0x30
	.byte	0x1
	.byte	0x1f
	.byte	0x3
	.4byte	0xd29
	.byte	0x3c
	.4byte	0xb88
	.4byte	.LLST12
	.byte	0x3d
	.4byte	.Ldebug_ranges0+0x30
	.byte	0x3e
	.4byte	0xb94
	.byte	0x3e
	.4byte	0xba0
	.byte	0x39
	.4byte	.LVL35
	.4byte	0xdf5
	.byte	0x3f
	.4byte	0xb88
	.byte	0x1
	.byte	0x3e
	.byte	0
	.byte	0
	.byte	0
	.byte	0x39
	.4byte	.LVL36
	.4byte	0x1008
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x7d0
	.byte	0
	.byte	0
	.byte	0x40
	.4byte	.LASF188
	.byte	0x2
	.byte	0x17
	.byte	0x6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0xdf5
	.byte	0x41
	.4byte	.LVL14
	.4byte	0x1015
	.4byte	0xd6e
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x3a
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x3a
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x41
	.4byte	.LVL15
	.4byte	0x1021
	.4byte	0xd86
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x3a
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x41
	.4byte	.LVL17
	.4byte	0x1021
	.4byte	0xd9e
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x3a
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x41
	.4byte	.LVL18
	.4byte	0x1008
	.4byte	0xdb2
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0xc8
	.byte	0
	.byte	0x41
	.4byte	.LVL19
	.4byte	0x1021
	.4byte	0xdcb
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x3a
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x41
	.4byte	.LVL20
	.4byte	0x1008
	.4byte	0xddf
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.byte	0x39
	.4byte	.LVL21
	.4byte	0x1021
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x3a
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0
	.byte	0x42
	.4byte	0xb7b
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.byte	0x1
	.byte	0x9c
	.4byte	0xeef
	.byte	0x43
	.4byte	0xb94
	.4byte	.LLST0
	.byte	0x43
	.4byte	0xba0
	.4byte	.LLST1
	.byte	0x44
	.4byte	0xb88
	.byte	0x6
	.byte	0xfa
	.4byte	0xb88
	.byte	0x9f
	.byte	0x45
	.4byte	0xbad
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.byte	0x1
	.byte	0x72
	.byte	0x3
	.4byte	0xe60
	.byte	0x3c
	.4byte	0xbbe
	.4byte	.LLST2
	.byte	0x3c
	.4byte	0xbca
	.4byte	.LLST2
	.byte	0x46
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.byte	0x43
	.4byte	0xbd6
	.4byte	.LLST4
	.byte	0
	.byte	0
	.byte	0x41
	.4byte	.LVL1
	.4byte	0x102d
	.4byte	0xe7a
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x3a
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xa
	.2byte	0x1000
	.byte	0
	.byte	0x41
	.4byte	.LVL2
	.4byte	0x1039
	.4byte	0xe92
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x3a
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x3e
	.byte	0
	.byte	0x41
	.4byte	.LVL7
	.4byte	0x1045
	.4byte	0xeac
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x3a
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xa
	.2byte	0x400
	.byte	0
	.byte	0x41
	.4byte	.LVL8
	.4byte	0x1051
	.4byte	0xebf
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3e
	.byte	0
	.byte	0x41
	.4byte	.LVL9
	.4byte	0x105d
	.4byte	0xed2
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3e
	.byte	0
	.byte	0x41
	.4byte	.LVL11
	.4byte	0x1069
	.4byte	0xee5
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x47
	.4byte	.LVL13
	.4byte	0x1075
	.byte	0
	.byte	0x42
	.4byte	0xb7b
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.byte	0x1
	.byte	0x9c
	.4byte	0xf3e
	.byte	0x3c
	.4byte	0xb88
	.4byte	.LLST5
	.byte	0x3e
	.4byte	0xb94
	.byte	0x3e
	.4byte	0xba0
	.byte	0x48
	.4byte	.LVL24
	.4byte	0xffc
	.4byte	0xf2c
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.byte	0x49
	.4byte	.LVL25
	.4byte	0xdf5
	.byte	0x3f
	.4byte	0xb88
	.byte	0x1
	.byte	0x3e
	.byte	0
	.byte	0
	.byte	0x42
	.4byte	0xb0e
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.byte	0x1
	.byte	0x9c
	.4byte	0xfe4
	.byte	0x43
	.4byte	0xb31
	.4byte	.LLST6
	.byte	0x43
	.4byte	0xb3d
	.4byte	.LLST7
	.byte	0x45
	.4byte	0xb0e
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.byte	0x1
	.byte	0x7f
	.byte	0xa
	.4byte	0xfb6
	.byte	0x46
	.4byte	.LBB17
	.4byte	.LBE17-.LBB17
	.byte	0x3e
	.4byte	0xb31
	.byte	0x43
	.4byte	0xb3d
	.4byte	.LLST8
	.byte	0x4a
	.4byte	0xb49
	.4byte	.Ldebug_ranges0+0
	.byte	0x43
	.4byte	0xb4a
	.4byte	.LLST9
	.byte	0x4a
	.4byte	0xb54
	.4byte	.Ldebug_ranges0+0x18
	.byte	0x43
	.4byte	0xb55
	.4byte	.LLST10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x41
	.4byte	.LVL26
	.4byte	0x1069
	.4byte	0xfc9
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x39
	.4byte	.LVL28
	.4byte	0x1081
	.byte	0x3a
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	adc_data.4352
	.byte	0x3a
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xa
	.2byte	0x1000
	.byte	0
	.byte	0
	.byte	0x4b
	.4byte	.LASF167
	.4byte	.LASF167
	.byte	0x9
	.byte	0x6e
	.byte	0xf
	.byte	0x4c
	.string	"pow"
	.string	"pow"
	.byte	0x9
	.byte	0x6f
	.byte	0xf
	.byte	0x4b
	.4byte	.LASF168
	.4byte	.LASF168
	.byte	0xd
	.byte	0xc8
	.byte	0x5
	.byte	0x4d
	.4byte	.LASF169
	.4byte	.LASF169
	.byte	0xe
	.2byte	0x2f6
	.byte	0x6
	.byte	0x4b
	.4byte	.LASF170
	.4byte	.LASF170
	.byte	0xf
	.byte	0x2c
	.byte	0x5
	.byte	0x4b
	.4byte	.LASF171
	.4byte	.LASF171
	.byte	0xf
	.byte	0x2e
	.byte	0x5
	.byte	0x4b
	.4byte	.LASF172
	.4byte	.LASF172
	.byte	0xc
	.byte	0x3a
	.byte	0x5
	.byte	0x4b
	.4byte	.LASF173
	.4byte	.LASF173
	.byte	0xc
	.byte	0x35
	.byte	0x5
	.byte	0x4b
	.4byte	.LASF174
	.4byte	.LASF174
	.byte	0xc
	.byte	0x36
	.byte	0x5
	.byte	0x4b
	.4byte	.LASF175
	.4byte	.LASF175
	.byte	0xc
	.byte	0x38
	.byte	0x5
	.byte	0x4b
	.4byte	.LASF176
	.4byte	.LASF176
	.byte	0xc
	.byte	0x39
	.byte	0x5
	.byte	0x4b
	.4byte	.LASF177
	.4byte	.LASF177
	.byte	0x10
	.byte	0x4e
	.byte	0x7
	.byte	0x4b
	.4byte	.LASF178
	.4byte	.LASF178
	.byte	0xc
	.byte	0x37
	.byte	0x5
	.byte	0x4b
	.4byte	.LASF179
	.4byte	.LASF179
	.byte	0x11
	.byte	0x1f
	.byte	0x8
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
	.byte	0xe
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
	.byte	0x8
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
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3e
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
	.byte	0x22
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xd
	.byte	0
	.byte	0
	.byte	0x23
	.byte	0x28
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x1c
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x24
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
	.byte	0x25
	.byte	0x21
	.byte	0
	.byte	0
	.byte	0
	.byte	0x26
	.byte	0x4
	.byte	0x1
	.byte	0x3e
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
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
	.byte	0x27
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x28
	.byte	0x34
	.byte	0
	.byte	0x47
	.byte	0x13
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x29
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
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2a
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
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2b
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
	.byte	0
	.byte	0
	.byte	0x2c
	.byte	0xb
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x2d
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
	.byte	0
	.byte	0
	.byte	0x2e
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x2f
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
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x30
	.byte	0x5
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
	.byte	0
	.byte	0
	.byte	0x31
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x32
	.byte	0x5
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
	.byte	0x33
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
	.byte	0x27
	.byte	0x19
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
	.byte	0x34
	.byte	0x5
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x35
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x36
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x37
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
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x38
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x39
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3a
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x3b
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3c
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3d
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3e
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x3f
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x40
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
	.byte	0x41
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
	.byte	0x42
	.byte	0x2e
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x43
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x44
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x45
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x46
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x47
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x95,0x42
	.byte	0x19
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x48
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x95,0x42
	.byte	0x19
	.byte	0x31
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x49
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x95,0x42
	.byte	0x19
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4a
	.byte	0xb
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x4b
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
	.byte	0x4c
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0x8
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x4d
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
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST11:
	.4byte	.LVL34
	.4byte	.LVL35-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL35-1
	.4byte	.LFE28
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL37
	.4byte	.LVL38-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL37
	.4byte	.LVL38-1
	.2byte	0x13
	.byte	0x7a
	.byte	0
	.byte	0xf7
	.byte	0x2c
	.byte	0xf7
	.byte	0x25
	.byte	0xf4
	.byte	0x25
	.byte	0x8
	.4byte	0
	.4byte	0x407f4000
	.byte	0x1b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST15:
	.4byte	.LVL43
	.4byte	.LVL52
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.4byte	0xac083127
	.4byte	0xbfd45a1c
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL43
	.4byte	.LVL52
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.4byte	0x9ba5e354
	.4byte	0x3ff220c4
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL43
	.4byte	.LVL52
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.4byte	0x9999999a
	.4byte	0x40279999
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL43
	.4byte	.LVL52
	.2byte	0x1c
	.byte	0xf4
	.byte	0x25
	.byte	0x8
	.4byte	0
	.4byte	0x40140000
	.byte	0xf5
	.byte	0x1a
	.byte	0x25
	.byte	0x1b
	.byte	0xf4
	.byte	0x25
	.byte	0x8
	.4byte	0
	.4byte	0x3ff00000
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST19:
	.4byte	.LVL43
	.4byte	.LVL52
	.2byte	0x28
	.byte	0xf4
	.byte	0x25
	.byte	0x8
	.4byte	0
	.4byte	0x40140000
	.byte	0xf5
	.byte	0x1a
	.byte	0x25
	.byte	0x1b
	.byte	0xf4
	.byte	0x25
	.byte	0x8
	.4byte	0
	.4byte	0x3ff00000
	.byte	0x1c
	.byte	0xf4
	.byte	0x25
	.byte	0x8
	.4byte	0x9999999a
	.4byte	0x40279999
	.byte	0x1b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST20:
	.4byte	.LVL47
	.4byte	.LVL48-1
	.2byte	0x1c
	.byte	0xf5
	.byte	0xa
	.byte	0x25
	.byte	0xf4
	.byte	0x25
	.byte	0x8
	.4byte	0x9ba5e354
	.4byte	0x3ff220c4
	.byte	0x1c
	.byte	0xf4
	.byte	0x25
	.byte	0x8
	.4byte	0xac083127
	.4byte	0xbfd45a1c
	.byte	0x1b
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL34
	.4byte	.LVL35
	.2byte	0x2
	.byte	0x3e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL10
	.4byte	.LVL12
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL11
	.4byte	.LVL13-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL2
	.4byte	.LVL6
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL3
	.4byte	.LVL4
	.2byte	0x10
	.byte	0x7f
	.byte	0
	.byte	0x11
	.byte	0xff,0xff,0xf9,0x81,0x7f
	.byte	0x1a
	.byte	0xc
	.4byte	0x2410000
	.byte	0x21
	.byte	0x9f
	.4byte	.LVL4
	.4byte	.LVL5
	.2byte	0x9
	.byte	0x7f
	.byte	0
	.byte	0xc
	.4byte	0x2410000
	.byte	0x21
	.byte	0x9f
	.4byte	.LVL5
	.4byte	.LVL6
	.2byte	0x1
	.byte	0x5f
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL22
	.4byte	.LVL23
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL23
	.4byte	.LVL24
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	.LVL24
	.4byte	.LVL25-1
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL25-1
	.4byte	.LFE30
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL26
	.4byte	.LVL27
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL28
	.4byte	.LVL33
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL28
	.4byte	.LVL29
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL29
	.4byte	.LVL33
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL28
	.4byte	.LVL29
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL29
	.4byte	.LVL30
	.2byte	0xe
	.byte	0x7f
	.byte	0
	.byte	0x6
	.byte	0xa
	.2byte	0xffff
	.byte	0x1a
	.byte	0xa
	.2byte	0x7d00
	.byte	0x1e
	.byte	0x40
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL30
	.4byte	.LVL31
	.2byte	0xd
	.byte	0x7e
	.byte	0
	.byte	0xa
	.2byte	0xffff
	.byte	0x1a
	.byte	0xa
	.2byte	0x7d00
	.byte	0x1e
	.byte	0x40
	.byte	0x25
	.byte	0x9f
	.4byte	.LVL31
	.4byte	.LVL33
	.2byte	0xe
	.byte	0x7f
	.byte	0x7c
	.byte	0x6
	.byte	0xa
	.2byte	0xffff
	.byte	0x1a
	.byte	0xa
	.2byte	0x7d00
	.byte	0x1e
	.byte	0x40
	.byte	0x25
	.byte	0x9f
	.4byte	0
	.4byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x3c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.LBB18
	.4byte	.LBE18
	.4byte	.LBB21
	.4byte	.LBE21
	.4byte	0
	.4byte	0
	.4byte	.LBB19
	.4byte	.LBE19
	.4byte	.LBB20
	.4byte	.LBE20
	.4byte	0
	.4byte	0
	.4byte	.LBB22
	.4byte	.LBE22
	.4byte	.LBB25
	.4byte	.LBE25
	.4byte	0
	.4byte	0
	.4byte	.LBB26
	.4byte	.LBE26
	.4byte	.LBB29
	.4byte	.LBE29
	.4byte	0
	.4byte	0
	.4byte	.LBB27
	.4byte	.LBE27
	.4byte	.LBB28
	.4byte	.LBE28
	.4byte	0
	.4byte	0
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LFB30
	.4byte	.LFE30
	.4byte	.LFB31
	.4byte	.LFE31
	.4byte	.LFB28
	.4byte	.LFE28
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF168:
	.string	"printf"
.LASF170:
	.string	"bl_gpio_enable_output"
.LASF3:
	.string	"short int"
.LASF51:
	.string	"_ind"
.LASF164:
	.string	"RS_gas"
.LASF46:
	.string	"_fnargs"
.LASF167:
	.string	"log10"
.LASF154:
	.string	"sensor_volt"
.LASF79:
	.string	"_emergency"
.LASF138:
	.string	"ADC_PGA_GAIN_NONE"
.LASF91:
	.string	"_atexit0"
.LASF119:
	.string	"_wcrtomb_state"
.LASF120:
	.string	"_wcsrtombs_state"
.LASF125:
	.string	"TrapNetCounter"
.LASF139:
	.string	"ADC_PGA_GAIN_1"
.LASF140:
	.string	"ADC_PGA_GAIN_2"
.LASF130:
	.string	"__fdlibm_posix"
.LASF141:
	.string	"ADC_PGA_GAIN_4"
.LASF159:
	.string	"gain1"
.LASF160:
	.string	"gain2"
.LASF142:
	.string	"ADC_PGA_GAIN_8"
.LASF183:
	.string	"__locale_t"
.LASF188:
	.string	"task_buzzer"
.LASF131:
	.string	"__fdlib_version"
.LASF117:
	.string	"_mbrtowc_state"
.LASF112:
	.string	"_wctomb_state"
.LASF36:
	.string	"__tm_sec"
.LASF4:
	.string	"int16_t"
.LASF19:
	.string	"_off_t"
.LASF64:
	.string	"_close"
.LASF2:
	.string	"signed char"
.LASF166:
	.string	"ppm_log"
.LASF169:
	.string	"vTaskDelay"
.LASF14:
	.string	"long long unsigned int"
.LASF38:
	.string	"__tm_hour"
.LASF94:
	.string	"__sf"
.LASF45:
	.string	"_on_exit_args"
.LASF60:
	.string	"_cookie"
.LASF93:
	.string	"__sglue"
.LASF6:
	.string	"long int"
.LASF57:
	.string	"_flags"
.LASF49:
	.string	"_is_cxa"
.LASF75:
	.string	"_stdin"
.LASF65:
	.string	"_ubuf"
.LASF162:
	.string	"adcValue"
.LASF85:
	.string	"_result_k"
.LASF7:
	.string	"long long int"
.LASF148:
	.string	"channel_data"
.LASF10:
	.string	"uint16_t"
.LASF0:
	.string	"double"
.LASF15:
	.string	"BaseType_t"
.LASF89:
	.string	"_cvtbuf"
.LASF68:
	.string	"_offset"
.LASF118:
	.string	"_mbsrtowcs_state"
.LASF104:
	.string	"_strtok_last"
.LASF116:
	.string	"_mbrlen_state"
.LASF11:
	.string	"short unsigned int"
.LASF52:
	.string	"_fns"
.LASF32:
	.string	"_sign"
.LASF126:
	.string	"_impure_ptr"
.LASF77:
	.string	"_stderr"
.LASF34:
	.string	"_Bigint"
.LASF177:
	.string	"bl_dma_find_ctx_by_channel"
.LASF61:
	.string	"_read"
.LASF134:
	.string	"temp"
.LASF182:
	.string	"/home/parag/bl_iot_sdk/customer_app/SWEMS/build_out/SWEMS"
.LASF35:
	.string	"__tm"
.LASF23:
	.string	"__wchb"
.LASF143:
	.string	"ADC_PGA_GAIN_16"
.LASF76:
	.string	"_stdout"
.LASF88:
	.string	"_cvtlen"
.LASF13:
	.string	"long unsigned int"
.LASF58:
	.string	"_file"
.LASF137:
	.string	"intCbfArra"
.LASF187:
	.string	"pvParameters"
.LASF69:
	.string	"_data"
.LASF97:
	.string	"_niobs"
.LASF163:
	.string	"sensorValue"
.LASF108:
	.string	"_rand_next"
.LASF161:
	.string	"adc_data"
.LASF133:
	.string	"humidity"
.LASF114:
	.string	"_signal_buf"
.LASF105:
	.string	"_asctime_buf"
.LASF84:
	.string	"_result"
.LASF22:
	.string	"__wch"
.LASF179:
	.string	"memcpy"
.LASF47:
	.string	"_dso_handle"
.LASF150:
	.string	"lli_flag"
.LASF90:
	.string	"_new"
.LASF70:
	.string	"_lock"
.LASF101:
	.string	"_mult"
.LASF172:
	.string	"bl_adc_freq_init"
.LASF62:
	.string	"_write"
.LASF41:
	.string	"__tm_year"
.LASF144:
	.string	"ADC_PGA_GAIN_32"
.LASF123:
	.string	"_nmalloc"
.LASF178:
	.string	"bl_adc_start"
.LASF136:
	.string	"intCallback_Type"
.LASF155:
	.string	"scaled"
.LASF175:
	.string	"bl_adc_gpio_init"
.LASF16:
	.string	"TickType_t"
.LASF122:
	.string	"_nextf"
.LASF40:
	.string	"__tm_mon"
.LASF50:
	.string	"_atexit"
.LASF82:
	.string	"__sdidinit"
.LASF107:
	.string	"_gamma_signgam"
.LASF18:
	.string	"wint_t"
.LASF185:
	.string	"set_adc_gain"
.LASF135:
	.string	"SystemCoreClock"
.LASF87:
	.string	"_freelist"
.LASF26:
	.string	"_mbstate_t"
.LASF186:
	.string	"task_mq4"
.LASF28:
	.string	"_LOCK_RECURSIVE_T"
.LASF146:
	.string	"adc_ctx"
.LASF54:
	.string	"_base"
.LASF181:
	.string	"/home/parag/bl_iot_sdk/customer_app/SWEMS/SWEMS/mq4.c"
.LASF5:
	.string	"int32_t"
.LASF9:
	.string	"unsigned char"
.LASF98:
	.string	"_iobs"
.LASF153:
	.string	"adc_ctx_t"
.LASF121:
	.string	"_h_errno"
.LASF29:
	.string	"_flock_t"
.LASF152:
	.string	"data_size"
.LASF72:
	.string	"_flags2"
.LASF174:
	.string	"bl_adc_dma_init"
.LASF95:
	.string	"__FILE"
.LASF56:
	.string	"__sFILE"
.LASF71:
	.string	"_mbstate"
.LASF110:
	.string	"_mblen_state"
.LASF78:
	.string	"_inc"
.LASF171:
	.string	"bl_gpio_output_set"
.LASF157:
	.string	"init_adc"
.LASF83:
	.string	"__cleanup"
.LASF80:
	.string	"_unspecified_locale_info"
.LASF156:
	.string	"read_adc"
.LASF31:
	.string	"_maxwds"
.LASF180:
	.string	"GNU C99 8.3.0 -march=rv32imfc -mabi=ilp32f -gdwarf -Os -std=gnu99 -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -fshort-enums -ffreestanding -fno-strict-aliasing"
.LASF99:
	.string	"_rand48"
.LASF100:
	.string	"_seed"
.LASF24:
	.string	"__count"
.LASF25:
	.string	"__value"
.LASF42:
	.string	"__tm_wday"
.LASF20:
	.string	"_fpos_t"
.LASF128:
	.string	"float"
.LASF74:
	.string	"_errno"
.LASF17:
	.string	"char"
.LASF67:
	.string	"_blksize"
.LASF147:
	.string	"mode"
.LASF55:
	.string	"_size"
.LASF1:
	.string	"unsigned int"
.LASF149:
	.string	"adc_lli"
.LASF48:
	.string	"_fntypes"
.LASF165:
	.string	"ratio"
.LASF8:
	.string	"uint8_t"
.LASF30:
	.string	"_next"
.LASF63:
	.string	"_seek"
.LASF176:
	.string	"bl_adc_get_channel_by_gpio"
.LASF132:
	.string	"buzz"
.LASF102:
	.string	"_add"
.LASF27:
	.string	"__ULong"
.LASF115:
	.string	"_getdate_err"
.LASF184:
	.string	"__fdlibm_version"
.LASF173:
	.string	"bl_adc_init"
.LASF127:
	.string	"_global_impure_ptr"
.LASF129:
	.string	"__fdlibm_ieee"
.LASF103:
	.string	"_unused_rand"
.LASF33:
	.string	"_wds"
.LASF96:
	.string	"_glue"
.LASF21:
	.string	"_ssize_t"
.LASF113:
	.string	"_l64a_buf"
.LASF158:
	.string	"channel"
.LASF92:
	.string	"_sig_func"
.LASF151:
	.string	"chan_init_table"
.LASF73:
	.string	"_reent"
.LASF66:
	.string	"_nbuf"
.LASF124:
	.string	"_unused"
.LASF44:
	.string	"__tm_isdst"
.LASF106:
	.string	"_localtime_buf"
.LASF37:
	.string	"__tm_min"
.LASF109:
	.string	"_r48"
.LASF145:
	.string	"bl_adc_cb_t"
.LASF111:
	.string	"_mbtowc_state"
.LASF86:
	.string	"_p5s"
.LASF43:
	.string	"__tm_yday"
.LASF81:
	.string	"_locale"
.LASF59:
	.string	"_lbfsize"
.LASF53:
	.string	"__sbuf"
.LASF12:
	.string	"uint32_t"
.LASF39:
	.string	"__tm_mday"
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"
