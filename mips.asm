.data
	A: .word 810 100 560 380 600 87
	B: .word 800 555 817 124 890 456
	C: .word 345 200 700 180 600 490

	n: .word 6
	k: .word 0
	
	sumA: .word 0
	sumB: .word 0
	sumC: .word 0

.text

main:
	move $t0, $zero 	# posição de percorrimento no vetor (int pos = 0)
	li $t1, 0		# inteiro para incremento (int i = 0)
	lw $t2, n		# quantidade de itens nos vetores (int n = 6)
		
	lw $s0, A		# vetor A
	lw $s1, B		# vetor B
	lw $s2, C		# vetor C
	
	lw $t4, sumA		# somatorio para A (int sumA[])
	lw $t5, sumB		# somatorio para B (int sumB[])
	lw $t6, sumC		# somatorio para C (int sumC[])

somatorio:
	beq $t1, $t2, saiDoLoop
	lw $t3, A($t0)		# armazena conteúdo do vetor A em $t3
	add $t4, $t4, $t3	# incrementa o valor do vetor A no sumA
	
	lw $t3, B($t0)		# armazena conteúdo do vetor B em $t3
	add $t5, $t5, $t3	# incrementa o valor do vetor B no sumA
	
	lw $t3, C($t0)		# armazena conteúdo do vetor C em $t3
	add $t6, $t6, $t3	# incrementa o valor do vetor C no sumA
	
	addi $t0, $t0, 4	# incrementa a posição do vetor (pos++)
	addi $t1, $t1, 1	# incremento do i (i++)
	j somatorio
	
saiDoLoop:
	sw $t4, sumA
	sw $t5, sumB
	sw $t6, sumC
	j Exit
	
Exit: j Exit
