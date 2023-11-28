	.file	"find_msb.c"
	.option nopic
	.attribute arch, "rv32i2p1_zicsr2p0_zifencei2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	count_leading_zeros
	.type	count_leading_zeros, @function
count_leading_zeros:
	srli t0, a0, 1 # t0 = x>>1
	or a0, a0, t0 # x |= (x >> 1); 
	srli t0, a0, 2 # x>>2
	or a0, a0, t0 
	srli t0, a0, 4 # x>>4
	or a0, a0, t0
	srli t0, a0, 8 # x>>8
	or a0, a0, t0
	srli t0, a0, 16 # x>>16
	or a0, a0, t0
	li t5, 0x55555555
	srli t0, a0, 1 # x>>1
	and t0, t0, t5 # (x >> 1) & 0x55555555
	sub a0, a0, t0
	li t5, 0x33333333
	srli t0, a0, 2 # x>>2
	and t0, t0, t5 # (x >> 2) & 0x33333333
	and t1, a0, t5 # x & 0x33333333
	add a0, t0, t1 
	li t5, 0x0f0f0f0f
	srli t0, a0, 4 # x>>4
	add t0, a0, t0
	and a0, t0, t5 
	srli t0, a0, 8 # x>>8
	add a0, a0, t0
	srli t0, a0, 16 # x>>16
	add a0, a0, t0
	li t5, 0x0000007f
	and a0, a0, t5 
	sub a0, x0, a0
	addi a0, a0, 32
	ret
	.size	count_leading_zeros, .-count_leading_zeros
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	li	a4,4096
	li	a5,65536
	addi	sp,sp,-32
	addi	a4,a4,257
	addi	a5,a5,17
	li	a3,17
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s2,16(sp)
	sw	ra,28(sp)
	sw	a3,4(sp)
	sw	a4,8(sp)
	sw	a5,12(sp)
	li	s0,4
	li	s1,31
	li	s2,16
.L5:
	addi	a5,sp,4
	add	a5,a5,s0
	lw	a0,-4(a5)
	li	a1,0
	call	count_leading_zeros
	sub	a5,s1,a0
	bgtu	a0,s1,.L4
	sw	a5,0(s0)
.L4:
	addi	s0,s0,4
	bne	s0,s2,.L5
	lw	ra,28(sp)
	lw	s0,24(sp)
	lw	s1,20(sp)
	lw	s2,16(sp)
	li	a0,0
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 13.2.0"
