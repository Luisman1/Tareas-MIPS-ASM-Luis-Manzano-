# Tarea 4
# Ejercicio 2
# Luis Enrique Manzano

.data

.text
Main: 
	li $s0, 0	#Variable para obtener la funcion a realizar
	li $s1, 5	#a
	li $s2, 3	#b
	li $s3, 0	#Resultado
	
Ciclo:	addi $s0, $s0, 1    # +1 a s0 para hacer todo el reocrrido de las funciones
			    # Cases
	beq $s0, 1, Case_1  # s0 = 1 ; Suma
	beq $s0, 2, Case_2  # s0 = 2 ; Resta
	beq $s0, 3, Case_3  # s0 = 3 ; Multiplicacion
	beq $s0, 4, exit    # s0 = 4 ; Exit
	
	and, $s3, $s1, $s2  # a And b
	j Ciclo
	
Case_1: 
	add $s3, $s1, $s2   # a + b
	j Ciclo
	
Case_2:
	sub $s3, $s1, $s2   # a - b
	j Ciclo
Case_3:
	mul $s3, $s1, $s2   # a * b 	
	j Ciclo

exit: