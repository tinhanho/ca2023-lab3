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
	slli	a4,a1,31
	srli	a5,a0,1
	or	a5,a4,a5
	srli	a4,a1,1
	or	a1,a4,a1
	or	a0,a5,a0
	slli	a4,a1,30
	srli	a5,a0,2
	or	a5,a4,a5
	srli	a4,a1,2
	or	a4,a4,a1
	or	a0,a5,a0
	slli	a3,a4,28
	srli	a5,a0,4
	or	a5,a3,a5
	srli	a3,a4,4
	or	a3,a3,a4
	or	a4,a5,a0
	slli	a2,a3,24
	srli	a5,a4,8
	or	a5,a2,a5
	srli	a2,a3,8
	or	a2,a2,a3
	or	a5,a5,a4
	slli	a3,a2,16
	srli	a4,a5,16
	or	a4,a3,a4
	srli	a3,a2,16
	or	a3,a3,a2
	or	a4,a4,a5
	or	a4,a3,a4
	li	a2,1431654400
	srli	a5,a4,1
	addi	a2,a2,1365
	and	a5,a5,a2
	sub	a5,a4,a5
	sgtu	a4,a5,a4
	sub	a3,a3,a4
	slli	a3,a3,30
	srli	a4,a5,2
	li	a2,858992640
	addi	a2,a2,819
	or	a4,a3,a4
	and	a4,a4,a2
	and	a5,a5,a2
	add	a5,a4,a5
	sltu	a4,a5,a4
	slli	a4,a4,28
	srli	a3,a5,4
	or	a3,a4,a3
	li	a4,252645376
	add	a3,a3,a5
	addi	a4,a4,-241
	and	a3,a3,a4
	srli	a4,a3,8
	add	a4,a4,a3
	srli	a5,a4,16
	add	a5,a5,a4
	andi	a5,a5,127
	li	a0,32
	sub	a0,a0,a5
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
