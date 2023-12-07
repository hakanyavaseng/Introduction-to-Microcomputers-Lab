;152120201039_HakanYavas_HW4

jmp start

;data


;code
start: nop

	MVI D, 00H   ; 00h portundaki deger D register'ina atiliyor.
	IN 0h        
	RRC  	     ;RRC komutu saga dogru bir bit kaydirarak, kolay yoldan 2'ye bolme islemi gerceklestiriyor.
	MOV C, A     ;Bolunmus sayiyi C register'ina atiyoruz

	MVI E, 01H ; 01H portundaki deger E register'ina atiliyor.
	IN 1h
	RAL        ; RAL komutu sola dogru bir bit dondurerek sayiyi kolay yoldan 2 ile carpar.
	MOV B, A   ; Carpim sonucu elde edilen sayi B register'ina atilir.

	;Burada D ve E registerlari temizleniyor.
	MVI D, 00h 
	MVI E, 00h


	; B^C islemi 
	MVI D, 01H ;D register'i sonucu tutacagindan ilk degeri 1'e set ediliyor.



takePower: CALL multiply
	   DCR C ; Us azaltiliyor
	   JNZ takePower
	   INX H
   	   MOV M,D
           MOV A, D ; Sonuc accumulatore atiliyor ve 02h portuna cikti veriliyor
           OUT 02h 
	   HLT

multiply:  MOV E,B
	   MVI A, 00H

loop:	   ADD D ;Accumulator'deki degere D degerini ekler ardindan E'yi azaltir
	   DCR E
	   JNZ loop ;E 0 olmadigi surece loop tekrarlanir
	   MOV D,A
	   RET




EXIT: HLT 