.data
	myByte: 	.byte 0xa0
	myHalfWord: 	.half 0xb1b0
	myWord:		.word 0xc3c2c1c0
	myString:	.asciiz "The End"

.text
	# load without labels
	lui $11, 0x1001	# start of data segment
	lb $12, 0($11)	# load byte from (address) with offset 0 (first word in data segment)
	lh $13, 2($11)
	lw $14, 4($11)
	
	# load with pseudo-instructions (easy way)
	lb $8, myByte
	lh $9, myHalfWord
	lw $10, myWord
	
	# invert register
	not $8, $8
	not $9, $9
	not $10, $10
	
	# store in data segment
	li $1, 0x10010010	# initialize offset in $1
	sb $8, 0($1)
	sh $9, 2($1)
	sw $10, 4($1)
	