# mips.asm //by Guilherme Kollet - 01/07/2022
.data
	A: .word 810 100 560 380 600 87
	B: .word 800 555 817 124 890 456
	C: .word 345 200 700 180 600 490

	n: .word 6
	k: .word 0
	
	MIN: .word 1000
	
	sumA: .word 0
	sumB: .word 0
	sumC: .word 0
	
	D: .word 0
	
	div: .word 0
	resto: .word 0

.text
	.globl main   
	
main:
	li $t0, 0 					# (int pos = 0) traversing position in the vector 
	li $t1, 0					# (int i = 0) integer to increment 
	lw $t2, n					# (int n = 6) number of items in the vectors 
	lw $t3, MIN					# (int MIN = 1000) load maximum number reference
		
	lw $s0, A					# load vector A
	lw $s1, B					# load vector B
	lw $s2, C					# load vector C
	lw $s3, D					# load vector D
	
	lw $t4, sumA				# load reference of the sum variable to vector A
	lw $t5, sumB				# load reference of the sum variable to vector B
	lw $t6, sumC				# load reference of the sum variable to vector C
	
	lw $t9, k					# (int k = 0) load the reference for to increment

somatorio:
	beq $t1, $t2, main2			# if $t1 is equal to $t2 executes main2
	lw $t7, A($t0)				# load the value about A[pos] on $t7
	add $t4, $t4, $t7				# increments A[pos] on $t4
	
	lw $t7, B($t0)				# load the value about B[pos] on $t7
	add $t5, $t5, $t7				# increments B[pos] on $t5
	
	lw $t7, C($t0)				# load the value about C[pos] on $t7
	add $t6, $t6, $t7				# increments A[pos] on $t6
	
	addi $t0, $t0, 4				# (int pos = 0) traversing position in the vector
	addi $t1, $t1, 1				# (int i = 0) integer to increment 
	j somatorio
	
main2:

########################################
###       Saves the summations       ###
########################################

	sw $t4, sumA				# store on Data Memory sumA
	sw $t5, sumB				# store on Data Memory sumB
	sw $t6, sumC				# store on Data Memory sumC
	
############################################################
###       Calculates the average of the summations       ###
############################################################
	
	la $s1, sumA 				# load address sumA
	lw $s1, 0($s1)      			# load dividend
	la $s0, n
	lw $s0, 0($s0)      			# load divider
	jal divider         			# result on $v1
	
	sw $v1, sumA				# store average sumA
	
	la $s1, sumB 				# load address sumB
	lw $s1, 0($s1)      			# load dividend
	la $s0, n
	lw $s0, 0($s0)      			# load divider
	jal divider         			# result on $v1
	
	sw $v1, sumB				# store average sumB
	
	la $s1, sumC 				# load address sumC
	lw $s1, 0($s1)      			# load dividend
	la $s0, n
	lw $s0, 0($s0)      			# load divider
	jal divider         			# result on $v1
	
	sw $v1, sumC				# store average sumC
	
#######################################################################
###        3rd Specification: Saves the minimum average value       ###
#######################################################################
	
	lw $t3, MIN					#load value MIN on $t3

achaMin:

	lw $t7, sumA				# load reference of the sum variable to vector A
	blt $t7, $t3, incrementa		# if $t7 is less than $t3 executes incrementa
	
	lw $t7, sumB				# load reference of the sum variable to vector B
	blt $t7, $t3, incrementa		# if $t7 is less than $t3 executes incrementa

	lw $t7, sumC				# load reference of the sum variable to vector C
	blt $t7, $t3, incrementa		# if $t7 is less than $t3 executes incrementa
	
	sw $t3, MIN					#store the reference min in data memory
	
	li $t0, 0 					# (int pos = 0) traversing position in the vector 
	li $t1, 0					# (int i = 0) integer to increment 
	lw $t2, n					# (int n = 6) number of items in the vectors 
	lw $t3, MIN					# (int MIN = 1000) load the reference max value
		
	lw $s0, A					# load vector A
	lw $s1, B					# load vector B
	lw $s2, C					# load vector C
	lw $s3, D					# load vector D
	
	li $t8, 0					# (int posK = 0) load the reference for to position k
	lw $t9, k					# (int k = 0) load the reference for to increment
	
	j analisaA					# loop jump

incrementa:
	add $t3, $zero, $t7			# increments summator
	j achaMin 					# loop jump
		
#############################################################################
###        Traverses vectors and stores the values smaller than MIN       ###
#############################################################################	

