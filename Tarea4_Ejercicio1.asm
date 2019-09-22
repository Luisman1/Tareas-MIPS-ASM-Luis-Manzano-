# Luis Enrique Manzano
# 19/09/2019
# Tarea 4: Ejercicio 1
# Producot punto de dos vectores

.data

Vector1: .word 1 2 3
Vector2: .word 6 7 8
Result: .word 0

.text

Main: 
	li $a0, 3	#Valor límite para iterar (k)
	li $a1, 0	#Registros para almacenar los valores de vector1
	li $a2, 0	#Registros para almacenar los valores de vector2
	li $s0, 0	#Variable para iterar (i)
	li $t0, 0	#Registro temporal
	li $t1, 0	#Registro temporal
	
	li $v0, 0	#Registro para almacenar resultados de mult final
	li $t4, 0	#Registro para almacenar resultados de mult temporal
	 
	la $s1, Vector1 #Variable temporal V1
	la $s2, Vector2 #Variable temporal V2
	la $s3, Result	#Varianle para guardar el resultado
	
Ciclo:	
	bne $a0, $s0, Multi	#Mientras que i < k salta a Multi
	j exit

Multi: 
	sll $t0, $s0, 2       #Desplazamiento de 2 bits a la izquierda del registro t0
	sll $t1, $s0, 2	      #Desplazamiento de 2 bits a la izquierda del registro t1
	
	add $t0, $t0, $s1     #Suma de las direcciones del vector s1 + el contador
	add $t1, $t1, $s2     #Suma de las direcciones del vector s2 + el contador
	
	lw $a1, 0($t0)	#Leer el valor de la primer posición del V1 a a1
	lw $a2, 0($t1)	#Leer el valor de la primer posición del V2 a a2
	mul $t4, $a1, $a2	#Multiplicacion de los vectores
	
	add $v0, $t4, $v0	#Sumamos el resultado con previas mult
	sw $v0, 0($s3)		#Escribimos el valor en registro s3
	
	addi $s0, $s0, 1	# i = i + 1
	
	j Ciclo
	
exit:
	
	
