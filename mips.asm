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

############################################################
###       Salva os somatórios dos vetores A, B e C       ###
############################################################

	sw $t4, sumA
	sw $t5, sumB
	sw $t6, sumC
	
##################################################
###       Calcula a média dos somatórios       ###
##################################################
	
	la $s1, sumA 
	lw $s1, 0($s1)      	# lê o dividendo
	la $s0, n
	lw $s0, 0($s0)      	# lê o divisor
	jal divider         	# resposta em $v0  $v1
	
	sw $v1, sumA		# salva a média do vetor A
	
	la $s1, sumB 
	lw $s1, 0($s1)      	# lê o dividendo
	la $s0, n
	lw $s0, 0($s0)      	# lê o divisor
	jal divider         	# resposta em $v0  $v1
	
	sw $v1, sumB		# salva a média do vetor B
	
	la $s1, sumC 
	lw $s1, 0($s1)      	# lê o dividendo
	la $s0, n
	lw $s0, 0($s0)      	# lê o divisor
	jal divider         	# resposta em $v0  $v1
	
	sw $v1, sumC		# salva a média do vetor B
	
#########################################################################
###        3º ESPECIFICAÇÃO: VM -> MIN E VALORES MENORES QUE VM       ###
#########################################################################
	
	lw $t3, MIN

achaMin:

	lw $t4, sumA
	blt $t4, $t3, incrementa
	
	lw $t4, sumB
	blt $t4, $t3, incrementa

	lw $t4, sumC
	blt $t4, $t3, incrementa
	
	sw $t3, MIN
	
	move $t0, $zero 	# posição de percorrimento no vetor (int pos = 0)
	li $t1, 0		# inteiro para incremento (int i = 0)
	lw $t2, n		# quantidade de itens nos vetores (int n = 6)
	lw $t9, k
		
	lw $s0, A		# vetor A
	lw $s1, B		# vetor B
	lw $s2, C		# vetor C
	lw $s3, D		# vetor D
	
	lw $t3, MIN
	
	j analisaA

incrementa:
	add $t3, $zero, $t4
	j achaMin
		
analisaA:	
	beq $t1, $t2, resetaA
	
	lw $t7, A($t0)			# armazena conteúdo do vetor A em $t7
	blt $t7, $t3, adicionaDoA	# se o conteúdo do vetor A for menor que o $t3 (MIN)
	
	addi $t0, $t0, 4		# incrementa a posição do vetor (pos++)
	addi $t1, $t1, 1
	j analisaA
	
adicionaDoA:
	sw $t7, D($t9)
	addi $t9, $t9, 4
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	j analisaA

resetaA:
	move $t0, $zero 	# posição de percorrimento no vetor (int pos = 0)
	li $t1, 0		# inteiro para incremento (int i = 0)
	lw $t2, n		# quantidade de itens nos vetores (int n = 6)
	j analisaB
	
analisaB:	
	beq $t1, $t2, resetaB
	
	lw $t7, B($t0)			# armazena conteúdo do vetor A em $t7
	blt $t7, $t3, adicionaDoB	# se o conteúdo do vetor A for menor que o $t3 (MIN)
	
	addi $t0, $t0, 4		# incrementa a posição do vetor (pos++)
	addi $t1, $t1, 1
	j analisaB
	
adicionaDoB:
	sw $t7, D($t9)
	addi $t9, $t9, 4
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	j analisaB
	
resetaB:
	move $t0, $zero 	# posição de percorrimento no vetor (int pos = 0)
	li $t1, 0		# inteiro para incremento (int i = 0)
	lw $t2, n		# quantidade de itens nos vetores (int n = 6)
	j analisaC

analisaC:	
	beq $t1, $t2, Exit
	
	lw $t7, C($t0)			# armazena conteúdo do vetor A em $t7
	blt $t7, $t3, adicionaDoC	# se o conteúdo do vetor A for menor que o $t3 (MIN)
	
	addi $t0, $t0, 4		# incrementa a posição do vetor (pos++)
	addi $t1, $t1, 1
	j analisaC
	
adicionaDoC:
	sw $t7, D($t9)
	addi $t9, $t9, 4
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	j analisaC

Exit: 

j Exit

####################################################################################
###        Divisão serial  $s1/ $s0 -->   $v0--> resto    $v1 --> divisão        ###
#################################################################################### 

divider:  lui   $t0, 0x8000       # mascara para isolar bit mais significativo
          li    $t1, 32           # contador de iterações

          xor   $v0, $v0, $v0     # registrador P($v0)-A($v1) com  0 e o dividendo
          add   $v1, $s1, $0

dloop:    and   $t2, $v1, $t0     # isola em t2 o bit mais significativo do registador 'A' ($v1)
          sll   $v0, $v0, 1       # desloca o registrado P-A
          sll   $v1, $v1, 1 

          beq   $t2, $0, di1    
          ori   $v0, $v0, 1       # coloca 1 no bit menos significativo do registador 'P'($v0)

di1:      sub   $t2, $v0, $s0     # subtrai 'P'($v0) do divisor ($s0)
          blt   $t2, $0, di2
          add   $v0, $t2, $0      # se a subtração deu positiva, 'P'($v0) recebe o valor da subtração
          ori   $v1, $v1, 1       # e 'A'($v1) recebe 1 no bit menos significativo

di2:      addi  $t1, $t1, -1      # decrementa o número de iterações 
          bne   $t1, $0, dloop 

          jr    $ra        
