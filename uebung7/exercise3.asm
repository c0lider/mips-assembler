.text
	addi $8, $0, 0
	addi $8, $8, 1
	ori $8, $0, 0xffff
	addi $9, $0, -16384
	add $8, $8, $9
	
	# TODO check register numbers and
	
	add $2, $10, $9		# $2 = $10 + $9
	sub $3, $10, $9		# $3 = $10 - $9
	nor $19, $19, $0	# $19 = NOT($19)
	add $4, $19, $10	# $4 = $19 + $10
	addi $4, $4, 1		# $4 = $4 + 1
	sll $5, $13, 5		# $5 = $13 << 5 (shift)
	sra $6, $13, 5		# $6 = $13 >> 5 (shift arithmetic)
	sra $7, $12, 5		# $7 = $12 >> 5 (shift arithmetic)
	srl $16, $12, 5		# $16 = $12 >> 5 (shift logical)
	srlv $17, $13, $9	# $17 = $13 >> $9 (shift logical)
	div.d $18, $24, $25	# $18 = $24 / $25 (division)
	div $19, $24, $25	# $19 = $24 % $25 (modulo)
	# mfhi, mflo
	addi $20, $15, 1	# $20 = $15 + 1 (unsigned)
	add $21, $24, 1		# $21 = $24 + 1 (signed)
	clo $22, $11		# $22 = count_leading_zeroes($11)
	clo $23, $14		# $23 = count_leading_zeroes($14)
		