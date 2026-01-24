# the branchless loop to base this on. this is not done

.text
.globl main
main:
	li 	$v0, 	5				# Load syscall code for read_int
	syscall						# Execute syscall
	move 	$t3,	$v0			# Move the input integer from $v0 to $t0
	la	$t0,	loop_label 		# t0 to mask into instruction
	srl	$t0,	$t0,	2		# move address to align
	lw	$t1,	mask26			# j imm mask
	and	$t0,	$t0,	$t1		# make $t0 have the right imm in the right place
	lw	$t2,	j_opcode		# used later for masking
	or	$t3,	$t3,	$t2		# add the j opcode to the counter
loop_label:						# at address that just so happens to end in c
								# print loop index
	li	$v0,	11
	li	$a0,	10
	syscall
	li	$v0,	1
	xor	$a0,	$t3,	$t2
	syscall

	subu	$t3,	$t3,	1	# decrement counter
	and	$t2,	$t2,	$t3		# change to opcode based on if the counter removed its top bit
	or	$t4,	$t2,	$t0		# put the opcode and loop label together

	la	$t5,	jump_or_syscall
	sw	$t4,	0($t5)			# store the instruction
	li	$v0,	10				# load for exit syscall
jump_or_syscall:
	nop							# either jump to loop_label or syscall and exit
	syscall
.data
	j_opcode:	.word	0x08000000
	mask26:		.word	0x03FFFFFF
