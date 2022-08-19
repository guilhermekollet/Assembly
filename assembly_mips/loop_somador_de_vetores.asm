###############################################################################################
#
# Especificação: Somar elemento a elemento os dois vetores V1 e V2 e colocar resultado 
#		no terceiro vetor, V3
#
###############################################################################################
        
	.data			

V1:	.word	0x12 0xff 0x3 0x14 0x878 0x31  0x62 0x10 0x5 0x16 0x20
V2:	.word	0x12 0xff 0x3 0x14 0x878 0x31  0x62 0x10 0x5 0x16 0x20
V3:	.word	0x0  0x0  0x0 0X0  0x0   0x0   0x0  0X0  0x0  0x0  0x0 

size:	.word	11
	
	.text
	
	.globl main   
	
main:
 
	lw $t0, V1			# load vector v1
	lw $t1, V2			# load vector v2
	lw $t2, V3			# load vector v3
	lw $t3, size			# number of items in the vectors
	li $s0, 0 			# (int pos = 0) traversing position in the vector 
	li $s1, 0			# (int i = 0) integer to increment 
	
somatorio:
	beq $s1, $t3, Exit		# if 'n' is equal to 'vector.length' executes save
	lw $t4, V1($s0)			# load the value about V1[pos] on $t4
	lw $t5, V2($s0)			# load the value about V2[pos] on $t5
	add $t2, $t4, $t5		# increments V1[pos] on $t4
	sw $t2, V3($s0)			# store on Data Memory
	
	addi $s0, $s0, 4		# (int pos = 0) traversing position in the vector
	addi $s1, $s1, 1		# (int i = 0) integer to increment 
	j somatorio

Exit:	j Exit