# Tarea 6
# Fibonacci Numbers with recursive function
# Luis Enrique Manzano
.data

.text
Main: 
	li $v0, 10	# N
	li $v1, 0	# Resultado
	li $s0, 0	# Registro para aumentar 1
	li $a0, 0	# Variable auxiliar de t0 (aux)
	li $t7, 0	# Bandera para verificar que es el fin de la rama
	
	add $t0, $v0, $t0 # Clon de N (n)
	
	jal fibo	# Salto a funcion fibo
	
fibo: 	
	slti $t1, $t0, 2	# if n>2 
	bne $t1, 1, ciclo	# jump to ciclo
				# if n<2
	beq $t0, 0x01, fibo_1	# (n = 1)? s1 + 1 : s1 + 0
	
fibo_0:	
	li $s0, 0	# Añadir 0 a s0
	li $t7, 1	# Bandera = 1
	jr $ra		# Regreso a la llamada
	
fibo_1:
	li $s0, 1	# Añadir 1 a s0
	li $t7, 1	# Bandera = 1
	jr $ra		# Regreso de la llamada
	
ciclo: 	
	sub $sp, $sp, 8		# Reservamos 8 bytes al stack
	sw $ra, 0($sp)		# Guardamos return address
	sw $t0, 4($sp)		# Guardamos en que valor n nos quedamos
	
	sub $a0, $t0, 1		# aux = n - 1
	add $t0, $a0, $zero	# n = aux
	jal fibo		# fibo ( n )
	
add_f:	add $v1, $s0, $v1       # v1 = s0 + v1 
	
	lw $t0, 4($sp)		# Leemos el valor de n en stack
	lw $ra, 0($sp)		# Leemos el valor de return address en stack
	
	addi $sp, $sp, 8	# Sumamos 8 bytes en stack
	beq $t7, 1, sub_2	# Si la bandera es igual a 1, salta a sub_2
	jr $ra			# Regreso de la llamada
	
sub_2:	
	li $t7, 0		# Bandera = 0
	sub $a0, $t0, 2		# aux = n - 2
	add $t0, $a0, $zero	# n = aux
	
	blt $a0, 0, exit	# Si aux es menor que 0, salimos del programa

	jal fibo		# fibo ( n )
	j add_f			# Saltamos a sumar

exit: 
