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
	li	a5,4
	sw	a5,0(a5)
	li	a5,12
	sw	a5,8(zero)
	li	a4,16
	sw	a4,0(a5)
	li	a0,0
	ret
	.size	main, .-main
	.ident	"GCC: (xPack GNU RISC-V Embedded GCC x86_64) 13.2.0"
