;
; L_04.asm
;
; Created: 3/06/2021 11:02:17 a. m.
; Author : jlb
;
.def temporal=r16
.def repeticiones=r17
.def valor_del_contador=r18

//Segmento de código
.cseg
.org 0x00
	//Inicia Stack
	ldi temporal,high(RAMEND)
	out SPH,temporal
	ldi temporal,low(RAMEND)
	out SPL,temporal
	//Inicia pin4 del puertoB
	sbi DDRB,PB5 ;PB5(SCK) como salida
	//Inicia TIMER0
	ldi temporal,1 << CS02 | 1 << CS00 ;Precaler a 1024
	out TCCR0B, temporal	
	//***********************************************
	//Valores del contador y las repeticiones para
	//obtener un pulso de 500ms			
	;fosc(usando prescaler)= 16,000,000s/1024 = 15,625 s = 15.625ms
	;Valor del contador = 500ms*15.625ms = 7,812.5
	; Como no puede contar hasta 7,812.5, se requieren 7,812.5/200=39.0625 aprox 39 repeticiones.
			
start:   	
	sbi PORTB,PB5	;escribe 1 en el pin 5
	rcall delay		;espera 500ms
	cbi PORTB,PB5	;escribe 0 en el pin 5
	rcall delay		;espera 500ms
	rjmp start

//Subrutinas
/****************************************
* Rutina de espera usando el TIMER0.
* Entrada: ninguna
* Salida: ninguna
*****************************************/
Delay:
	ldi valor_del_contador,0
	out TCNT0,valor_del_contador ; Inicia contador en 0
	ldi repeticiones,0;
ciclo:
	in valor_del_contador,TCNT0
	cpi valor_del_contador,200
	brne ciclo
	ldi valor_del_contador,0
	out TCNT0,valor_del_contador ; Inicia contador en 0
	inc repeticiones
	cpi repeticiones,39
	brne ciclo
	ret