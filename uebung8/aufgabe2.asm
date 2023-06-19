.data
	infotext: 	.asciiz "Programm zur Berechnung des ggT zweier ganzer Zahlen.\n"
	in1: 		.asciiz "Bitte erste Zahl eingeben:\t"
	in2: 		.asciiz "BItte zweite Zahl eingeben:\t"
	out:		.asciiz "Das Ergebnis lautet:\t"

.text
get_input:
	# Print info text
	la $a0, infotext	# load string into argument
	li $v0, 4		# print string 
	syscall
	
	# read 1st integer
	la $a0, in1		# load string into argument
	li $v0, 4		# print string 
	syscall
	li $v0, 5		# read integer
	syscall
	add $t0, $v0, $zero	# copy read integer to $t0
	
	# read 2nd integer
	la $a0, in2		# load string into argument
	li $v0, 4		# print string 
	syscall
	li $v0, 5		# read integer
	syscall
	add $t1, $v0, $zero	# copy read integer to $t1
	
	# copy input to $a0 and $a1
	add $a0, $t0, $zero
	add $a1, $t1, $zero
	
	# call sub routines
	jal ggt
	jal print_result
	
	li $v0, 10		# exit program
	syscall
	
.text
ggt:
	add $v0, $zero, $a1	# copy second_number to $v0
	
	beq $a0, $zero, exit	# if f(irst_number==0) exit
start:
	beq $a1, $zero, done	# if (second_number==0) almost done
	
	sub $at, $a0, $a1 	# needed for greater than
	bgtz $at, next		# check if difference is greater than zero
	sub $a1, $a1, $a0	# second_number = first_number - second_number
	j start			# loop again
next:
	add $a0, $zero, $at	# copy $at (difference) to first_number
	j start			# loop again
done:
	add $v0, $zero, $a0	# store result in $v0
exit:
	add $t0, $v0, $zero
	jr $ra			# jump back to caller

.text
print_result:
	la $a0, out		# print output info text
	li $v0, 4
	syscall
	
	add $a0, $t0, $zero	# copy result to argument
	li $v0, 1		# load print int syscall code
	syscall
	
	jr $ra			# jump back to caller
	
		
