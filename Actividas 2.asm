;programa que calcula la raiz cuadrada de un numero entero
	;El numero del que sacara la raiz será dado en bcd y se guardara en B
	;El resultado debe ser depositado en el registro C

	.org 0000h ;establecemos la direccion de memoria
	;cargamos los valores en nuestros registros
	ld b,76
	ld c,0
	ld a,b

	;Comparamos y hacemos un salto incondicional
	cp 0
	jr Z, final
	cp 1
	jr Z, final

	ld d,1
	ld e,1

ciclo:	;Se compara con el cuadrado hasta obtener la posible raiz
	ld a,b
	cp d
	jr c, finalA
	inc e
	ld h,0
	ld l,0

suma: ;Suma sucesiba de numeros iguales
	ld a,l
	add a,e
	ld l,a
	inc h
	ld a,e
	cp h
	jr nz, suma
	ld d,l
	jr ciclo

final:
	ld c,a
	jr BCD

finalA:
	dec e
	ld c,e
	jr BCD


BCD:	;Convertimos de hexadecimal a BCD
	ld a,b
	ld l,0

loop:
	cp 10
	jr c, terminado
	sub 10
	inc l
	jr loop

terminado:
	sla l
	sla l
	sla l
	sla l
	or l
	ld B,A
	halt

	.end