analisaA:	
	beq $t1, $t2, resetaA			# if $t1 is equal to $t2 executes resetaA
	
	lw $t7, A($t0)				# load A[pos] on $t7
	blt $t7, $t3, adicionaDoA		# if $t7 is less than $t3 executes adicionaA
	
	addi $t0, $t0, 4				# (pos++) increments the position index
	addi $t1, $t1, 1				# (i++) increments the position index
	j analisaA					# loop jump
	
adicionaDoA:
	sw $t7, D($t8)				# store $t7 on D[k]
	addi $t8, $t8, 4				# (posk++) increments the position k
	addi $t9, $t9, 1				# (k++) increments the quantity of the vector D
	addi $t0, $t0, 4				# (pos++) increments the position index
	addi $t1, $t1, 1				# (i++) increments the position index
	j analisaA					# loop jump at analisaA

resetaA:
	li $t0, 0 					# (int pos = 0) traversing position in the vector
	li $t1, 0					# (int i = 0) integer to increment 
	lw $t2, n					# (int n = 6) number of items in the vectors 
	j analisaB					# loop jump at analisaB
	
analisaB:	
	beq $t1, $t2, resetaB			# if $t1 is equal to $t2 executes resetaB
	
	lw $t7, B($t0)				# load B[pos] on $t7
	blt $t7, $t3, adicionaDoB		# if $t7 is less than $t3 executes adicionaB
	
	addi $t0, $t0, 4				# (pos++) increments the position index
	addi $t1, $t1, 1				# (i++) increments the position index
	j analisaB					# loop jump at analisaB 
	
adicionaDoB:
	sw $t7, D($t8)				# store $t7 on D[k]
	addi $t8, $t8, 4				# (posk++) increments the position k
	addi $t9, $t9, 1				# (k++) increments the quantity of the vector D
	addi $t0, $t0, 4				# (pos++) increments the position index
	addi $t1, $t1, 1				# (i++) increments the position index
	j analisaB					# loop jump at analisaB 
	
resetaB:
	li $t0, 0 					# (int pos = 0) traversing position in the vector
	li $t1, 0					# (int i = 0) integer to increment 
	lw $t2, n					# (int n = 6) number of items in the vectors 
	j analisaC					# loop jump at analisaC 

analisaC:	
	beq $t1, $t2, Exit			# if $t1 is equal to $t2 executes salvaK
	
	lw $t7, C($t0)				# load C[pos] on $t7
	blt $t7, $t3, adicionaDoC		# if $t7 is less than $t3 executes adicionaC
	
	addi $t0, $t0, 4				# (pos++) increments the position index
	addi $t1, $t1, 1				# (i++) increments the position index
	j analisaC					# loop jump at analisaC 
	
adicionaDoC:
	sw $t7, D($t8)				# store $t7 on D[k]
	addi $t8, $t8, 4				# (posk++) increments the position k
	addi $t9, $t9, 1				# (k++) increments the quantity of the vector D
	addi $t0, $t0, 4				# (pos++) increments the position index
	addi $t1, $t1, 1				# (i++) increments the position index
	j analisaC					# loop jump at analisaC 
	

Exit: 						#End instructions
	sw $t9, k

j Exit						# loop jump at Exit 

#####################################
###        Ddiv_serial.asm        ###
#####################################

divider:  lui   $t0, 0x8000       		# mascara para isolar bit mais significativo
          li    $t1, 32           		# contador de iterações

          xor   $v0, $v0, $v0     		# registrador P($v0)-A($v1) com  0 e o dividendo
          add   $v1, $s1, $0

dloop:    and   $t2, $v1, $t0     		# isola em t2 o bit mais significativo do registador 'A' ($v1)
          sll   $v0, $v0, 1       		# desloca o registrado P-A
          sll   $v1, $v1, 1 

          beq   $t2, $0, di1    
          ori   $v0, $v0, 1       		# coloca 1 no bit menos significativo do registador 'P'($v0)

di1:      sub   $t2, $v0, $s0     		# subtrai 'P'($v0) do divisor ($s0)
          blt   $t2, $0, di2
          add   $v0, $t2, $0      		# se a subtração deu positiva, 'P'($v0) recebe o valor da subtração
          ori   $v1, $v1, 1       		# e 'A'($v1) recebe 1 no bit menos significativo

di2:      addi  $t1, $t1, -1      		# decrementa o número de iterações 
          bne   $t1, $0, dloop 

          jr    $ra        
