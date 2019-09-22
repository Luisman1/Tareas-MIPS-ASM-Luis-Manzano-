# Tarea 4
# Ejercicio 3
# Luis Enrique Manzano

.data

.text
Main: 
	li $a0, 3  # Valor N al que haremos la potencia
	li $s0, 2   # Registro para guardar 2
	jal potencia #Salto a la funcion potencia
	j exit	#Salto a Main
	
potencia: 
	slt $t0, $zero, $a0 # Si N es mayor que 0
	beq $t0, 1, loop   # Salto a loop
	addi $v0, $zero, 1 # Sino asignarle un valor base 0
	jr $ra	# Regreso de la llamada
loop: 
	addi $sp, $sp, -8 #Restamos el Stack pointer
	sw $ra, 0($sp) # Almacenamos N
	sw $s0, 4($sp) # Almcenamos s0 = 2
	sub $a0, $a0, 1 #Restamos n - 1 
	jal potencia   #Regresamos a la funcion recursiva
	lw $s0, 4($sp) # Leemos el valor de s0 en Stack
	lw $ra, 0($sp) # Leemos el valor de $ra en Stack
	addi $sp, $sp, 8 #Aumentamos Stack
	
	mul $v0, $s0, $v0 #Multiplicacion de 2 * n
	
	jr $ra # Regreso de la llamada
	
exit: 
	