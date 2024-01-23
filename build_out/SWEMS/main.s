	.file	"main.c"
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
.LFB5:
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
	lui	s0,%hi(.LANCHOR0)
	.loc 1 31 39
	lui	s1,%hi(temp)
	.loc 1 31 44
	li	s4,309
	.loc 1 31 83
	lui	s5,%hi(humidity)
	.loc 1 31 64
	li	s6,599
.L2:
	.loc 1 29 5 is_stmt 1
	.loc 1 31 9
	.loc 1 31 12 is_stmt 0
	lw	a0,%lo(.LANCHOR0)(s0)
	lw	a1,%lo(.LANCHOR0+4)(s0)
	mv	a2,s2
	mv	a3,s3
	call	__gedf2
.LVL2:
	bge	a0,zero,.L3
	.loc 1 31 44 discriminator 1
	lhu	a5,%lo(temp)(s1)
	addi	a5,a5,-100
	slli	a5,a5,16
	srli	a5,a5,16
	bgtu	a5,s4,.L3
	.loc 1 31 64 discriminator 3
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
.LFE5:
	.size	task_buzzer, .-task_buzzer
	.section	.text.init_adc.part.0,"ax",@progbits
	.align	1
	.type	init_adc.part.0, @function
init_adc.part.0:
.LFB36:
	.file 2 "/home/parag/bl_iot_sdk/customer_app/SWEMS/SWEMS/mq4.c"
	.loc 2 100 6
	.cfi_startproc
.LVL8:
	.loc 2 106 5
	.loc 2 113 3
	.loc 2 100 6 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 2 113 3
	li	a1,4096
	li	a0,1
	.loc 2 100 6
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.loc 2 113 3
	call	bl_adc_freq_init
.LVL9:
	.loc 2 115 3 is_stmt 1
	li	a1,14
	li	a0,1
	call	bl_adc_init
.LVL10:
	.loc 2 117 3
.LBB10:
.LBB11:
	.loc 2 72 3
	.loc 2 72 12 is_stmt 0
	li	a3,1073807360
	lw	a5,-1772(a3)
.LVL11:
	.loc 2 74 3 is_stmt 1
	.loc 2 75 3
	.loc 2 77 3
	.loc 2 79 5
	.loc 2 86 3
	li	a4,-264355840
	addi	a4,a4,-1
	and	a5,a5,a4
.LVL12:
	.loc 2 87 3
	.loc 2 89 5
	.loc 2 89 9 is_stmt 0
	li	a4,37822464
	or	a5,a5,a4
.LVL13:
	.loc 2 96 3 is_stmt 1
	.loc 2 96 59 is_stmt 0
	sw	a5,-1772(a3)
	.loc 2 97 3 is_stmt 1
.LVL14:
.LBE11:
.LBE10:
	.loc 2 119 3
	li	a1,1024
	li	a0,1
	call	bl_adc_dma_init
.LVL15:
	.loc 2 121 3
	li	a0,14
	call	bl_adc_gpio_init
.LVL16:
	.loc 2 123 3
	.loc 2 123 17 is_stmt 0
	li	a0,14
	call	bl_adc_get_channel_by_gpio
.LVL17:
	mv	s0,a0
.LVL18:
	.loc 2 124 3 is_stmt 1
	.loc 2 124 20 is_stmt 0
	li	a0,1
	call	bl_dma_find_ctx_by_channel
.LVL19:
	.loc 2 125 3 is_stmt 1
	.loc 2 125 30 is_stmt 0
	li	a5,1
	sll	a4,a5,s0
	.loc 2 125 24
	lw	a5,16(a0)
	or	a5,a5,a4
	sw	a5,16(a0)
	.loc 2 127 3 is_stmt 1
	.loc 2 128 1 is_stmt 0
	lw	s0,8(sp)
	.cfi_restore 8
.LVL20:
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 2 127 3
	tail	bl_adc_start
.LVL21:
	.cfi_endproc
.LFE36:
	.size	init_adc.part.0, .-init_adc.part.0
	.section	.text.init_adc,"ax",@progbits
	.align	1
	.globl	init_adc
	.type	init_adc, @function
init_adc:
.LFB30:
	.loc 2 101 1 is_stmt 1
	.cfi_startproc
