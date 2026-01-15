.text
.globl main
main:
	li 	$v0, 	5
	syscall
        move 	$t3,	$v0
	la	$t0,	loop_label
	srl	$t0,	$t0,	2
	lw	$t1,	mask26
	and	$t0,	$t0,	$t1
	lw	$t2,	j_opcode
	or	$t3,	$t3,	$t2
loop_label:
        li	$a0,	next
        lw	$a0,	0($a0)
        jr	$a0
continue_loop:
	subu	$t3,	$t3,	1
        and	$t2,	$t2,	$t3
	or	$t4,	$t2,	$t0

	la	$t5,	jump_or_syscall
	sw	$t4,	0($t5)
	li	$v0,	10
jump_or_syscall:
	nop
	syscall

j_opcode:	.word	0x08000000
mask26:		.word	0x03FFFFFF
fizz:		.asciz "fizz\n"
buzz:		.asciz "buzz\n"
fizzbuzz:	.asciz "fizzbuzz\n"
next:	.word	one

do_next:
	li	$a0,	next
        jr	$a0

n_r:
	xli	$v0,	1
	xor	$a0,	$t3,	$t2
	syscall
	li	$v0,	11
	li	$a0,	10
	syscall
        jr $ra

fizz_r:
	li	$v0,	4
	la	$a0, fizz
        syscall
        jr $ra

buzz_r:
	li	$v0,	4
	la	$a0, buzz
        syscall
        jr $ra

fizzbuzz_r:
	li	$v0,	4
	la	$a0, fizzbuzz
        syscall
        jr $ra


one:
        jal	n_r
        li	$a0,	next
        sw	0($a0), two
        j	continue_loop
two:
        jal	n_r
        li	$a0,	next
        sw	0($a0), three
        j	continue_loop

three:
        jal	fizz_r
        li	$a0,	next
        sw	0($a0), four
        j	continue_loop

four:
        jal	n_r
        li	$a0,	next
        sw	0($a0), five
        j	continue_loop

five:
        jal	buzz_r
        li	$a0,	next
        sw	0($a0), six
        j	continue_loop

six:
        jal	fizz_r
        li	$a0,	next
        sw	0($a0), seven
        j	continue_loop

seven:
        jal	n_r
        li	$a0,	next
        sw	0($a0), eight
        j	continue_loop

eight:
        jal	n_r
        li	$a0,	next
        sw	0($a0), nine
        j	continue_loop

nine:
        jal	fizz_r
        li	$a0,	next
        sw	0($a0), ten
        j	continue_loop

ten:
        jal	buzz_r
        li	$a0,	next
        sw	0($a0), eleven
        j	continue_loop

eleven:
        jal	n_r
        li	$a0,	next
        sw	0($a0), twelve
        j	continue_loop

twelve:
        jal	fizz_r
        li	$a0,	next
        sw	0($a0), thirteen
        j	continue_loop

thirteen:
        jal	n_r
        li	$a0,	next
        sw	0($a0), fourteen
        j	continue_loop

fourteen:
        jal	n_r
        li	$a0,	next
        sw	0($a0), fifteen
        j	continue_loop

fifteen:
        jal	fizzbuzz_r
        li	$a0,	next
        sw	0($a0), one
        j	continue_loop

