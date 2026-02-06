# the branchless loop to base this on. this is not done

.text
.globl main
main:
	li 	$v0, 	5				# Load syscall code for read_int
	syscall						# Execute syscall
	sub 	$t3,	$v0, 1			# Move the input integer from $v0 to $t0
	move	$t6,	$v0
	lw	$t1,	mask26			# j imm mask
	lw	$t2,	j_opcode		# used later for masking
	or	$t3,	$t3,	$t2		# add the j opcode to the counter
	nop
	nop
loop_label:						# at address that just so happens to end in c
								# print loop index
	la	$t0,	loop_label 		# t0 to mask into instruction
	srl	$t0,	$t0,	2		# move address to align
	and	$t0,	$t0,	$t1		# make $t0 have the right imm in the right place

	# print newline
	li	$v0,	11
	li	$a0,	10
	syscall

body:
	j one
after_body:

	subu	$t3,	$t3,	1	# decrement counter
	and	$t2,	$t2,	$t3		# change to opcode based on if the counter removed its top bit
	or	$t4,	$t2,	$t0		# put the opcode and loop label together

	la	$t5,	jump_or_syscall
	sw	$t4,	0($t5)			# store the instruction
	li	$v0,	10				# load for exit syscall
jump_or_syscall:
	nop							# either jump to loop_label or syscall and exit
	syscall

one:
	li	$v0,	1
	xor	$a0,	$t3,	$t2
	subu $a0, $t6, $a0
	syscall

	la	$a0,	two
	srl	$a0,	$a0,	2
	lw	$t8,	j_opcode
	or	$a0,	$t8,	$a0
	la	$t8,	body
	sw	$a0,	0($t8)

	j	after_body

two:
	li	$v0,	1
	xor	$a0,	$t3,	$t2
	subu $a0, $t6, $a0
	syscall

	la	$a0,	three
	srl	$a0,	$a0,	2
	lw	$t8,	j_opcode
	or	$a0,	$t8,	$a0
	la	$t8,	body
	sw	$a0,	0($t8)

	j	after_body

three:
    la   $a0, fizz
    li   $v0, 4
    syscall

	la	$a0,	four
	srl	$a0,	$a0,	2
	lw	$t8,	j_opcode
	or	$a0,	$t8,	$a0
	la	$t8,	body
	sw	$a0,	0($t8)

	j	after_body

four:
	li	$v0,	1
	xor	$a0,	$t3,	$t2
	subu $a0, $t6, $a0
	syscall

	la	$a0,	five
	srl	$a0,	$a0,	2
	lw	$t8,	j_opcode
	or	$a0,	$t8,	$a0
	la	$t8,	body
	sw	$a0,	0($t8)

	j	after_body

five:
    la   $a0, buzz
    li   $v0, 4
    syscall

	la	$a0,	six
	srl	$a0,	$a0,	2
	lw	$t8,	j_opcode
	or	$a0,	$t8,	$a0
	la	$t8,	body
	sw	$a0,	0($t8)

	j	after_body

six:
    la   $a0, fizz
    li   $v0, 4
    syscall

	la	$a0,	seven
	srl	$a0,	$a0,	2
	lw	$t8,	j_opcode
	or	$a0,	$t8,	$a0
	la	$t8,	body
	sw	$a0,	0($t8)

	j	after_body

seven:
	li	$v0,	1
	xor	$a0,	$t3,	$t2
	subu $a0, $t6, $a0
	syscall

	la	$a0,	eight
	srl	$a0,	$a0,	2
	lw	$t8,	j_opcode
	or	$a0,	$t8,	$a0
	la	$t8,	body
	sw	$a0,	0($t8)

	j	after_body

eight:
	li	$v0,	1
	xor	$a0,	$t3,	$t2
	subu $a0, $t6, $a0
	syscall

	la	$a0,	nine
	srl	$a0,	$a0,	2
	lw	$t8,	j_opcode
	or	$a0,	$t8,	$a0
	la	$t8,	body
	sw	$a0,	0($t8)

	j	after_body

nine:
    la   $a0, fizz
    li   $v0, 4
    syscall

	la	$a0,	ten
	srl	$a0,	$a0,	2
	lw	$t8,	j_opcode
	or	$a0,	$t8,	$a0
	la	$t8,	body
	sw	$a0,	0($t8)

	j	after_body

ten:
    la   $a0, buzz
    li   $v0, 4
    syscall

	la	$a0,	eleven
	srl	$a0,	$a0,	2
	lw	$t8,	j_opcode
	or	$a0,	$t8,	$a0
	la	$t8,	body
	sw	$a0,	0($t8)

	j	after_body

eleven:
	li	$v0,	1
	xor	$a0,	$t3,	$t2
	subu $a0, $t6, $a0
	syscall

	la	$a0,	twelve
	srl	$a0,	$a0,	2
	lw	$t8,	j_opcode
	or	$a0,	$t8,	$a0
	la	$t8,	body
	sw	$a0,	0($t8)

	j	after_body

twelve:
    la   $a0, fizz
    li   $v0, 4
    syscall

	la	$a0,	thirteen
	srl	$a0,	$a0,	2
	lw	$t8,	j_opcode
	or	$a0,	$t8,	$a0
	la	$t8,	body
	sw	$a0,	0($t8)

	j	after_body

thirteen:
	li	$v0,	1
	xor	$a0,	$t3,	$t2
	subu $a0, $t6, $a0
	syscall

	la	$a0,	fourteen
	srl	$a0,	$a0,	2
	lw	$t8,	j_opcode
	or	$a0,	$t8,	$a0
	la	$t8,	body
	sw	$a0,	0($t8)

	j	after_body

fourteen:
	li	$v0,	1
	xor	$a0,	$t3,	$t2
	subu $a0, $t6, $a0
	syscall

	la	$a0,	fifteen
	srl	$a0,	$a0,	2
	lw	$t8,	j_opcode
	or	$a0,	$t8,	$a0
	la	$t8,	body
	sw	$a0,	0($t8)

	j	after_body

fifteen:
    la   $a0, fizzbuzz
    li   $v0, 4
    syscall

	la	$a0,	one
	srl	$a0,	$a0,	2
	lw	$t8,	j_opcode
	or	$a0,	$t8,	$a0
	la	$t8,	body
	sw	$a0,	0($t8)

	j	after_body

.data
	j_opcode:	.word	0x08000000
	mask26:		.word	0x03FFFFFF
    fizz:       .asciiz "fizz"
    buzz:       .asciiz "buzz"
    fizzbuzz:	.asciiz	"fizzbuzz"
