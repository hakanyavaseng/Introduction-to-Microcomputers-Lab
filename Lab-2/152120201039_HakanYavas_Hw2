
;152120201039_HW2
;00h -> 20h 32d B
;01h -> 20h 32d C
;02h -> 67h 103d D
;03h -> 89h 137d E

jmp start

;data


;code
start: nop

	;After loading data to ports via interface, the code lines below
	;first transfers the data in port to accumulator A, after that
	;all data is transferred to B-C-D-E registers step by step.
	IN 0a00h
	MOV B,A
	IN 0a01h
	MOV C,A
	IN 0a02h
	MOV D,A
	IN 0a03h
	MOV E,A

	MVI A, 00h ;Clears A by assigning 0.

	;Arithmetic Operations
	; 20h(B) 20h(C)
	; 67h(D) 89h(E)
	;+________

	MOV A, C   
	ADC E      ; Accumulator'un icinde bulunan C degerine E'yi carry durumunu kontrol
	           ; ederek ekler.
	DAA        ; DAA instruction'ı elde edilen degeri BCD olarak duzeltiyor.
	MOV C, A   ; Elde edilen high deger H register'ına kaydedilir.
	MOV A, B   
	ADC D      ;Accumulator'un icinde bulunan B degerine D'yi carry durumunu kontrol
	           ;ederek ekler.
	DAA        ; DAA instruction'ı elde edilen degeri BCD olarak duzeltiyor.
	MOV B, A   ; Elde edilen high deger L register'ına kaydedilir.
	
	;Because of HL must be used in next op. results are assigned to BC again
	;1039h

	;Transfer data 
	LXI H, 1039H
	MOV M,B
	INX H 
	MOV M,C

HLT