.LVL22:
	.loc 2 102 3
	li	a5,14
	beq	a0,a5,.L10
	.loc 2 109 5
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
	.loc 2 131 1
	.cfi_startproc
	.loc 2 132 3
	.loc 2 134 3
	.loc 2 131 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 2 134 20
	li	a0,1
	.loc 2 131 1
	sw	ra,12(sp)
	sw	s0,8(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.loc 2 134 20
	call	bl_dma_find_ctx_by_channel
.LVL26:
	.loc 2 136 3 is_stmt 1
	.loc 2 136 10 is_stmt 0
	lw	a1,4(a0)
	li	a0,0
.LVL27:
	.loc 2 136 6
	beq	a1,zero,.L11
	.loc 2 141 3 is_stmt 1
	lui	s0,%hi(adc_data.4352)
	li	a2,4096
	addi	a0,s0,%lo(adc_data.4352)
	call	memcpy
.LVL28:
	.loc 2 146 3
	.loc 2 147 3
	.loc 2 147 8
	addi	a5,s0,%lo(adc_data.4352)
	li	a3,4096
.LBB16:
.LBB17:
.LBB18:
.LBB19:
	.loc 2 149 37 is_stmt 0
	li	a1,65536
	.loc 2 149 47
	li	a2,32768
	add	a3,a5,a3
.LBE19:
.LBE18:
	.loc 2 146 12
	li	a0,0
.LBB21:
.LBB20:
	.loc 2 149 37
	addi	a1,a1,-1
	.loc 2 149 47
	addi	a2,a2,-768
.LVL29:
.L13:
	.loc 2 149 5 is_stmt 1
	.loc 2 150 5
	.loc 2 149 37 is_stmt 0
	lw	a4,0(a5)
	addi	a5,a5,4
.LVL30:
	and	a4,a4,a1
.LVL31:
	.loc 2 149 47
	mul	a4,a4,a2
	.loc 2 149 14
	srli	a4,a4,16
	.loc 2 150 9
	add	a0,a0,a4
.LVL32:
.LBE20:
	.loc 2 147 3
	bne	a3,a5,.L13
.LBE21:
	.loc 2 153 3 is_stmt 1
	.loc 2 153 14 is_stmt 0
	srli	a0,a0,10
.LVL33:
.L11:
.LBE17:
.LBE16:
	.loc 2 154 1
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
	.loc 2 29 1 is_stmt 1
	.cfi_startproc
.LVL34:
	.loc 2 30 3
	lui	a0,%hi(.LC2)
.LVL35:
	.loc 2 29 1 is_stmt 0
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	.loc 2 30 3
	addi	a0,a0,%lo(.LC2)
	.loc 2 29 1
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
	.loc 2 30 3
	call	printf
.LVL36:
	.loc 2 32 3 is_stmt 1
.LBB22:
.LBB23:
	.loc 2 102 3
	call	init_adc.part.0
.LVL37:
.LBE23:
.LBE22:
	.loc 2 34 3
	lui	a0,%hi(.LC3)
	addi	a0,a0,%lo(.LC3)
	call	printf
.LVL38:
	.loc 2 36 3
	li	a0,2000
	call	vTaskDelay
.LVL39:
.LBB24:
	.loc 2 42 12 is_stmt 0
	lui	a5,%hi(.LC4)
	lw	s8,%lo(.LC4)(a5)
	lw	s9,%lo(.LC4+4)(a5)
	.loc 2 44 12
	lui	a5,%hi(.LC5)
	lw	s0,%lo(.LC5)(a5)
	lw	s1,%lo(.LC5+4)(a5)
.LBB25:
	.loc 2 56 36
	lui	a5,%hi(.LC6)
	lw	s2,%lo(.LC6)(a5)
	lw	s3,%lo(.LC6+4)(a5)
	.loc 2 56 14
	lui	a5,%hi(.LC7)
	lw	s4,%lo(.LC7)(a5)
	lw	s5,%lo(.LC7+4)(a5)
	.loc 2 59 13
	lui	a5,%hi(.LC11)
	lw	s6,%lo(.LC11)(a5)
	lw	s7,%lo(.LC11+4)(a5)
.L21:
.LBE25:
.LBE24:
	.loc 2 38 3 is_stmt 1
.LBB27:
	.loc 2 40 5
	.loc 2 40 25 is_stmt 0
	call	read_adc
.LVL40:
	.loc 2 42 5 is_stmt 1
	.loc 2 44 5
	.loc 2 42 26 is_stmt 0
	call	__floatunsidf
.LVL41:
	.loc 2 42 12
	mv	a2,s8
	mv	a3,s9
	call	__divdf3
.LVL42:
	.loc 2 44 12
	mv	a2,s0
	mv	a3,s1
	call	__muldf3
.LVL43:
	.loc 2 51 8
	li	a2,0
	li	a3,0
	.loc 2 44 12
	mv	s10,a0
	mv	s11,a1
.LVL44:
	.loc 2 51 5 is_stmt 1
	.loc 2 51 8 is_stmt 0
	call	__nedf2
.LVL45:
	beq	a0,zero,.L19
.LBB26:
	.loc 2 53 7 is_stmt 1
.LVL46:
	.loc 2 54 7
	.loc 2 55 7
	.loc 2 56 7
	.loc 2 57 7
	.loc 2 58 7
	.loc 2 56 36 is_stmt 0
	mv	a2,s10
	mv	a3,s11
	mv	a0,s2
	mv	a1,s3
	call	__divdf3
.LVL47:
	.loc 2 56 14
	mv	a2,s4
	mv	a3,s5
	call	__subdf3
.LVL48:
	.loc 2 57 14
	lui	a5,%hi(.LC8)
	lw	a2,%lo(.LC8)(a5)
	lw	a3,%lo(.LC8+4)(a5)
	call	__divdf3
.LVL49:
	.loc 2 58 25
	call	log10
.LVL50:
	.loc 2 59 7 is_stmt 1
	.loc 2 58 38 is_stmt 0
	lui	a5,%hi(.LC9)
	lw	a2,%lo(.LC9)(a5)
	lw	a3,%lo(.LC9+4)(a5)
	call	__subdf3
.LVL51:
	.loc 2 58 14
	lui	a5,%hi(.LC10)
	lw	a2,%lo(.LC10)(a5)
	lw	a3,%lo(.LC10+4)(a5)
	call	__divdf3
.LVL52:
	.loc 2 59 13
	mv	a2,a0
	mv	a3,a1
	mv	a0,s6
	mv	a1,s7
	call	pow
.LVL53:
	.loc 2 59 30
	lui	a5,%hi(.LC12)
	lw	a2,%lo(.LC12)(a5)
	lw	a3,%lo(.LC12+4)(a5)
	call	__adddf3
.LVL54:
	.loc 2 59 11
	lui	a5,%hi(.LANCHOR0)
	.loc 2 59 30
	mv	a2,a0
	.loc 2 59 11
	sw	a0,%lo(.LANCHOR0)(a5)
	.loc 2 61 7
	lui	a0,%hi(.LC13)
	.loc 2 59 30
	mv	a3,a1
	.loc 2 61 7
	addi	a0,a0,%lo(.LC13)
	.loc 2 59 11
	sw	a1,%lo(.LANCHOR0+4)(a5)
	.loc 2 61 7 is_stmt 1
	call	printf
.LVL55:
.L19:
.LBE26:
	.loc 2 64 5
	li	a0,4096
	addi	a0,a0,904
	call	vTaskDelay
.LVL56:
.LBE27:
	.loc 2 39 3 is_stmt 0
	j	.L21
	.cfi_endproc
.LFE28:
	.size	task_mq4, .-task_mq4
	.section	.text.initiateGPIO,"ax",@progbits
	.align	1
	.globl	initiateGPIO
	.type	initiateGPIO, @function
initiateGPIO:
.LFB32:
	.file 3 "/home/parag/bl_iot_sdk/customer_app/SWEMS/SWEMS/dht.c"
	.loc 3 19 1 is_stmt 1
	.cfi_startproc
	.loc 3 20 3
	li	a2,0
	li	a1,0
	li	a0,5
	tail	bl_gpio_enable_output
.LVL57:
	.cfi_endproc
.LFE32:
	.size	initiateGPIO, .-initiateGPIO
	.section	.text.sendStartSignal,"ax",@progbits
	.align	1
	.globl	sendStartSignal
	.type	sendStartSignal, @function
sendStartSignal:
.LFB33:
	.loc 3 23 1
	.cfi_startproc
	.loc 3 24 3
	.loc 3 23 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 3 24 3
	li	a1,0
	li	a0,5
	.loc 3 23 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 3 24 3
	call	bl_gpio_output_set
.LVL58:
	.loc 3 25 3 is_stmt 1
	li	a0,1
	call	vTaskDelay
.LVL59:
	.loc 3 27 3
	li	a1,1
	li	a0,5
	call	bl_gpio_output_set
.LVL60:
	.loc 3 28 3
	.loc 3 29 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	.loc 3 28 3
	li	a0,30
	.loc 3 29 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 3 28 3
	tail	bl_timer_delay_us
.LVL61:
	.cfi_endproc
.LFE33:
	.size	sendStartSignal, .-sendStartSignal
	.section	.text.task_dht,"ax",@progbits
	.align	1
	.globl	task_dht
	.type	task_dht, @function
task_dht:
.LFB34:
	.loc 3 32 1 is_stmt 1
	.cfi_startproc
.LVL62:
	.loc 3 33 3
	lui	a0,%hi(.LC14)
.LVL63:
	.loc 3 32 1 is_stmt 0
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	.loc 3 33 3
	addi	a0,a0,%lo(.LC14)
	.loc 3 32 1
	sw	s1,52(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s5,36(sp)
	sw	s6,32(sp)
	sw	s7,28(sp)
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s8,24(sp)
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 21, -28
	.cfi_offset 22, -32
	.cfi_offset 23, -36
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 24, -40
.LBB28:
	.loc 3 42 11
	li	s1,1
.LBE28:
	.loc 3 33 3
	call	printf
.LVL64:
.LBB30:
	.loc 3 64 14
	lui	s2,%hi(humidity)
	.loc 3 65 10
	lui	s3,%hi(temp)
	lui	s4,%hi(.LC17)
	lui	s5,%hi(.LC18)
	.loc 3 88 7
	lui	s6,%hi(.LC16)
	.loc 3 76 9
	lui	s7,%hi(.LC15)
.L39:
.LBE30:
	.loc 3 34 3 is_stmt 1
.LBB31:
	.loc 3 36 5
	call	initiateGPIO
.LVL65:
	.loc 3 37 5
	.loc 3 37 13 is_stmt 0
	sw	zero,8(sp)
	sb	zero,12(sp)
	.loc 3 38 5 is_stmt 1
	call	sendStartSignal
.LVL66:
	.loc 3 40 5
	li	a2,0
	li	a1,0
	li	a0,5
	call	bl_gpio_enable_input
.LVL67:
	.loc 3 42 5
.L28:
	.loc 3 43 7 discriminator 1
	.loc 3 42 12 is_stmt 0 discriminator 1
	li	a0,5
	call	bl_gpio_input_get_value
.LVL68:
	.loc 3 42 11 discriminator 1
	beq	a0,s1,.L28
.L29:
	.loc 3 45 7 is_stmt 1 discriminator 1
	.loc 3 44 12 is_stmt 0 discriminator 1
	li	a0,5
	call	bl_gpio_input_get_value
.LVL69:
	.loc 3 44 11 discriminator 1
	beq	a0,zero,.L29
.L30:
	.loc 3 47 7 is_stmt 1 discriminator 1
	.loc 3 46 12 is_stmt 0 discriminator 1
	li	a0,5
	call	bl_gpio_input_get_value
.LVL70:
	.loc 3 46 11 discriminator 1
	beq	a0,s1,.L30
.LBB29:
	.loc 3 49 14
	li	s8,0
	.loc 3 49 5
	li	s0,40
.L31:
	.loc 3 52 9 is_stmt 1 discriminator 1
	.loc 3 51 14 is_stmt 0 discriminator 1
	li	a0,5
	call	bl_gpio_input_get_value
.LVL71:
	.loc 3 51 13 discriminator 1
	beq	a0,zero,.L31
	.loc 3 54 7 is_stmt 1
	li	a0,30
	call	bl_timer_delay_us
.LVL72:
	.loc 3 56 7
	.loc 3 56 11 is_stmt 0
	li	a0,5
	call	bl_gpio_input_get_value
.LVL73:
	.loc 3 56 10
	beq	a0,zero,.L33
	.loc 3 58 9 is_stmt 1
	.loc 3 58 21 is_stmt 0
	addi	a5,sp,16
	.loc 3 58 16
	srai	a4,s8,3
	.loc 3 58 21
	add	a4,a5,a4
	lbu	a3,-8(a4)
	.loc 3 58 27
	not	a5,s8
	andi	a5,a5,7
	sll	a5,s1,a5
	.loc 3 58 21
	or	a5,a5,a3
	sb	a5,-8(a4)
.L33:
	.loc 3 62 9 is_stmt 1 discriminator 1
	.loc 3 61 14 is_stmt 0 discriminator 1
	li	a0,5
	call	bl_gpio_input_get_value
.LVL74:
	.loc 3 61 13 discriminator 1
	beq	a0,s1,.L33
	.loc 3 49 30 discriminator 2
	addi	s8,s8,1
.LVL75:
	.loc 3 49 5 discriminator 2
	bne	s8,s0,.L31
.LBE29:
	.loc 3 64 5 is_stmt 1
	.loc 3 64 21 is_stmt 0
	lbu	a2,8(sp)
	.loc 3 64 36
	lbu	a5,9(sp)
	.loc 3 65 17
	lbu	a3,10(sp)
	.loc 3 64 25
	slli	a4,a2,8
	.loc 3 64 30
	or	a4,a4,a5
	.loc 3 64 14
	sh	a4,%lo(humidity)(s2)
	.loc 3 65 5 is_stmt 1
	.loc 3 65 32 is_stmt 0
	lbu	a4,11(sp)
	.loc 3 65 21
	slli	a1,a3,8
	.loc 3 70 18
	add	a5,a5,a2
	.loc 3 65 26
	or	a1,a1,a4
	.loc 3 70 28
	add	a5,a5,a3
	.loc 3 65 26
	slli	a1,a1,16
	.loc 3 70 38
	add	a5,a5,a4
	.loc 3 70 49
	lbu	a4,12(sp)
	.loc 3 65 26
	srai	a1,a1,16
	.loc 3 65 10
	sh	a1,%lo(temp)(s3)
	.loc 3 66 5 is_stmt 1
.LVL76:
	.loc 3 70 5
	.loc 3 70 8 is_stmt 0
	bne	a5,a4,.L35
	.loc 3 73 7 is_stmt 1
	.loc 3 73 10 is_stmt 0
	bge	a1,zero,.L36
	.loc 3 75 9 is_stmt 1
	.loc 3 75 14 is_stmt 0
	neg	a1,a1
	slli	s0,a1,16
	srai	s0,s0,16
	.loc 3 76 9
	li	s8,10
.LVL77:
	rem	a0,s0,s8
	.loc 3 75 14
	sh	s0,%lo(temp)(s3)
	.loc 3 76 9 is_stmt 1
	call	abs
.LVL78:
	div	a1,s0,s8
	mv	a2,a0
	addi	a0,s7,%lo(.LC15)
.L52:
	.loc 3 80 9 is_stmt 0
	call	printf
.LVL79:
	.loc 3 83 7 is_stmt 1
	lhu	a1,%lo(humidity)(s2)
	li	a5,10
	remu	a2,a1,a5
	divu	a1,a1,a5
.L53:
	.loc 3 89 7 is_stmt 0
	addi	a0,s4,%lo(.LC17)
	call	printf
.LVL80:
	.loc 3 90 7 is_stmt 1
	addi	a0,s5,%lo(.LC18)
	call	printf
.LVL81:
	.loc 3 93 5
	li	a0,8192
	addi	a0,a0,1808
	call	vTaskDelay
.LVL82:
.LBE31:
	.loc 3 35 3 is_stmt 0
	j	.L39
.LVL83:
.L36:
.LBB32:
	.loc 3 80 9 is_stmt 1
	li	a5,10
	rem	a2,a1,a5
	addi	a0,s6,%lo(.LC16)
	div	a1,a1,a5
	j	.L52
.L35:
	.loc 3 88 7
	li	s0,10
	rem	a2,a1,s0
	addi	a0,s6,%lo(.LC16)
	div	a1,a1,s0
	call	printf
.LVL84:
	.loc 3 89 7
	lhu	a1,%lo(humidity)(s2)
	remu	a2,a1,s0
	divu	a1,a1,s0
	j	.L53
.LBE32:
	.cfi_endproc
.LFE34:
	.size	task_dht, .-task_dht
	.section	.text.bfl_main,"ax",@progbits
	.align	1
	.globl	bfl_main
	.type	bfl_main, @function
bfl_main:
.LFB35:
	.file 4 "/home/parag/bl_iot_sdk/customer_app/SWEMS/SWEMS/main.c"
	.loc 4 35 1
	.cfi_startproc
	.loc 4 40 5
	li	a5,1998848
	.loc 4 35 1 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	.loc 4 40 5
	addi	a5,a5,1152
	li	a4,255
	li	a3,255
	li	a2,7
	li	a1,16
	li	a0,0
	.loc 4 35 1
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 4 40 5
	call	bl_uart_init
.LVL85:
	.loc 4 43 5 is_stmt 1
	lui	a0,%hi(.LANCHOR1)
	addi	a0,a0,%lo(.LANCHOR1)
	call	vPortDefineHeapRegions
.LVL86:
	.loc 4 46 5
	call	bl_dma_init
.LVL87:
	.loc 4 49 5
	.loc 4 50 5
	.loc 4 52 5
	.loc 4 53 5
	.loc 4 56 5
	.loc 4 57 5
	.loc 4 59 5
	lui	a6,%hi(.LANCHOR2)
	lui	a5,%hi(mq4_stack.5257)
	lui	a1,%hi(.LC19)
	lui	a0,%hi(task_mq4)
	addi	a6,a6,%lo(.LANCHOR2)
	addi	a5,a5,%lo(mq4_stack.5257)
	li	a4,15
	li	a3,0
	li	a2,512
	addi	a1,a1,%lo(.LC19)
	addi	a0,a0,%lo(task_mq4)
	call	xTaskCreateStatic
.LVL88:
	.loc 4 68 5
	lui	a6,%hi(.LANCHOR3)
	lui	a5,%hi(.LANCHOR4)
	lui	a1,%hi(.LC20)
	lui	a0,%hi(task_buzzer)
	addi	a6,a6,%lo(.LANCHOR3)
	addi	a5,a5,%lo(.LANCHOR4)
	li	a4,10
	li	a3,0
	li	a2,128
	addi	a1,a1,%lo(.LC20)
	addi	a0,a0,%lo(task_buzzer)
	call	xTaskCreateStatic
.LVL89:
	.loc 4 76 5
	lui	a6,%hi(.LANCHOR5)
	lui	a5,%hi(dht_stack.5261)
	lui	a1,%hi(.LC21)
	lui	a0,%hi(task_dht)
	addi	a6,a6,%lo(.LANCHOR5)
	addi	a5,a5,%lo(dht_stack.5261)
	li	a4,30
	li	a3,0
	li	a2,768
	addi	a1,a1,%lo(.LC21)
	addi	a0,a0,%lo(task_dht)
	call	xTaskCreateStatic
.LVL90:
	.loc 4 87 5
	.loc 4 88 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	.loc 4 87 5
	tail	vTaskStartScheduler
.LVL91:
	.cfi_endproc
.LFE35:
	.size	bfl_main, .-bfl_main
	.globl	buzz
	.comm	temp,2,2
	.comm	humidity,2,2
	.globl	ppm
	.globl	sensor_volt
	.section	.bss.adc_data.4352,"aw",@nobits
	.align	2
	.type	adc_data.4352, @object
	.size	adc_data.4352, 4096
adc_data.4352:
	.zero	4096
	.section	.bss.buzzer_stack.5259,"aw",@nobits
	.align	2
	.set	.LANCHOR4,. + 0
	.type	buzzer_stack.5259, @object
	.size	buzzer_stack.5259, 512
buzzer_stack.5259:
	.zero	512
	.section	.bss.buzzer_task.5260,"aw",@nobits
	.align	2
	.set	.LANCHOR3,. + 0
	.type	buzzer_task.5260, @object
	.size	buzzer_task.5260, 96
buzzer_task.5260:
	.zero	96
	.section	.bss.dht_stack.5261,"aw",@nobits
	.align	2
	.type	dht_stack.5261, @object
	.size	dht_stack.5261, 3072
dht_stack.5261:
	.zero	3072
	.section	.bss.dht_task.5262,"aw",@nobits
	.align	2
	.set	.LANCHOR5,. + 0
	.type	dht_task.5262, @object
	.size	dht_task.5262, 96
dht_task.5262:
	.zero	96
	.section	.bss.mq4_stack.5257,"aw",@nobits
	.align	2
	.type	mq4_stack.5257, @object
	.size	mq4_stack.5257, 2048
mq4_stack.5257:
	.zero	2048
	.section	.bss.mq4_task.5258,"aw",@nobits
	.align	2
	.set	.LANCHOR2,. + 0
	.type	mq4_task.5258, @object
	.size	mq4_task.5258, 96
mq4_task.5258:
	.zero	96
	.section	.data.xHeapRegions,"aw"
	.align	2
	.set	.LANCHOR1,. + 0
	.type	xHeapRegions, @object
	.size	xHeapRegions, 32
xHeapRegions:
	.word	_heap_start
	.word	_heap_size
	.word	_heap_wifi_start
	.word	_heap_wifi_size
	.word	0
	.word	0
	.word	0
	.word	0
	.section	.rodata.bfl_main.str1.4,"aMS",@progbits,1
	.align	2
.LC19:
	.string	"mq4"
.LC20:
	.string	"buzzer"
	.zero	1
.LC21:
	.string	"dht"
	.section	.rodata.init_adc.str1.4,"aMS",@progbits,1
	.align	2
.LC1:
	.string	"Invalid pin selected for ADC\r\n"
	.section	.rodata.task_buzzer.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	0
	.word	1081262080
	.section	.rodata.task_dht.str1.4,"aMS",@progbits,1
	.align	2
.LC14:
	.string	"DHT22 task started\r\n"
	.zero	3
.LC15:
	.string	"\033[31mTemperature: %d.%d *C\r\n"
	.zero	3
.LC16:
	.string	"\033[36mTemperature: %d.%d *C\r\n"
	.zero	3
.LC17:
	.string	"\033[33mHumidity: %d.%d \r\n"
.LC18:
	.string	"\033[0m"
	.section	.rodata.task_mq4.cst8,"aM",@progbits,8
	.align	3
.LC4:
	.word	0
	.word	1082081280
.LC5:
	.word	1078989829
	.word	1064568065
.LC6:
	.word	0
	.word	1075052544
.LC7:
	.word	0
	.word	1072693248
.LC8:
	.word	2576980378
	.word	1076337049
.LC9:
	.word	2611340116
	.word	1072832708
.LC10:
	.word	2886218023
	.word	-1076602340
.LC11:
	.word	0
	.word	1076101120
.LC12:
	.word	0
	.word	1080623104
	.section	.rodata.task_mq4.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"MQ4 task started\r\n"
	.zero	1
.LC3:
	.string	"MQ4 Sensor initialized\r\n"
	.zero	3
.LC13:
	.string	"\033[35mGas ppm = %f\r\n"
	.section	.sbss.buzz,"aw",@nobits
	.align	2
	.type	buzz, @object
	.size	buzz, 4
buzz:
	.zero	4
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
	.file 5 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/lib/gcc/riscv64-unknown-elf/8.3.0/include/stddef.h"
	.file 6 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/lib/gcc/riscv64-unknown-elf/8.3.0/include/stdint-gcc.h"
	.file 7 "/home/parag/bl_iot_sdk/components/bl602/freertos_riscv_ram/portable/GCC/RISC-V/portmacro.h"
	.file 8 "/home/parag/bl_iot_sdk/components/bl602/freertos_riscv_ram/config/portable.h"
	.file 9 "/home/parag/bl_iot_sdk/components/bl602/freertos_riscv_ram/config/FreeRTOS.h"
	.file 10 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/riscv64-unknown-elf/include/sys/_types.h"
	.file 11 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/riscv64-unknown-elf/include/sys/reent.h"
	.file 12 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/riscv64-unknown-elf/include/sys/lock.h"
	.file 13 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/riscv64-unknown-elf/include/math.h"
	.file 14 "/home/parag/bl_iot_sdk/components/bl602/bl602_std/bl602_std/RISCV/Device/Bouffalo/BL602/Startup/system_bl602.h"
	.file 15 "/home/parag/bl_iot_sdk/components/bl602/bl602_std/bl602_std/StdDriver/Inc/bl602_common.h"
	.file 16 "/home/parag/bl_iot_sdk/components/hal_drv/bl602_hal/bl_adc.h"
	.file 17 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/riscv64-unknown-elf/include/stdlib.h"
	.file 18 "/home/parag/bl_iot_sdk/components/hal_drv/bl602_hal/bl_uart.h"
	.file 19 "/home/parag/bl_iot_sdk/components/hal_drv/bl602_hal/bl_dma.h"
	.file 20 "/home/parag/bl_iot_sdk/components/bl602/freertos_riscv_ram/config/task.h"
	.file 21 "/home/parag/bl_iot_sdk/components/hal_drv/bl602_hal/bl_gpio.h"
	.file 22 "/home/parag/bl_iot_sdk/components/hal_drv/bl602_hal/bl_timer.h"
	.file 23 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/riscv64-unknown-elf/include/stdio.h"
	.file 24 "/home/parag/bl_iot_sdk/toolchain/riscv/Linux/riscv64-unknown-elf/include/string.h"
	.file 25 "/home/parag/bl_iot_sdk/components/bl602/bl602_std/bl602_std/StdDriver/Inc/bl602_adc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x17a9
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.byte	0x1
	.4byte	.LASF233
	.byte	0xc
	.4byte	.LASF234
	.4byte	.LASF235
	.4byte	.Ldebug_ranges0+0x88
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
	.byte	0x4
	.4byte	.LASF3
	.byte	0x5
	.byte	0xd8
	.byte	0x16
	.4byte	0x2c
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.byte	0x4
	.4byte	.LASF4
	.byte	0x6
	.byte	0x25
	.byte	0x13
	.4byte	0x59
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF5
	.byte	0x4
	.4byte	.LASF6
	.byte	0x6
	.byte	0x28
	.byte	0x12
	.4byte	0x6c
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.byte	0x4
	.4byte	.LASF9
	.byte	0x6
	.byte	0x2e
	.byte	0x17
	.4byte	0x86
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.byte	0x4
	.4byte	.LASF11
	.byte	0x6
	.byte	0x31
	.byte	0x1c
	.4byte	0x99
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF12
	.byte	0x4
	.4byte	.LASF13
	.byte	0x6
	.byte	0x34
	.byte	0x1b
	.4byte	0xac
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF14
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF15
	.byte	0x5
	.byte	0x4
	.byte	0x4
	.4byte	.LASF16
	.byte	0x7
	.byte	0x3e
	.byte	0x12
	.4byte	0xa0
	.byte	0x4
	.4byte	.LASF17
	.byte	0x7
	.byte	0x3f
	.byte	0x11
	.4byte	0x60
	.byte	0x4
	.4byte	.LASF18
	.byte	0x7
	.byte	0x40
	.byte	0x12
	.4byte	0xa0
	.byte	0x4
	.4byte	.LASF19
	.byte	0x7
	.byte	0x41
	.byte	0x12
	.4byte	0xa0
	.byte	0x6
	.4byte	.LASF149
	.byte	0x7
	.byte	0x54
	.byte	0x13
	.4byte	0xc8
	.byte	0x7
	.4byte	.LASF23
	.byte	0x8
	.byte	0x8
	.byte	0x7a
	.byte	0x10
	.4byte	0x120
	.byte	0x8
	.4byte	.LASF20
	.byte	0x8
	.byte	0x7c
	.byte	0xe
	.4byte	0x120
	.byte	0
	.byte	0x8
	.4byte	.LASF21
	.byte	0x8
	.byte	0x7d
	.byte	0xc
	.4byte	0x3a
	.byte	0x4
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0x7a
	.byte	0x4
	.4byte	.LASF22
	.byte	0x8
	.byte	0x7e
	.byte	0x3
	.4byte	0xf8
	.byte	0xa
	.4byte	.LASF24
	.byte	0x14
	.byte	0x9
	.2byte	0x414
	.byte	0x8
	.4byte	0x15d
	.byte	0xb
	.4byte	.LASF25
	.byte	0x9
	.2byte	0x419
	.byte	0x10
	.4byte	0xe0
	.byte	0
	.byte	0xb
	.4byte	.LASF26
	.byte	0x9
	.2byte	0x41a
	.byte	0xb
	.4byte	0x15d
	.byte	0x4
	.byte	0
	.byte	0xc
	.4byte	0xba
	.4byte	0x16d
	.byte	0xd
	.4byte	0x2c
	.byte	0x3
	.byte	0
	.byte	0xe
	.4byte	.LASF27
	.byte	0x9
	.2byte	0x41f
	.byte	0x22
	.4byte	0x132
	.byte	0xa
	.4byte	.LASF28
	.byte	0x60
	.byte	0x9
	.2byte	0x447
	.byte	0x10
	.4byte	0x223
	.byte	0xb
	.4byte	.LASF29
	.byte	0x9
	.2byte	0x449
	.byte	0xb
	.4byte	0xba
	.byte	0
	.byte	0xb
	.4byte	.LASF30
	.byte	0x9
	.2byte	0x44d
	.byte	0x16
	.4byte	0x223
	.byte	0x4
	.byte	0xb
	.4byte	.LASF31
	.byte	0x9
	.2byte	0x44e
	.byte	0x11
	.4byte	0xd4
	.byte	0x2c
	.byte	0xb
	.4byte	.LASF32
	.byte	0x9
	.2byte	0x44f
	.byte	0xb
	.4byte	0xba
	.byte	0x30
	.byte	0xb
	.4byte	.LASF33
	.byte	0x9
	.2byte	0x450
	.byte	0xd
	.4byte	0x233
	.byte	0x34
	.byte	0xb
	.4byte	.LASF34
	.byte	0x9
	.2byte	0x455
	.byte	0x15
	.4byte	0xd4
	.byte	0x44
	.byte	0xb
	.4byte	.LASF35
	.byte	0x9
	.2byte	0x458
	.byte	0x15
	.4byte	0x243
	.byte	0x48
	.byte	0xb
	.4byte	.LASF36
	.byte	0x9
	.2byte	0x45b
	.byte	0x15
	.4byte	0x243
	.byte	0x50
	.byte	0xb
	.4byte	.LASF37
	.byte	0x9
	.2byte	0x46a
	.byte	0x12
	.4byte	0xa0
	.byte	0x58
	.byte	0xb
	.4byte	.LASF38
	.byte	0x9
	.2byte	0x46b
	.byte	0x11
	.4byte	0x7a
	.byte	0x5c
	.byte	0xb
	.4byte	.LASF39
	.byte	0x9
	.2byte	0x46e
	.byte	0x11
	.4byte	0x7a
	.byte	0x5d
	.byte	0
	.byte	0xc
	.4byte	0x16d
	.4byte	0x233
	.byte	0xd
	.4byte	0x2c
	.byte	0x1
	.byte	0
	.byte	0xc
	.4byte	0x7a
	.4byte	0x243
	.byte	0xd
	.4byte	0x2c
	.byte	0xf
	.byte	0
	.byte	0xc
	.4byte	0xd4
	.4byte	0x253
	.byte	0xd
	.4byte	0x2c
	.byte	0x1
	.byte	0
	.byte	0xe
	.4byte	.LASF40
	.byte	0x9
	.2byte	0x477
	.byte	0x3
	.4byte	0x17a
	.byte	0x9
	.byte	0x4
	.4byte	0x26d
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF41
	.byte	0xf
	.4byte	0x266
	.byte	0xe
	.4byte	.LASF42
	.byte	0x5
	.2byte	0x165
	.byte	0x16
	.4byte	0x2c
	.byte	0x4
	.4byte	.LASF43
	.byte	0xa
	.byte	0x2e
	.byte	0xe
	.4byte	0x6c
	.byte	0x4
	.4byte	.LASF44
	.byte	0xa
	.byte	0x74
	.byte	0xe
	.4byte	0x6c
	.byte	0x4
	.4byte	.LASF45
	.byte	0xa
	.byte	0x93
	.byte	0x14
	.4byte	0x33
	.byte	0x10
	.byte	0x4
	.byte	0xa
	.byte	0xa5
	.byte	0x3
	.4byte	0x2c5
	.byte	0x11
	.4byte	.LASF46
	.byte	0xa
	.byte	0xa7
	.byte	0xc
	.4byte	0x272
	.byte	0x11
	.4byte	.LASF47
	.byte	0xa
	.byte	0xa8
	.byte	0x13
	.4byte	0x2c5
	.byte	0
	.byte	0xc
	.4byte	0x86
	.4byte	0x2d5
	.byte	0xd
	.4byte	0x2c
	.byte	0x3
	.byte	0
	.byte	0x12
	.byte	0x8
	.byte	0xa
	.byte	0xa2
	.byte	0x9
	.4byte	0x2f9
	.byte	0x8
	.4byte	.LASF48
	.byte	0xa
	.byte	0xa4
	.byte	0x7
	.4byte	0x33
	.byte	0
	.byte	0x8
	.4byte	.LASF49
	.byte	0xa
	.byte	0xa9
	.byte	0x5
	.4byte	0x2a3
	.byte	0x4
	.byte	0
	.byte	0x4
	.4byte	.LASF50
	.byte	0xa
	.byte	0xaa
	.byte	0x3
	.4byte	0x2d5
	.byte	0x4
	.4byte	.LASF51
	.byte	0xb
	.byte	0x16
	.byte	0x17
	.4byte	0xac
	.byte	0x4
	.4byte	.LASF52
	.byte	0xc
	.byte	0xc
	.byte	0xd
	.4byte	0x33
	.byte	0x4
	.4byte	.LASF53
	.byte	0xb
	.byte	0x23
	.byte	0x1b
	.4byte	0x311
	.byte	0x7
	.4byte	.LASF54
	.byte	0x18
	.byte	0xb
	.byte	0x34
	.byte	0x8
	.4byte	0x383
	.byte	0x8
	.4byte	.LASF55
	.byte	0xb
	.byte	0x36
	.byte	0x13
	.4byte	0x383
	.byte	0
	.byte	0x13
	.string	"_k"
	.byte	0xb
	.byte	0x37
	.byte	0x7
	.4byte	0x33
	.byte	0x4
	.byte	0x8
	.4byte	.LASF56
	.byte	0xb
	.byte	0x37
	.byte	0xb
	.4byte	0x33
	.byte	0x8
	.byte	0x8
	.4byte	.LASF57
	.byte	0xb
	.byte	0x37
	.byte	0x14
	.4byte	0x33
	.byte	0xc
	.byte	0x8
	.4byte	.LASF58
	.byte	0xb
	.byte	0x37
	.byte	0x1b
	.4byte	0x33
	.byte	0x10
	.byte	0x13
	.string	"_x"
	.byte	0xb
	.byte	0x38
	.byte	0xb
	.4byte	0x389
	.byte	0x14
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0x329
	.byte	0xc
	.4byte	0x305
	.4byte	0x399
	.byte	0xd
	.4byte	0x2c
	.byte	0
	.byte	0
	.byte	0x7
	.4byte	.LASF59
	.byte	0x24
	.byte	0xb
	.byte	0x3c
	.byte	0x8
	.4byte	0x41c
	.byte	0x8
	.4byte	.LASF60
	.byte	0xb
	.byte	0x3e
	.byte	0x7
	.4byte	0x33
	.byte	0
	.byte	0x8
	.4byte	.LASF61
	.byte	0xb
	.byte	0x3f
	.byte	0x7
	.4byte	0x33
	.byte	0x4
	.byte	0x8
	.4byte	.LASF62
	.byte	0xb
	.byte	0x40
	.byte	0x7
	.4byte	0x33
	.byte	0x8
	.byte	0x8
	.4byte	.LASF63
	.byte	0xb
	.byte	0x41
	.byte	0x7
	.4byte	0x33
	.byte	0xc
	.byte	0x8
	.4byte	.LASF64
	.byte	0xb
	.byte	0x42
	.byte	0x7
	.4byte	0x33
	.byte	0x10
	.byte	0x8
	.4byte	.LASF65
	.byte	0xb
	.byte	0x43
	.byte	0x7
	.4byte	0x33
	.byte	0x14
	.byte	0x8
	.4byte	.LASF66
	.byte	0xb
	.byte	0x44
	.byte	0x7
	.4byte	0x33
	.byte	0x18
	.byte	0x8
	.4byte	.LASF67
	.byte	0xb
	.byte	0x45
	.byte	0x7
	.4byte	0x33
	.byte	0x1c
	.byte	0x8
	.4byte	.LASF68
	.byte	0xb
	.byte	0x46
	.byte	0x7
	.4byte	0x33
	.byte	0x20
	.byte	0
	.byte	0x14
	.4byte	.LASF69
	.2byte	0x108
	.byte	0xb
	.byte	0x4f
	.byte	0x8
	.4byte	0x461
	.byte	0x8
	.4byte	.LASF70
	.byte	0xb
	.byte	0x50
	.byte	0x9
	.4byte	0x461
	.byte	0
	.byte	0x8
	.4byte	.LASF71
	.byte	0xb
	.byte	0x51
	.byte	0x9
	.4byte	0x461
	.byte	0x80
	.byte	0x15
	.4byte	.LASF72
	.byte	0xb
	.byte	0x53
	.byte	0xa
	.4byte	0x305
	.2byte	0x100
	.byte	0x15
	.4byte	.LASF73
	.byte	0xb
	.byte	0x56
	.byte	0xa
	.4byte	0x305
	.2byte	0x104
	.byte	0
	.byte	0xc
	.4byte	0xba
	.4byte	0x471
	.byte	0xd
	.4byte	0x2c
	.byte	0x1f
	.byte	0
	.byte	0x14
	.4byte	.LASF74
	.2byte	0x190
	.byte	0xb
	.byte	0x62
	.byte	0x8
	.4byte	0x4b4
	.byte	0x8
	.4byte	.LASF55
	.byte	0xb
	.byte	0x63
	.byte	0x12
	.4byte	0x4b4
	.byte	0
	.byte	0x8
	.4byte	.LASF75
	.byte	0xb
	.byte	0x64
	.byte	0x6
	.4byte	0x33
	.byte	0x4
	.byte	0x8
	.4byte	.LASF76
	.byte	0xb
	.byte	0x66
	.byte	0x9
	.4byte	0x4ba
	.byte	0x8
	.byte	0x8
	.4byte	.LASF69
	.byte	0xb
	.byte	0x67
	.byte	0x1e
	.4byte	0x41c
	.byte	0x88
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0x471
	.byte	0xc
	.4byte	0x4ca
	.4byte	0x4ca
	.byte	0xd
	.4byte	0x2c
	.byte	0x1f
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0x4d0
	.byte	0x16
	.byte	0x7
	.4byte	.LASF77
	.byte	0x8
	.byte	0xb
	.byte	0x7a
	.byte	0x8
	.4byte	0x4f9
	.byte	0x8
	.4byte	.LASF78
	.byte	0xb
	.byte	0x7b
	.byte	0x11
	.4byte	0x4f9
	.byte	0
	.byte	0x8
	.4byte	.LASF79
	.byte	0xb
	.byte	0x7c
	.byte	0x6
	.4byte	0x33
	.byte	0x4
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0x86
	.byte	0x7
	.4byte	.LASF80
	.byte	0x68
	.byte	0xb
	.byte	0xba
	.byte	0x8
	.4byte	0x642
	.byte	0x13
	.string	"_p"
	.byte	0xb
	.byte	0xbb
	.byte	0x12
	.4byte	0x4f9
	.byte	0
	.byte	0x13
	.string	"_r"
	.byte	0xb
	.byte	0xbc
	.byte	0x7
	.4byte	0x33
	.byte	0x4
	.byte	0x13
	.string	"_w"
	.byte	0xb
	.byte	0xbd
	.byte	0x7
	.4byte	0x33
	.byte	0x8
	.byte	0x8
	.4byte	.LASF81
	.byte	0xb
	.byte	0xbe
	.byte	0x9
	.4byte	0x59
	.byte	0xc
	.byte	0x8
	.4byte	.LASF82
	.byte	0xb
	.byte	0xbf
	.byte	0x9
	.4byte	0x59
	.byte	0xe
	.byte	0x13
	.string	"_bf"
	.byte	0xb
	.byte	0xc0
	.byte	0x11
	.4byte	0x4d1
	.byte	0x10
	.byte	0x8
	.4byte	.LASF83
	.byte	0xb
	.byte	0xc1
	.byte	0x7
	.4byte	0x33
	.byte	0x18
	.byte	0x8
	.4byte	.LASF84
	.byte	0xb
	.byte	0xc8
	.byte	0xa
	.4byte	0xba
	.byte	0x1c
	.byte	0x8
	.4byte	.LASF85
	.byte	0xb
	.byte	0xca
	.byte	0xe
	.4byte	0x7ba
	.byte	0x20
	.byte	0x8
	.4byte	.LASF86
	.byte	0xb
	.byte	0xcc
	.byte	0xe
	.4byte	0x7de
	.byte	0x24
	.byte	0x8
	.4byte	.LASF87
	.byte	0xb
	.byte	0xcf
	.byte	0xd
	.4byte	0x802
	.byte	0x28
	.byte	0x8
	.4byte	.LASF88
	.byte	0xb
	.byte	0xd0
	.byte	0x9
	.4byte	0x81c
	.byte	0x2c
	.byte	0x13
	.string	"_ub"
	.byte	0xb
	.byte	0xd3
	.byte	0x11
	.4byte	0x4d1
	.byte	0x30
	.byte	0x13
	.string	"_up"
	.byte	0xb
	.byte	0xd4
	.byte	0x12
	.4byte	0x4f9
	.byte	0x38
	.byte	0x13
	.string	"_ur"
	.byte	0xb
	.byte	0xd5
	.byte	0x7
	.4byte	0x33
	.byte	0x3c
	.byte	0x8
	.4byte	.LASF89
	.byte	0xb
	.byte	0xd8
	.byte	0x11
	.4byte	0x822
	.byte	0x40
	.byte	0x8
	.4byte	.LASF90
	.byte	0xb
	.byte	0xd9
	.byte	0x11
	.4byte	0x832
	.byte	0x43
	.byte	0x13
	.string	"_lb"
	.byte	0xb
	.byte	0xdc
	.byte	0x11
	.4byte	0x4d1
	.byte	0x44
	.byte	0x8
	.4byte	.LASF91
	.byte	0xb
	.byte	0xdf
	.byte	0x7
	.4byte	0x33
	.byte	0x4c
	.byte	0x8
	.4byte	.LASF92
	.byte	0xb
	.byte	0xe0
	.byte	0xa
	.4byte	0x27f
	.byte	0x50
	.byte	0x8
	.4byte	.LASF93
	.byte	0xb
	.byte	0xe3
	.byte	0x12
	.4byte	0x660
	.byte	0x54
	.byte	0x8
	.4byte	.LASF94
	.byte	0xb
	.byte	0xe7
	.byte	0xc
	.4byte	0x31d
	.byte	0x58
	.byte	0x8
	.4byte	.LASF95
	.byte	0xb
	.byte	0xe9
	.byte	0xe
	.4byte	0x2f9
	.byte	0x5c
	.byte	0x8
	.4byte	.LASF96
	.byte	0xb
	.byte	0xea
	.byte	0x7
	.4byte	0x33
	.byte	0x64
	.byte	0
	.byte	0x17
	.4byte	0x297
	.4byte	0x660
	.byte	0x18
	.4byte	0x660
	.byte	0x18
	.4byte	0xba
	.byte	0x18
	.4byte	0x7b4
	.byte	0x18
	.4byte	0x33
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0x66b
	.byte	0xf
	.4byte	0x660
	.byte	0x19
	.4byte	.LASF97
	.2byte	0x428
	.byte	0xb
	.2byte	0x265
	.byte	0x8
	.4byte	0x7b4
	.byte	0xb
	.4byte	.LASF98
	.byte	0xb
	.2byte	0x267
	.byte	0x7
	.4byte	0x33
	.byte	0
	.byte	0xb
	.4byte	.LASF99
	.byte	0xb
	.2byte	0x26c
	.byte	0xb
	.4byte	0x88e
	.byte	0x4
	.byte	0xb
	.4byte	.LASF100
	.byte	0xb
	.2byte	0x26c
	.byte	0x14
	.4byte	0x88e
	.byte	0x8
	.byte	0xb
	.4byte	.LASF101
	.byte	0xb
	.2byte	0x26c
	.byte	0x1e
	.4byte	0x88e
	.byte	0xc
	.byte	0xb
	.4byte	.LASF102
	.byte	0xb
	.2byte	0x26e
	.byte	0x7
	.4byte	0x33
	.byte	0x10
	.byte	0xb
	.4byte	.LASF103
	.byte	0xb
	.2byte	0x26f
	.byte	0x8
	.4byte	0xa8e
	.byte	0x14
	.byte	0xb
	.4byte	.LASF104
	.byte	0xb
	.2byte	0x272
	.byte	0x7
	.4byte	0x33
	.byte	0x30
	.byte	0xb
	.4byte	.LASF105
	.byte	0xb
	.2byte	0x273
	.byte	0x16
	.4byte	0xaa3
	.byte	0x34
	.byte	0xb
	.4byte	.LASF106
	.byte	0xb
	.2byte	0x275
	.byte	0x7
	.4byte	0x33
	.byte	0x38
	.byte	0xb
	.4byte	.LASF107
	.byte	0xb
	.2byte	0x277
	.byte	0xa
	.4byte	0xab4
	.byte	0x3c
	.byte	0xb
	.4byte	.LASF108
	.byte	0xb
	.2byte	0x27a
	.byte	0x13
	.4byte	0x383
	.byte	0x40
	.byte	0xb
	.4byte	.LASF109
	.byte	0xb
	.2byte	0x27b
	.byte	0x7
	.4byte	0x33
	.byte	0x44
	.byte	0xb
	.4byte	.LASF110
	.byte	0xb
	.2byte	0x27c
	.byte	0x13
	.4byte	0x383
	.byte	0x48
	.byte	0xb
	.4byte	.LASF111
	.byte	0xb
	.2byte	0x27d
	.byte	0x14
	.4byte	0xaba
	.byte	0x4c
	.byte	0xb
	.4byte	.LASF112
	.byte	0xb
	.2byte	0x280
	.byte	0x7
	.4byte	0x33
	.byte	0x50
	.byte	0xb
	.4byte	.LASF113
	.byte	0xb
	.2byte	0x281
	.byte	0x9
	.4byte	0x7b4
	.byte	0x54
	.byte	0xb
	.4byte	.LASF114
	.byte	0xb
	.2byte	0x2a4
	.byte	0x7
	.4byte	0xa69
	.byte	0x58
	.byte	0x1a
	.4byte	.LASF74
	.byte	0xb
	.2byte	0x2a8
	.byte	0x13
	.4byte	0x4b4
	.2byte	0x148
	.byte	0x1a
	.4byte	.LASF115
	.byte	0xb
	.2byte	0x2a9
	.byte	0x12
	.4byte	0x471
	.2byte	0x14c
	.byte	0x1a
	.4byte	.LASF116
	.byte	0xb
	.2byte	0x2ad
	.byte	0xc
	.4byte	0xacb
	.2byte	0x2dc
	.byte	0x1a
	.4byte	.LASF117
	.byte	0xb
	.2byte	0x2b2
	.byte	0x10
	.4byte	0x84f
	.2byte	0x2e0
	.byte	0x1a
	.4byte	.LASF118
	.byte	0xb
	.2byte	0x2b4
	.byte	0xa
	.4byte	0xad7
	.2byte	0x2ec
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0x266
	.byte	0x9
	.byte	0x4
	.4byte	0x642
	.byte	0x17
	.4byte	0x297
	.4byte	0x7de
	.byte	0x18
	.4byte	0x660
	.byte	0x18
	.4byte	0xba
	.byte	0x18
	.4byte	0x260
	.byte	0x18
	.4byte	0x33
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0x7c0
	.byte	0x17
	.4byte	0x28b
	.4byte	0x802
	.byte	0x18
	.4byte	0x660
	.byte	0x18
	.4byte	0xba
	.byte	0x18
	.4byte	0x28b
	.byte	0x18
	.4byte	0x33
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0x7e4
	.byte	0x17
	.4byte	0x33
	.4byte	0x81c
	.byte	0x18
	.4byte	0x660
	.byte	0x18
	.4byte	0xba
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0x808
	.byte	0xc
	.4byte	0x86
	.4byte	0x832
	.byte	0xd
	.4byte	0x2c
	.byte	0x2
	.byte	0
	.byte	0xc
	.4byte	0x86
	.4byte	0x842
	.byte	0xd
	.4byte	0x2c
	.byte	0
	.byte	0
	.byte	0xe
	.4byte	.LASF119
	.byte	0xb
	.2byte	0x124
	.byte	0x18
	.4byte	0x4ff
	.byte	0xa
	.4byte	.LASF120
	.byte	0xc
	.byte	0xb
	.2byte	0x128
	.byte	0x8
	.4byte	0x888
	.byte	0xb
	.4byte	.LASF55
	.byte	0xb
	.2byte	0x12a
	.byte	0x11
	.4byte	0x888
	.byte	0
	.byte	0xb
	.4byte	.LASF121
	.byte	0xb
	.2byte	0x12b
	.byte	0x7
	.4byte	0x33
	.byte	0x4
	.byte	0xb
	.4byte	.LASF122
	.byte	0xb
	.2byte	0x12c
	.byte	0xb
	.4byte	0x88e
	.byte	0x8
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0x84f
	.byte	0x9
	.byte	0x4
	.4byte	0x842
	.byte	0xa
	.4byte	.LASF123
	.byte	0xe
	.byte	0xb
	.2byte	0x144
	.byte	0x8
	.4byte	0x8cd
	.byte	0xb
	.4byte	.LASF124
	.byte	0xb
	.2byte	0x145
	.byte	0x12
	.4byte	0x8cd
	.byte	0
	.byte	0xb
	.4byte	.LASF125
	.byte	0xb
	.2byte	0x146
	.byte	0x12
	.4byte	0x8cd
	.byte	0x6
	.byte	0xb
	.4byte	.LASF126
	.byte	0xb
	.2byte	0x147
	.byte	0x12
	.4byte	0x99
	.byte	0xc
	.byte	0
	.byte	0xc
	.4byte	0x99
	.4byte	0x8dd
	.byte	0xd
	.4byte	0x2c
	.byte	0x2
	.byte	0
	.byte	0x1b
	.byte	0xd0
	.byte	0xb
	.2byte	0x285
	.byte	0x7
	.4byte	0x9f2
	.byte	0xb
	.4byte	.LASF127
	.byte	0xb
	.2byte	0x287
	.byte	0x18
	.4byte	0x2c
	.byte	0
	.byte	0xb
	.4byte	.LASF128
	.byte	0xb
	.2byte	0x288
	.byte	0x12
	.4byte	0x7b4
	.byte	0x4
	.byte	0xb
	.4byte	.LASF129
	.byte	0xb
	.2byte	0x289
	.byte	0x10
	.4byte	0x9f2
	.byte	0x8
	.byte	0xb
	.4byte	.LASF130
	.byte	0xb
	.2byte	0x28a
	.byte	0x17
	.4byte	0x399
	.byte	0x24
	.byte	0xb
	.4byte	.LASF131
	.byte	0xb
	.2byte	0x28b
	.byte	0xf
	.4byte	0x33
	.byte	0x48
	.byte	0xb
	.4byte	.LASF132
	.byte	0xb
	.2byte	0x28c
	.byte	0x2c
	.4byte	0xb3
	.byte	0x50
	.byte	0xb
	.4byte	.LASF133
	.byte	0xb
	.2byte	0x28d
	.byte	0x1a
	.4byte	0x894
	.byte	0x58
	.byte	0xb
	.4byte	.LASF134
	.byte	0xb
	.2byte	0x28e
	.byte	0x16
	.4byte	0x2f9
	.byte	0x68
	.byte	0xb
	.4byte	.LASF135
	.byte	0xb
	.2byte	0x28f
	.byte	0x16
	.4byte	0x2f9
	.byte	0x70
	.byte	0xb
	.4byte	.LASF136
	.byte	0xb
	.2byte	0x290
	.byte	0x16
	.4byte	0x2f9
	.byte	0x78
	.byte	0xb
	.4byte	.LASF137
	.byte	0xb
	.2byte	0x291
	.byte	0x10
	.4byte	0xa02
	.byte	0x80
	.byte	0xb
	.4byte	.LASF138
	.byte	0xb
	.2byte	0x292
	.byte	0x10
	.4byte	0xa12
	.byte	0x88
	.byte	0xb
	.4byte	.LASF139
	.byte	0xb
	.2byte	0x293
	.byte	0xf
	.4byte	0x33
	.byte	0xa0
	.byte	0xb
	.4byte	.LASF140
	.byte	0xb
	.2byte	0x294
	.byte	0x16
	.4byte	0x2f9
	.byte	0xa4
	.byte	0xb
	.4byte	.LASF141
	.byte	0xb
	.2byte	0x295
	.byte	0x16
	.4byte	0x2f9
	.byte	0xac
	.byte	0xb
	.4byte	.LASF142
	.byte	0xb
	.2byte	0x296
	.byte	0x16
	.4byte	0x2f9
	.byte	0xb4
	.byte	0xb
	.4byte	.LASF143
	.byte	0xb
	.2byte	0x297
	.byte	0x16
	.4byte	0x2f9
	.byte	0xbc
	.byte	0xb
	.4byte	.LASF144
	.byte	0xb
	.2byte	0x298
	.byte	0x16
	.4byte	0x2f9
	.byte	0xc4
	.byte	0xb
	.4byte	.LASF145
	.byte	0xb
	.2byte	0x299
	.byte	0x8
	.4byte	0x33
	.byte	0xcc
	.byte	0
	.byte	0xc
	.4byte	0x266
	.4byte	0xa02
	.byte	0xd
	.4byte	0x2c
	.byte	0x19
	.byte	0
	.byte	0xc
	.4byte	0x266
	.4byte	0xa12
	.byte	0xd
	.4byte	0x2c
	.byte	0x7
	.byte	0
	.byte	0xc
	.4byte	0x266
	.4byte	0xa22
	.byte	0xd
	.4byte	0x2c
	.byte	0x17
	.byte	0
	.byte	0x1b
	.byte	0xf0
	.byte	0xb
	.2byte	0x29e
	.byte	0x7
	.4byte	0xa49
	.byte	0xb
	.4byte	.LASF146
	.byte	0xb
	.2byte	0x2a1
	.byte	0x1b
	.4byte	0xa49
	.byte	0
	.byte	0xb
	.4byte	.LASF147
	.byte	0xb
	.2byte	0x2a2
	.byte	0x18
	.4byte	0xa59
	.byte	0x78
	.byte	0
	.byte	0xc
	.4byte	0x4f9
	.4byte	0xa59
	.byte	0xd
	.4byte	0x2c
	.byte	0x1d
	.byte	0
	.byte	0xc
	.4byte	0x2c
	.4byte	0xa69
	.byte	0xd
	.4byte	0x2c
	.byte	0x1d
	.byte	0
	.byte	0x1c
	.byte	0xf0
	.byte	0xb
	.2byte	0x283
	.byte	0x3
	.4byte	0xa8e
	.byte	0x1d
	.4byte	.LASF97
	.byte	0xb
	.2byte	0x29a
	.byte	0xb
	.4byte	0x8dd
	.byte	0x1d
	.4byte	.LASF148
	.byte	0xb
	.2byte	0x2a3
	.byte	0xb
	.4byte	0xa22
	.byte	0
	.byte	0xc
	.4byte	0x266
	.4byte	0xa9e
	.byte	0xd
	.4byte	0x2c
	.byte	0x18
	.byte	0
	.byte	0x1e
	.4byte	.LASF236
	.byte	0x9
	.byte	0x4
	.4byte	0xa9e
	.byte	0x1f
	.4byte	0xab4
	.byte	0x18
	.4byte	0x660
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0xaa9
	.byte	0x9
	.byte	0x4
	.4byte	0x383
	.byte	0x1f
	.4byte	0xacb
	.byte	0x18
	.4byte	0x33
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0xad1
	.byte	0x9
	.byte	0x4
	.4byte	0xac0
	.byte	0xc
	.4byte	0x842
	.4byte	0xae7
	.byte	0xd
	.4byte	0x2c
	.byte	0x2
	.byte	0
	.byte	0x20
	.4byte	.LASF150
	.byte	0xb
	.2byte	0x333
	.byte	0x17
	.4byte	0x660
	.byte	0x20
	.4byte	.LASF151
	.byte	0xb
	.2byte	0x334
	.byte	0x1d
	.4byte	0x666
	.byte	0x2
	.byte	0x4
	.byte	0x4
	.4byte	.LASF152
	.byte	0x21
	.4byte	.LASF237
	.byte	0x5
	.byte	0x1
	.4byte	0x46
	.byte	0xd
	.2byte	0x25f
	.byte	0x6
	.4byte	0xb28
	.byte	0x22
	.4byte	.LASF153
	.byte	0x7f
	.byte	0x23
	.4byte	.LASF154
	.byte	0
	.byte	0
	.byte	0x20
	.4byte	.LASF155
	.byte	0xd
	.2byte	0x268
	.byte	0x1e
	.4byte	0xb08
	.byte	0x6
	.4byte	.LASF156
	.byte	0x1
	.byte	0x13
	.byte	0xc
	.4byte	0x33
	.byte	0x6
	.4byte	.LASF157
	.byte	0x1
	.byte	0x14
	.byte	0x11
	.4byte	0x8d
	.byte	0x6
	.4byte	.LASF158
	.byte	0x1
	.byte	0x15
	.byte	0x10
	.4byte	0x4d
	.byte	0x24
	.string	"ppm"
	.byte	0x1
	.byte	0x16
	.byte	0xf
	.4byte	0x25
	.byte	0x6
	.4byte	.LASF159
	.byte	0xe
	.byte	0x8
	.byte	0x11
	.4byte	0xa0
	.byte	0x4
	.4byte	.LASF160
	.byte	0xf
	.byte	0x7c
	.byte	0xf
	.4byte	0x4d0
	.byte	0xc
	.4byte	0xb88
	.4byte	0xb88
	.byte	0x25
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0xb8e
	.byte	0x9
	.byte	0x4
	.4byte	0xb71
	.byte	0x6
	.4byte	.LASF161
	.byte	0xf
	.byte	0x84
	.byte	0x1c
	.4byte	0xb7d
	.byte	0x26
	.byte	0x7
	.byte	0x1
	.4byte	0x86
	.byte	0x19
	.byte	0x88
	.byte	0xe
	.4byte	0xbd9
	.byte	0x23
	.4byte	.LASF162
	.byte	0
	.byte	0x23
	.4byte	.LASF163
	.byte	0x1
	.byte	0x23
	.4byte	.LASF164
	.byte	0x2
	.byte	0x23
	.4byte	.LASF165
	.byte	0x3
	.byte	0x23
	.4byte	.LASF166
	.byte	0x4
	.byte	0x23
	.4byte	.LASF167
	.byte	0x5
	.byte	0x23
	.4byte	.LASF168
	.byte	0x6
	.byte	0
	.byte	0x4
	.4byte	.LASF169
	.byte	0x10
	.byte	0x24
	.byte	0x10
	.4byte	0xbe5
	.byte	0x9
	.byte	0x4
	.4byte	0xbeb
	.byte	0x1f
	.4byte	0xc00
	.byte	0x18
	.4byte	0x33
	.byte	0x18
	.4byte	0xc00
	.byte	0x18
	.4byte	0xa0
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0xa0
	.byte	0x7
	.4byte	.LASF170
	.byte	0x1c
	.byte	0x10
	.byte	0x25
	.byte	0x10
	.4byte	0xc6e
	.byte	0x8
	.4byte	.LASF171
	.byte	0x10
	.byte	0x26
	.byte	0x9
	.4byte	0x33
	.byte	0
	.byte	0x8
	.4byte	.LASF172
	.byte	0x10
	.byte	0x27
	.byte	0xf
	.4byte	0xc00
	.byte	0x4
	.byte	0x8
	.4byte	.LASF173
	.byte	0x10
	.byte	0x28
	.byte	0xb
	.4byte	0xba
	.byte	0x8
	.byte	0x8
	.4byte	.LASF174
	.byte	0x10
	.byte	0x29
	.byte	0x9
	.4byte	0x33
	.byte	0xc
	.byte	0x8
	.4byte	.LASF175
	.byte	0x10
	.byte	0x2a
	.byte	0xe
	.4byte	0xa0
	.byte	0x10
	.byte	0x8
	.4byte	.LASF176
	.byte	0x10
	.byte	0x2b
	.byte	0xe
	.4byte	0xa0
	.byte	0x14
	.byte	0x13
	.string	"cb"
	.byte	0x10
	.byte	0x2c
	.byte	0x11
	.4byte	0xbd9
	.byte	0x18
	.byte	0
	.byte	0x4
	.4byte	.LASF177
	.byte	0x10
	.byte	0x2d
	.byte	0x2
	.4byte	0xc06
	.byte	0x27
	.4byte	.LASF178
	.byte	0x2
	.byte	0x16
	.byte	0x8
	.4byte	0x25
	.byte	0x5
	.byte	0x3
	.4byte	sensor_volt
	.byte	0x28
	.4byte	0xb59
	.byte	0x2
	.byte	0x17
	.byte	0x8
	.byte	0x5
	.byte	0x3
	.4byte	ppm
	.byte	0x6
	.4byte	.LASF179
	.byte	0x11
	.byte	0x67
	.byte	0xe
	.4byte	0x7b4
	.byte	0x28
	.4byte	0xb41
	.byte	0x3
	.byte	0xf
	.byte	0xa
	.byte	0x5
	.byte	0x3
	.4byte	humidity
	.byte	0x28
	.4byte	0xb4d
	.byte	0x3
	.byte	0x10
	.byte	0x9
	.byte	0x5
	.byte	0x3
	.4byte	temp
	.byte	0x28
	.4byte	0xb35
	.byte	0x4
	.byte	0xf
	.byte	0x5
	.byte	0x5
	.byte	0x3
	.4byte	buzz
	.byte	0x6
	.4byte	.LASF180
	.byte	0x4
	.byte	0x11
	.byte	0x10
	.4byte	0x7a
	.byte	0x6
	.4byte	.LASF181
	.byte	0x4
	.byte	0x12
	.byte	0x10
	.4byte	0x7a
	.byte	0x6
	.4byte	.LASF182
	.byte	0x4
	.byte	0x13
	.byte	0x10
	.4byte	0x7a
	.byte	0x6
	.4byte	.LASF183
	.byte	0x4
	.byte	0x14
	.byte	0x10
	.4byte	0x7a
	.byte	0xc
	.4byte	0x126
	.4byte	0xd10
	.byte	0xd
	.4byte	0x2c
	.byte	0x3
	.byte	0
	.byte	0x29
	.4byte	.LASF184
	.byte	0x4
	.byte	0x16
	.byte	0x15
	.4byte	0xd00
	.byte	0x5
	.byte	0x3
	.4byte	xHeapRegions
	.byte	0x2a
	.4byte	.LASF191
	.byte	0x4
	.byte	0x22
	.byte	0x6
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.byte	0x1
	.byte	0x9c
	.4byte	0xec8
	.byte	0x29
	.4byte	.LASF185
	.byte	0x4
	.byte	0x31
	.byte	0x18
	.4byte	0xec8
	.byte	0x5
	.byte	0x3
	.4byte	mq4_stack.5257
	.byte	0x29
	.4byte	.LASF186
	.byte	0x4
	.byte	0x32
	.byte	0x19
	.4byte	0x253
	.byte	0x5
	.byte	0x3
	.4byte	mq4_task.5258
	.byte	0x29
	.4byte	.LASF187
	.byte	0x4
	.byte	0x34
	.byte	0x18
	.4byte	0xed9
	.byte	0x5
	.byte	0x3
	.4byte	buzzer_stack.5259
	.byte	0x29
	.4byte	.LASF188
	.byte	0x4
	.byte	0x35
	.byte	0x19
	.4byte	0x253
	.byte	0x5
	.byte	0x3
	.4byte	buzzer_task.5260
	.byte	0x29
	.4byte	.LASF189
	.byte	0x4
	.byte	0x38
	.byte	0x18
	.4byte	0xee9
	.byte	0x5
	.byte	0x3
	.4byte	dht_stack.5261
	.byte	0x29
	.4byte	.LASF190
	.byte	0x4
	.byte	0x39
	.byte	0x19
	.4byte	0x253
	.byte	0x5
	.byte	0x3
	.4byte	dht_task.5262
	.byte	0x2b
	.4byte	.LVL85
	.4byte	0x1695
	.4byte	0xdd6
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x30
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x40
	.byte	0x2c
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x37
	.byte	0x2c
	.byte	0x1
	.byte	0x5d
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.byte	0x2c
	.byte	0x1
	.byte	0x5e
	.byte	0x2
	.byte	0x9
	.byte	0xff
	.byte	0x2c
	.byte	0x1
	.byte	0x5f
	.byte	0x5
	.byte	0xc
	.4byte	0x1e8480
	.byte	0
	.byte	0x2b
	.4byte	.LVL86
	.4byte	0x16a1
	.4byte	0xded
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR1
	.byte	0
	.byte	0x2d
	.4byte	.LVL87
	.4byte	0x16ad
	.byte	0x2b
	.4byte	.LVL88
	.4byte	0x16b9
	.4byte	0xe39
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	task_mq4
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	.LC19
	.byte	0x2c
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xa
	.2byte	0x200
	.byte	0x2c
	.byte	0x1
	.byte	0x5d
	.byte	0x1
	.byte	0x30
	.byte	0x2c
	.byte	0x1
	.byte	0x5e
	.byte	0x1
	.byte	0x3f
	.byte	0x2c
	.byte	0x1
	.byte	0x5f
	.byte	0x5
	.byte	0x3
	.4byte	mq4_stack.5257
	.byte	0x2c
	.byte	0x1
	.byte	0x60
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR2
	.byte	0
	.byte	0x2b
	.4byte	.LVL89
	.4byte	0x16b9
	.4byte	0xe7b
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	task_buzzer
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	.LC20
	.byte	0x2c
	.byte	0x1
	.byte	0x5c
	.byte	0x2
	.byte	0x8
	.byte	0x80
	.byte	0x2c
	.byte	0x1
	.byte	0x5d
	.byte	0x1
	.byte	0x30
	.byte	0x2c
	.byte	0x1
	.byte	0x5e
	.byte	0x1
	.byte	0x3a
	.byte	0x2c
	.byte	0x1
	.byte	0x5f
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR4
	.byte	0x2c
	.byte	0x1
	.byte	0x60
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR3
	.byte	0
	.byte	0x2b
	.4byte	.LVL90
	.4byte	0x16b9
	.4byte	0xebe
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	task_dht
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x5
	.byte	0x3
	.4byte	.LC21
	.byte	0x2c
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xa
	.2byte	0x300
	.byte	0x2c
	.byte	0x1
	.byte	0x5d
	.byte	0x1
	.byte	0x30
	.byte	0x2c
	.byte	0x1
	.byte	0x5e
	.byte	0x1
	.byte	0x4e
	.byte	0x2c
	.byte	0x1
	.byte	0x5f
	.byte	0x5
	.byte	0x3
	.4byte	dht_stack.5261
	.byte	0x2c
	.byte	0x1
	.byte	0x60
	.byte	0x5
	.byte	0x3
	.4byte	.LANCHOR5
	.byte	0
	.byte	0x2e
	.4byte	.LVL91
	.4byte	0x16c6
	.byte	0
	.byte	0xc
	.4byte	0xbc
	.4byte	0xed9
	.byte	0x2f
	.4byte	0x2c
	.2byte	0x1ff
	.byte	0
	.byte	0xc
	.4byte	0xbc
	.4byte	0xee9
	.byte	0xd
	.4byte	0x2c
	.byte	0x7f
	.byte	0
	.byte	0xc
	.4byte	0xbc
	.4byte	0xefa
	.byte	0x2f
	.4byte	0x2c
	.2byte	0x2ff
	.byte	0
	.byte	0x2a
	.4byte	.LASF192
	.byte	0x3
	.byte	0x1f
	.byte	0x6
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.byte	0x1
	.byte	0x9c
	.4byte	0x10e4
	.byte	0x30
	.4byte	.LASF205
	.byte	0x3
	.byte	0x1f
	.byte	0x15
	.4byte	0xba
	.4byte	.LLST21
	.byte	0x31
	.4byte	.Ldebug_ranges0+0x60
	.4byte	0x10d0
	.byte	0x29
	.4byte	.LASF193
	.byte	0x3
	.byte	0x25
	.byte	0xd
	.4byte	0x10e4
	.byte	0x2
	.byte	0x91
	.byte	0x48
	.byte	0x29
	.4byte	.LASF194
	.byte	0x3
	.byte	0x42
	.byte	0xd
	.4byte	0x7a
	.byte	0x2
	.byte	0x91
	.byte	0x4c
	.byte	0x32
	.4byte	.LBB29
	.4byte	.LBE29-.LBB29
	.4byte	0xfab
	.byte	0x33
	.string	"i"
	.byte	0x3
	.byte	0x31
	.byte	0xe
	.4byte	0x33
	.4byte	.LLST22
	.byte	0x2b
	.4byte	.LVL71
	.4byte	0x16d3
	.4byte	0xf75
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x35
	.byte	0
	.byte	0x2b
	.4byte	.LVL72
	.4byte	0x16df
	.4byte	0xf88
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x4e
	.byte	0
	.byte	0x2b
	.4byte	.LVL73
	.4byte	0x16d3
	.4byte	0xf9b
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x35
	.byte	0
	.byte	0x34
	.4byte	.LVL74
	.4byte	0x16d3
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x35
	.byte	0
	.byte	0
	.byte	0x2d
	.4byte	.LVL65
	.4byte	0x115d
	.byte	0x2d
	.4byte	.LVL66
	.4byte	0x10f4
	.byte	0x2b
	.4byte	.LVL67
	.4byte	0x16eb
	.4byte	0xfe0
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x35
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x4
	.byte	0x91
	.byte	0x48
	.byte	0x94
	.byte	0x1
	.byte	0x2c
	.byte	0x1
	.byte	0x5c
	.byte	0x4
	.byte	0x91
	.byte	0x48
	.byte	0x94
	.byte	0x1
	.byte	0
	.byte	0x2b
	.4byte	.LVL68
	.4byte	0x16d3
	.4byte	0xff3
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x35
	.byte	0
	.byte	0x2b
	.4byte	.LVL69
	.4byte	0x16d3
	.4byte	0x1006
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x35
	.byte	0
	.byte	0x2b
	.4byte	.LVL70
	.4byte	0x16d3
	.4byte	0x1019
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x35
	.byte	0
	.byte	0x2b
	.4byte	.LVL78
	.4byte	0x16f7
	.4byte	0x1034
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x9
	.byte	0x78
	.byte	0
	.byte	0x88
	.byte	0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0
	.byte	0x2d
	.4byte	.LVL79
	.4byte	0x1703
	.byte	0x2b
	.4byte	.LVL80
	.4byte	0x1703
	.4byte	0x1054
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC17
	.byte	0
	.byte	0x2b
	.4byte	.LVL81
	.4byte	0x1703
	.4byte	0x106b
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC18
	.byte	0
	.byte	0x2b
	.4byte	.LVL82
	.4byte	0x170f
	.4byte	0x1080
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x2710
	.byte	0
	.byte	0x34
	.4byte	.LVL84
	.4byte	0x1703
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC16
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x18
	.byte	0x91
	.byte	0x4a
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x38
	.byte	0x24
	.byte	0x91
	.byte	0x4b
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x21
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0x78
	.byte	0
	.byte	0x1b
	.byte	0x2c
	.byte	0x1
	.byte	0x5c
	.byte	0x1c
	.byte	0x91
	.byte	0x4a
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x38
	.byte	0x24
	.byte	0x91
	.byte	0x4b
	.byte	0x94
	.byte	0x1
	.byte	0x8
	.byte	0xff
	.byte	0x1a
	.byte	0x21
	.byte	0x40
	.byte	0x24
	.byte	0x40
	.byte	0x26
	.byte	0x78
	.byte	0
	.byte	0x14
	.byte	0x14
	.byte	0x1b
	.byte	0x1e
	.byte	0x1c
	.byte	0
	.byte	0
	.byte	0x34
	.4byte	.LVL64
	.4byte	0x1703
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC14
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	0x7a
	.4byte	0x10f4
	.byte	0xd
	.4byte	0x2c
	.byte	0x4
	.byte	0
	.byte	0x35
	.4byte	.LASF195
	.byte	0x3
	.byte	0x16
	.byte	0x6
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.byte	0x1
	.byte	0x9c
	.4byte	0x115d
	.byte	0x2b
	.4byte	.LVL58
	.4byte	0x171c
	.4byte	0x1122
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x35
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x2b
	.4byte	.LVL59
	.4byte	0x170f
	.4byte	0x1135
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x2b
	.4byte	.LVL60
	.4byte	0x171c
	.4byte	0x114d
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x35
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x36
	.4byte	.LVL61
	.4byte	0x16df
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x4e
	.byte	0
	.byte	0
	.byte	0x35
	.4byte	.LASF196
	.byte	0x3
	.byte	0x12
	.byte	0x6
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.byte	0x1
	.byte	0x9c
	.4byte	0x118d
	.byte	0x36
	.4byte	.LVL57
	.4byte	0x1728
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x35
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x2c
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.byte	0x37
	.4byte	.LASF199
	.byte	0x2
	.byte	0x82
	.byte	0xa
	.4byte	0xa0
	.byte	0x1
	.4byte	0x11e3
	.byte	0x29
	.4byte	.LASF197
	.byte	0x2
	.byte	0x84
	.byte	0x13
	.4byte	0x11e3
	.byte	0x5
	.byte	0x3
	.4byte	adc_data.4352
	.byte	0x38
	.string	"ctx"
	.byte	0x2
	.byte	0x86
	.byte	0xe
	.4byte	0x11f4
	.byte	0x38
	.string	"sum"
	.byte	0x2
	.byte	0x92
	.byte	0xc
	.4byte	0xa0
	.byte	0x39
	.byte	0x38
	.string	"i"
	.byte	0x2
	.byte	0x93
	.byte	0xc
	.4byte	0x33
	.byte	0x39
	.byte	0x3a
	.4byte	.LASF198
	.byte	0x2
	.byte	0x95
	.byte	0xe
	.4byte	0xa0
	.byte	0
	.byte	0
	.byte	0
	.byte	0xc
	.4byte	0xa0
	.4byte	0x11f4
	.byte	0x2f
	.4byte	0x2c
	.2byte	0x3ff
	.byte	0
	.byte	0x9
	.byte	0x4
	.4byte	0xc6e
	.byte	0x3b
	.4byte	.LASF200
	.byte	0x2
	.byte	0x64
	.byte	0x6
	.byte	0x1
	.4byte	0x122c
	.byte	0x3c
	.string	"pin"
	.byte	0x2
	.byte	0x64
	.byte	0x17
	.4byte	0x7a
	.byte	0x3a
	.4byte	.LASF201
	.byte	0x2
	.byte	0x7b
	.byte	0x7
	.4byte	0x33
	.byte	0x38
	.string	"ctx"
	.byte	0x2
	.byte	0x7c
	.byte	0xe
	.4byte	0x11f4
	.byte	0
	.byte	0x3d
	.4byte	.LASF238
	.byte	0x2
	.byte	0x46
	.byte	0xc
	.4byte	0x33
	.byte	0x1
	.4byte	0x1262
	.byte	0x3e
	.4byte	.LASF202
	.byte	0x2
	.byte	0x46
	.byte	0x22
	.4byte	0xa0
	.byte	0x3e
	.4byte	.LASF203
	.byte	0x2
	.byte	0x46
	.byte	0x32
	.4byte	0xa0
	.byte	0x38
	.string	"reg"
	.byte	0x2
	.byte	0x48
	.byte	0xc
	.4byte	0xa0
	.byte	0
	.byte	0x3f
	.4byte	.LASF204
	.byte	0x2
	.byte	0x1c
	.byte	0x6
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.byte	0x1
	.byte	0x9c
	.4byte	0x13ec
	.byte	0x30
	.4byte	.LASF205
	.byte	0x2
	.byte	0x1c
	.byte	0x15
	.4byte	0xba
	.4byte	.LLST11
	.byte	0x31
	.4byte	.Ldebug_ranges0+0x30
	.4byte	0x1369
	.byte	0x40
	.4byte	.LASF206
	.byte	0x2
	.byte	0x28
	.byte	0xe
	.4byte	0xa0
	.4byte	.LLST13
	.byte	0x40
	.4byte	.LASF207
	.byte	0x2
	.byte	0x2a
	.byte	0xc
	.4byte	0x25
	.4byte	.LLST14
	.byte	0x29
	.4byte	.LASF178
	.byte	0x2
	.byte	0x2c
	.byte	0xc
	.4byte	0x25
	.byte	0x6
	.byte	0x6a
	.byte	0x93
	.byte	0x4
	.byte	0x6b
	.byte	0x93
	.byte	0x4
	.byte	0x31
	.4byte	.Ldebug_ranges0+0x48
	.4byte	0x134e
	.byte	0x33
	.string	"m"
	.byte	0x2
	.byte	0x35
	.byte	0xe
	.4byte	0x25
	.4byte	.LLST15
	.byte	0x33
	.string	"b"
	.byte	0x2
	.byte	0x36
	.byte	0xe
	.4byte	0x25
	.4byte	.LLST16
	.byte	0x33
	.string	"R0"
	.byte	0x2
	.byte	0x37
	.byte	0xe
	.4byte	0x25
	.4byte	.LLST17
	.byte	0x40
	.4byte	.LASF208
	.byte	0x2
	.byte	0x38
	.byte	0xe
	.4byte	0x25
	.4byte	.LLST18
	.byte	0x40
	.4byte	.LASF209
	.byte	0x2
	.byte	0x39
	.byte	0xe
	.4byte	0x25
	.4byte	.LLST19
	.byte	0x40
	.4byte	.LASF210
	.byte	0x2
	.byte	0x3a
	.byte	0xe
	.4byte	0x25
	.4byte	.LLST20
	.byte	0x2d
	.4byte	.LVL50
	.4byte	0x1734
	.byte	0x2d
	.4byte	.LVL53
	.4byte	0x1740
	.byte	0x34
	.4byte	.LVL55
	.4byte	0x1703
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC13
	.byte	0
	.byte	0
	.byte	0x2d
	.4byte	.LVL40
	.4byte	0x118d
	.byte	0x34
	.4byte	.LVL56
	.4byte	0x170f
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x1388
	.byte	0
	.byte	0
	.byte	0x41
	.4byte	0x11fa
	.4byte	.LBB22
	.4byte	.LBE22-.LBB22
	.byte	0x2
	.byte	0x20
	.byte	0x3
	.4byte	0x13ac
	.byte	0x42
	.4byte	0x1207
	.4byte	.LLST12
	.byte	0x43
	.4byte	.LBB23
	.4byte	.LBE23-.LBB23
	.byte	0x44
	.4byte	0x1213
	.byte	0x44
	.4byte	0x121f
	.byte	0x34
	.4byte	.LVL37
	.4byte	0x14a6
	.byte	0x45
	.4byte	0x1207
	.byte	0x1
	.byte	0x3e
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2b
	.4byte	.LVL36
	.4byte	0x1703
	.4byte	0x13c3
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC2
	.byte	0
	.byte	0x2b
	.4byte	.LVL38
	.4byte	0x1703
	.4byte	0x13da
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC3
	.byte	0
	.byte	0x34
	.4byte	.LVL39
	.4byte	0x170f
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x3
	.byte	0xa
	.2byte	0x7d0
	.byte	0
	.byte	0
	.byte	0x46
	.4byte	.LASF211
	.byte	0x1
	.byte	0x17
	.byte	0x6
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x1
	.byte	0x9c
	.4byte	0x14a6
	.byte	0x2b
	.4byte	.LVL0
	.4byte	0x1728
	.4byte	0x141f
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0x2c
	.byte	0x1
	.byte	0x5c
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x2b
	.4byte	.LVL1
	.4byte	0x171c
	.4byte	0x1437
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0x2b
	.4byte	.LVL3
	.4byte	0x171c
	.4byte	0x144f
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x2b
	.4byte	.LVL4
	.4byte	0x170f
	.4byte	0x1463
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0xc8
	.byte	0
	.byte	0x2b
	.4byte	.LVL5
	.4byte	0x171c
	.4byte	0x147c
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0x2b
	.4byte	.LVL6
	.4byte	0x170f
	.4byte	0x1490
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.byte	0x34
	.4byte	.LVL7
	.4byte	0x171c
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0
	.byte	0x47
	.4byte	0x11fa
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.byte	0x1
	.byte	0x9c
	.4byte	0x15a0
	.byte	0x48
	.4byte	0x1213
	.4byte	.LLST0
	.byte	0x48
	.4byte	0x121f
	.4byte	.LLST1
	.byte	0x49
	.4byte	0x1207
	.byte	0x6
	.byte	0xfa
	.4byte	0x1207
	.byte	0x9f
	.byte	0x41
	.4byte	0x122c
	.4byte	.LBB10
	.4byte	.LBE10-.LBB10
	.byte	0x2
	.byte	0x75
	.byte	0x3
	.4byte	0x1511
	.byte	0x42
	.4byte	0x123d
	.4byte	.LLST2
	.byte	0x42
	.4byte	0x1249
	.4byte	.LLST2
	.byte	0x43
	.4byte	.LBB11
	.4byte	.LBE11-.LBB11
	.byte	0x48
	.4byte	0x1255
	.4byte	.LLST4
	.byte	0
	.byte	0
	.byte	0x2b
	.4byte	.LVL9
	.4byte	0x174c
	.4byte	0x152b
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xa
	.2byte	0x1000
	.byte	0
	.byte	0x2b
	.4byte	.LVL10
	.4byte	0x1758
	.4byte	0x1543
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x3e
	.byte	0
	.byte	0x2b
	.4byte	.LVL15
	.4byte	0x1764
	.4byte	0x155d
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0x2c
	.byte	0x1
	.byte	0x5b
	.byte	0x3
	.byte	0xa
	.2byte	0x400
	.byte	0
	.byte	0x2b
	.4byte	.LVL16
	.4byte	0x1770
	.4byte	0x1570
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3e
	.byte	0
	.byte	0x2b
	.4byte	.LVL17
	.4byte	0x177c
	.4byte	0x1583
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x3e
	.byte	0
	.byte	0x2b
	.4byte	.LVL19
	.4byte	0x1788
	.4byte	0x1596
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x2e
	.4byte	.LVL21
	.4byte	0x1794
	.byte	0
	.byte	0x47
	.4byte	0x11fa
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.byte	0x1
	.byte	0x9c
	.4byte	0x15ef
	.byte	0x42
	.4byte	0x1207
	.4byte	.LLST5
	.byte	0x44
	.4byte	0x1213
	.byte	0x44
	.4byte	0x121f
	.byte	0x4a
	.4byte	.LVL24
	.4byte	0x1703
	.4byte	0x15dd
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	.LC1
	.byte	0
	.byte	0x36
	.4byte	.LVL25
	.4byte	0x14a6
	.byte	0x45
	.4byte	0x1207
	.byte	0x1
	.byte	0x3e
	.byte	0
	.byte	0
	.byte	0x47
	.4byte	0x118d
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.byte	0x1
	.byte	0x9c
	.4byte	0x1695
	.byte	0x48
	.4byte	0x11b0
	.4byte	.LLST6
	.byte	0x48
	.4byte	0x11bc
	.4byte	.LLST7
	.byte	0x41
	.4byte	0x118d
	.4byte	.LBB16
	.4byte	.LBE16-.LBB16
	.byte	0x2
	.byte	0x82
	.byte	0xa
	.4byte	0x1667
	.byte	0x43
	.4byte	.LBB17
	.4byte	.LBE17-.LBB17
	.byte	0x44
	.4byte	0x11b0
	.byte	0x48
	.4byte	0x11bc
	.4byte	.LLST8
	.byte	0x4b
	.4byte	0x11c8
	.4byte	.Ldebug_ranges0+0
	.byte	0x48
	.4byte	0x11c9
	.4byte	.LLST9
	.byte	0x4b
	.4byte	0x11d3
	.4byte	.Ldebug_ranges0+0x18
	.byte	0x48
	.4byte	0x11d4
	.4byte	.LLST10
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x2b
	.4byte	.LVL26
	.4byte	0x1788
	.4byte	0x167a
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x1
	.byte	0x31
	.byte	0
	.byte	0x34
	.4byte	.LVL28
	.4byte	0x17a0
	.byte	0x2c
	.byte	0x1
	.byte	0x5a
	.byte	0x5
	.byte	0x3
	.4byte	adc_data.4352
	.byte	0x2c
	.byte	0x1
	.byte	0x5c
	.byte	0x3
	.byte	0xa
	.2byte	0x1000
	.byte	0
	.byte	0
	.byte	0x4c
	.4byte	.LASF212
	.4byte	.LASF212
	.byte	0x12
	.byte	0x26
	.byte	0x5
	.byte	0x4c
	.4byte	.LASF213
	.4byte	.LASF213
	.byte	0x8
	.byte	0x8b
	.byte	0x6
	.byte	0x4c
	.4byte	.LASF214
	.4byte	.LASF214
	.byte	0x13
	.byte	0x46
	.byte	0x6
	.byte	0x4d
	.4byte	.LASF215
	.4byte	.LASF215
	.byte	0x14
	.2byte	0x1be
	.byte	0x12
	.byte	0x4d
	.4byte	.LASF216
	.4byte	.LASF216
	.byte	0x14
	.2byte	0x497
	.byte	0x6
	.byte	0x4c
	.4byte	.LASF217
	.4byte	.LASF217
	.byte	0x15
	.byte	0x30
	.byte	0x5
	.byte	0x4c
	.4byte	.LASF218
	.4byte	.LASF218
	.byte	0x16
	.byte	0x22
	.byte	0x6
	.byte	0x4c
	.4byte	.LASF219
	.4byte	.LASF219
	.byte	0x15
	.byte	0x2d
	.byte	0x5
	.byte	0x4e
	.string	"abs"
	.string	"abs"
	.byte	0x11
	.byte	0x46
	.byte	0x5
	.byte	0x4c
	.4byte	.LASF220
	.4byte	.LASF220
	.byte	0x17
	.byte	0xc8
	.byte	0x5
	.byte	0x4d
	.4byte	.LASF221
	.4byte	.LASF221
	.byte	0x14
	.2byte	0x2f6
	.byte	0x6
	.byte	0x4c
	.4byte	.LASF222
	.4byte	.LASF222
	.byte	0x15
	.byte	0x2e
	.byte	0x5
	.byte	0x4c
	.4byte	.LASF223
	.4byte	.LASF223
	.byte	0x15
	.byte	0x2c
	.byte	0x5
	.byte	0x4c
	.4byte	.LASF224
	.4byte	.LASF224
	.byte	0xd
	.byte	0x6e
	.byte	0xf
	.byte	0x4e
	.string	"pow"
	.string	"pow"
	.byte	0xd
	.byte	0x6f
	.byte	0xf
	.byte	0x4c
	.4byte	.LASF225
	.4byte	.LASF225
	.byte	0x10
	.byte	0x3a
	.byte	0x5
	.byte	0x4c
	.4byte	.LASF226
	.4byte	.LASF226
	.byte	0x10
	.byte	0x35
	.byte	0x5
	.byte	0x4c
	.4byte	.LASF227
	.4byte	.LASF227
	.byte	0x10
	.byte	0x36
	.byte	0x5
	.byte	0x4c
	.4byte	.LASF228
	.4byte	.LASF228
	.byte	0x10
	.byte	0x38
	.byte	0x5
	.byte	0x4c
	.4byte	.LASF229
	.4byte	.LASF229
	.byte	0x10
	.byte	0x39
	.byte	0x5
	.byte	0x4c
	.4byte	.LASF230
	.4byte	.LASF230
	.byte	0x13
	.byte	0x4e
	.byte	0x7
	.byte	0x4c
	.4byte	.LASF231
	.4byte	.LASF231
	.byte	0x10
	.byte	0x37
	.byte	0x5
	.byte	0x4c
	.4byte	.LASF232
	.4byte	.LASF232
	.byte	0x18
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
	.byte	0x8
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
	.byte	0x9
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0xb
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
	.byte	0xf
	.byte	0x26
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x12
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
	.byte	0x13
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
	.byte	0x14
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
	.byte	0x15
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
	.byte	0x16
	.byte	0x15
	.byte	0
	.byte	0x27
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0x17
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
	.byte	0x18
	.byte	0x5
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0x2a
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
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2b
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
	.byte	0x2c
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2d
	.byte	0x89,0x82,0x1
	.byte	0
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x2e
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
	.byte	0x2f
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0x5
	.byte	0
	.byte	0
	.byte	0x30
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
	.byte	0x31
	.byte	0xb
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x32
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x33
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
	.byte	0x34
	.byte	0x89,0x82,0x1
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x35
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
	.byte	0x97,0x42
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x36
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
	.byte	0x37
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
	.byte	0x38
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
	.byte	0x39
	.byte	0xb
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x3a
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
	.byte	0x3b
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
	.byte	0x3c
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
	.byte	0x3d
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
	.byte	0x3e
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
	.byte	0x3f
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
	.byte	0x40
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
	.byte	0x41
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
	.byte	0x42
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x43
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x44
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x45
	.byte	0x8a,0x82,0x1
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x91,0x42
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x46
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
	.byte	0x47
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
	.byte	0x48
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x49
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x4a
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
	.byte	0x4b
	.byte	0xb
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x55
	.byte	0x17
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
	.byte	0x4e
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
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST21:
	.4byte	.LVL62
	.4byte	.LVL63
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL63
	.4byte	.LFE34
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST22:
	.4byte	.LVL75
	.4byte	.LVL77
	.2byte	0x1
	.byte	0x68
	.4byte	.LVL83
	.4byte	.LFE34
	.2byte	0x1
	.byte	0x68
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL34
	.4byte	.LVL35
	.2byte	0x1
	.byte	0x5a
	.4byte	.LVL35
	.4byte	.LFE28
	.2byte	0x4
	.byte	0xf3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST13:
	.4byte	.LVL40
	.4byte	.LVL41-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST14:
	.4byte	.LVL40
	.4byte	.LVL41-1
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
	.4byte	.LVL46
	.4byte	.LVL55
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.4byte	0xac083127
	.4byte	0xbfd45a1c
	.4byte	0
	.4byte	0
.LLST16:
	.4byte	.LVL46
	.4byte	.LVL55
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.4byte	0x9ba5e354
	.4byte	0x3ff220c4
	.4byte	0
	.4byte	0
.LLST17:
	.4byte	.LVL46
	.4byte	.LVL55
	.2byte	0xa
	.byte	0x9e
	.byte	0x8
	.4byte	0x9999999a
	.4byte	0x40279999
	.4byte	0
	.4byte	0
.LLST18:
	.4byte	.LVL46
	.4byte	.LVL55
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
	.4byte	.LVL46
	.4byte	.LVL55
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
	.4byte	.LVL50
	.4byte	.LVL51-1
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
	.4byte	.LVL36
	.4byte	.LVL37
	.2byte	0x2
	.byte	0x3e
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST0:
	.4byte	.LVL18
	.4byte	.LVL20
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL19
	.4byte	.LVL21-1
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL10
	.4byte	.LVL14
	.2byte	0x2
	.byte	0x31
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL11
	.4byte	.LVL12
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
	.4byte	.LVL12
	.4byte	.LVL13
	.2byte	0x9
	.byte	0x7f
	.byte	0
	.byte	0xc
	.4byte	0x2410000
	.byte	0x21
	.byte	0x9f
	.4byte	.LVL13
	.4byte	.LVL14
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
	.4byte	0x5c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
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
	.4byte	.LBB24
	.4byte	.LBE24
	.4byte	.LBB27
	.4byte	.LBE27
	.4byte	0
	.4byte	0
	.4byte	.LBB25
	.4byte	.LBE25
	.4byte	.LBB26
	.4byte	.LBE26
	.4byte	0
	.4byte	0
	.4byte	.LBB28
	.4byte	.LBE28
	.4byte	.LBB30
	.4byte	.LBE30
	.4byte	.LBB31
	.4byte	.LBE31
	.4byte	.LBB32
	.4byte	.LBE32
	.4byte	0
	.4byte	0
	.4byte	.LFB5
	.4byte	.LFE5
	.4byte	.LFB36
	.4byte	.LFE36
	.4byte	.LFB30
	.4byte	.LFE30
	.4byte	.LFB31
	.4byte	.LFE31
	.4byte	.LFB28
	.4byte	.LFE28
	.4byte	.LFB32
	.4byte	.LFE32
	.4byte	.LFB33
	.4byte	.LFE33
	.4byte	.LFB34
	.4byte	.LFE34
	.4byte	.LFB35
	.4byte	.LFE35
	.4byte	0
	.4byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF177:
	.string	"adc_ctx_t"
.LASF175:
	.string	"chan_init_table"
.LASF45:
	.string	"_ssize_t"
.LASF3:
	.string	"size_t"
.LASF236:
	.string	"__locale_t"
.LASF49:
	.string	"__value"
.LASF118:
	.string	"__sf"
.LASF200:
	.string	"init_adc"
.LASF204:
	.string	"task_mq4"
.LASF85:
	.string	"_read"
.LASF86:
	.string	"_write"
.LASF215:
	.string	"xTaskCreateStatic"
.LASF37:
	.string	"ulDummy18"
.LASF6:
	.string	"int32_t"
.LASF181:
	.string	"_heap_size"
.LASF129:
	.string	"_asctime_buf"
.LASF112:
	.string	"_cvtlen"
.LASF174:
	.string	"lli_flag"
.LASF197:
	.string	"adc_data"
.LASF148:
	.string	"_unused"
.LASF59:
	.string	"__tm"
.LASF144:
	.string	"_wcsrtombs_state"
.LASF90:
	.string	"_nbuf"
.LASF60:
	.string	"__tm_sec"
.LASF17:
	.string	"BaseType_t"
.LASF137:
	.string	"_l64a_buf"
.LASF163:
	.string	"ADC_PGA_GAIN_1"
.LASF164:
	.string	"ADC_PGA_GAIN_2"
.LASF165:
	.string	"ADC_PGA_GAIN_4"
.LASF33:
	.string	"ucDummy7"
.LASF166:
	.string	"ADC_PGA_GAIN_8"
.LASF94:
	.string	"_lock"
.LASF227:
	.string	"bl_adc_dma_init"
.LASF125:
	.string	"_mult"
.LASF22:
	.string	"HeapRegion_t"
.LASF209:
	.string	"ratio"
.LASF194:
	.string	"checksum"
.LASF46:
	.string	"__wch"
.LASF82:
	.string	"_file"
.LASF69:
	.string	"_on_exit_args"
.LASF140:
	.string	"_mbrlen_state"
.LASF7:
	.string	"long int"
.LASF150:
	.string	"_impure_ptr"
.LASF109:
	.string	"_result_k"
.LASF79:
	.string	"_size"
.LASF173:
	.string	"adc_lli"
.LASF26:
	.string	"pvDummy3"
.LASF130:
	.string	"_localtime_buf"
.LASF149:
	.string	"TrapNetCounter"
.LASF216:
	.string	"vTaskStartScheduler"
.LASF64:
	.string	"__tm_mon"
.LASF206:
	.string	"adcValue"
.LASF20:
	.string	"pucStartAddress"
.LASF127:
	.string	"_unused_rand"
.LASF2:
	.string	"signed char"
.LASF9:
	.string	"uint8_t"
.LASF156:
	.string	"buzz"
.LASF172:
	.string	"channel_data"
.LASF10:
	.string	"unsigned char"
.LASF104:
	.string	"_unspecified_locale_info"
.LASF233:
	.string	"GNU C99 8.3.0 -march=rv32imfc -mabi=ilp32f -gdwarf -Os -std=gnu99 -ffunction-sections -fdata-sections -fstrict-volatile-bitfields -fshort-enums -ffreestanding -fno-strict-aliasing"
.LASF97:
	.string	"_reent"
.LASF151:
	.string	"_global_impure_ptr"
.LASF228:
	.string	"bl_adc_gpio_init"
.LASF29:
	.string	"pxDummy1"
.LASF32:
	.string	"pxDummy6"
.LASF41:
	.string	"char"
.LASF76:
	.string	"_fns"
.LASF185:
	.string	"mq4_stack"
.LASF167:
	.string	"ADC_PGA_GAIN_16"
.LASF88:
	.string	"_close"
.LASF224:
	.string	"log10"
.LASF99:
	.string	"_stdin"
.LASF211:
	.string	"task_buzzer"
.LASF162:
	.string	"ADC_PGA_GAIN_NONE"
.LASF35:
	.string	"uxDummy10"
.LASF36:
	.string	"uxDummy12"
.LASF222:
	.string	"bl_gpio_output_set"
.LASF178:
	.string	"sensor_volt"
.LASF157:
	.string	"humidity"
.LASF196:
	.string	"initiateGPIO"
.LASF168:
	.string	"ADC_PGA_GAIN_32"
.LASF39:
	.string	"uxDummy20"
.LASF231:
	.string	"bl_adc_start"
.LASF234:
	.string	"/home/parag/bl_iot_sdk/customer_app/SWEMS/SWEMS/main.c"
.LASF220:
	.string	"printf"
.LASF187:
	.string	"buzzer_stack"
.LASF84:
	.string	"_cookie"
.LASF58:
	.string	"_wds"
.LASF116:
	.string	"_sig_func"
.LASF92:
	.string	"_offset"
.LASF113:
	.string	"_cvtbuf"
.LASF202:
	.string	"gain1"
.LASF203:
	.string	"gain2"
.LASF155:
	.string	"__fdlib_version"
.LASF110:
	.string	"_p5s"
.LASF14:
	.string	"long unsigned int"
.LASF80:
	.string	"__sFILE"
.LASF106:
	.string	"__sdidinit"
.LASF96:
	.string	"_flags2"
.LASF219:
	.string	"bl_gpio_enable_input"
.LASF159:
	.string	"SystemCoreClock"
.LASF201:
	.string	"channel"
.LASF52:
	.string	"_LOCK_RECURSIVE_T"
.LASF98:
	.string	"_errno"
.LASF31:
	.string	"uxDummy5"
.LASF34:
	.string	"uxDummy9"
.LASF229:
	.string	"bl_adc_get_channel_by_gpio"
.LASF138:
	.string	"_signal_buf"
.LASF176:
	.string	"data_size"
.LASF210:
	.string	"ppm_log"
.LASF54:
	.string	"_Bigint"
.LASF230:
	.string	"bl_dma_find_ctx_by_channel"
.LASF56:
	.string	"_maxwds"
.LASF107:
	.string	"__cleanup"
.LASF115:
	.string	"_atexit0"
.LASF103:
	.string	"_emergency"
.LASF191:
	.string	"bfl_main"
.LASF8:
	.string	"long long int"
.LASF238:
	.string	"set_adc_gain"
.LASF121:
	.string	"_niobs"
.LASF199:
	.string	"read_adc"
.LASF117:
	.string	"__sglue"
.LASF147:
	.string	"_nmalloc"
.LASF0:
	.string	"double"
.LASF131:
	.string	"_gamma_signgam"
.LASF111:
	.string	"_freelist"
.LASF122:
	.string	"_iobs"
.LASF120:
	.string	"_glue"
.LASF57:
	.string	"_sign"
.LASF152:
	.string	"float"
.LASF1:
	.string	"unsigned int"
.LASF186:
	.string	"mq4_task"
.LASF145:
	.string	"_h_errno"
.LASF160:
	.string	"intCallback_Type"
.LASF161:
	.string	"intCbfArra"
.LASF143:
	.string	"_wcrtomb_state"
.LASF63:
	.string	"__tm_mday"
.LASF114:
	.string	"_new"
.LASF89:
	.string	"_ubuf"
.LASF101:
	.string	"_stderr"
.LASF136:
	.string	"_wctomb_state"
.LASF95:
	.string	"_mbstate"
.LASF40:
	.string	"StaticTask_t"
.LASF81:
	.string	"_flags"
.LASF74:
	.string	"_atexit"
.LASF195:
	.string	"sendStartSignal"
.LASF170:
	.string	"adc_ctx"
.LASF48:
	.string	"__count"
.LASF190:
	.string	"dht_task"
.LASF23:
	.string	"HeapRegion"
.LASF66:
	.string	"__tm_wday"
.LASF67:
	.string	"__tm_yday"
.LASF124:
	.string	"_seed"
.LASF87:
	.string	"_seek"
.LASF225:
	.string	"bl_adc_freq_init"
.LASF44:
	.string	"_fpos_t"
.LASF47:
	.string	"__wchb"
.LASF221:
	.string	"vTaskDelay"
.LASF24:
	.string	"xSTATIC_LIST_ITEM"
.LASF135:
	.string	"_mbtowc_state"
.LASF15:
	.string	"long long unsigned int"
.LASF208:
	.string	"RS_gas"
.LASF235:
	.string	"/home/parag/bl_iot_sdk/customer_app/SWEMS/build_out/SWEMS"
.LASF11:
	.string	"uint16_t"
.LASF71:
	.string	"_dso_handle"
.LASF123:
	.string	"_rand48"
.LASF237:
	.string	"__fdlibm_version"
.LASF100:
	.string	"_stdout"
.LASF28:
	.string	"xSTATIC_TCB"
.LASF18:
	.string	"UBaseType_t"
.LASF189:
	.string	"dht_stack"
.LASF91:
	.string	"_blksize"
.LASF78:
	.string	"_base"
.LASF19:
	.string	"TickType_t"
.LASF128:
	.string	"_strtok_last"
.LASF51:
	.string	"__ULong"
.LASF141:
	.string	"_mbrtowc_state"
.LASF53:
	.string	"_flock_t"
.LASF119:
	.string	"__FILE"
.LASF50:
	.string	"_mbstate_t"
.LASF133:
	.string	"_r48"
.LASF42:
	.string	"wint_t"
.LASF55:
	.string	"_next"
.LASF93:
	.string	"_data"
.LASF184:
	.string	"xHeapRegions"
.LASF218:
	.string	"bl_timer_delay_us"
.LASF226:
	.string	"bl_adc_init"
.LASF213:
	.string	"vPortDefineHeapRegions"
.LASF207:
	.string	"sensorValue"
.LASF154:
	.string	"__fdlibm_posix"
.LASF134:
	.string	"_mblen_state"
.LASF5:
	.string	"short int"
.LASF171:
	.string	"mode"
.LASF180:
	.string	"_heap_start"
.LASF4:
	.string	"int16_t"
.LASF179:
	.string	"suboptarg"
.LASF72:
	.string	"_fntypes"
.LASF188:
	.string	"buzzer_task"
.LASF65:
	.string	"__tm_year"
.LASF83:
	.string	"_lbfsize"
.LASF102:
	.string	"_inc"
.LASF75:
	.string	"_ind"
.LASF153:
	.string	"__fdlibm_ieee"
.LASF77:
	.string	"__sbuf"
.LASF232:
	.string	"memcpy"
.LASF73:
	.string	"_is_cxa"
.LASF146:
	.string	"_nextf"
.LASF205:
	.string	"pvParameters"
.LASF105:
	.string	"_locale"
.LASF25:
	.string	"xDummy2"
.LASF30:
	.string	"xDummy3"
.LASF13:
	.string	"uint32_t"
.LASF214:
	.string	"bl_dma_init"
.LASF108:
	.string	"_result"
.LASF198:
	.string	"scaled"
.LASF16:
	.string	"StackType_t"
.LASF43:
	.string	"_off_t"
.LASF126:
	.string	"_add"
.LASF12:
	.string	"short unsigned int"
.LASF62:
	.string	"__tm_hour"
.LASF132:
	.string	"_rand_next"
.LASF217:
	.string	"bl_gpio_input_get_value"
.LASF192:
	.string	"task_dht"
.LASF142:
	.string	"_mbsrtowcs_state"
.LASF27:
	.string	"StaticListItem_t"
.LASF223:
	.string	"bl_gpio_enable_output"
.LASF21:
	.string	"xSizeInBytes"
.LASF158:
	.string	"temp"
.LASF70:
	.string	"_fnargs"
.LASF68:
	.string	"__tm_isdst"
.LASF193:
	.string	"data"
.LASF61:
	.string	"__tm_min"
.LASF38:
	.string	"ucDummy19"
.LASF183:
	.string	"_heap_wifi_size"
.LASF139:
	.string	"_getdate_err"
.LASF182:
	.string	"_heap_wifi_start"
.LASF212:
	.string	"bl_uart_init"
.LASF169:
	.string	"bl_adc_cb_t"
	.ident	"GCC: (SiFive GCC 8.3.0-2019.08.0) 8.3.0"
