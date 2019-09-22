# Tarea 4
# Ejercicio 3
# Luis Enrique Manzano

.data

.text
Main: 
	li $s0, 1	# Contador
	li $s1, 0	# Variable
	li $v0, 0	# Bandera
	
While: 	j Suma
While2: add $s0, $t0, $zero	# Retorna el valor de la rutina Suma a s0
	div $s1, $s0, 4		#Division de s0 / 4 y guardado en s1
	slti $v0, $s1, 20	# Mientras que s1 sea menor que 20 
	beq $v0, 1, While	# vuelve al ciclo
	j exit			

Suma:
	li $t0, 0		# Limpia t0
	add $t0, $s0, $s0	# Suma de s0 + s0
	j While2		# Regreso al While
	
exit: 