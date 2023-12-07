;152120201039 - HAKAN YAVAŞ
;IntToMc_HW3

start:	nop     
	LXI H, data     ; Load the starting address of the data set into HL register pair    
	MVI C, 14h      ; Load the number of data points into register C
	MVI A, 08h      ; Set the passing grade to 08h
	OUT 00h         ; Output the passing grade to port 00h
	MOV B, A        ; Copy passing grade to register B

loop:	MOV A, M        ; Load an element of the data into register A
	CMP B           ; Compare A with the passing grade which is the value in B
	JC fail         ; fails if A < B so jumped to fail
	INR D           ; Increments D if A >= B which means student has passed
	JMP next        

fail:	INR E           ; Increment E if A < B which means failed

next:   INX H           ; Increments HL pair to point to the next element in the data set
	DCR C           ; Decrements the counter C
	JNZ loop        ; Goes to loop if C is not zero
	MOV A, D        ; Moves the value of number of students passed to register A
	OUT 01h         ; Outputs the number of students passed to port 01h
	MOV A, E        ; Moves the value of number of students failed to register A
	OUT 02h         ; Output the number of students failed to port 02h
	CMP D           ; Compare A with D
	JNC failCount   ; Jump to failCount if A >= D 

successCount:	MVI A, 02h  ; Load 02h into A which counts successfull students       
		OUT 03h     ; Outputs to port 03h        
		JMP end     ; 

failCount:	MVI A, 01h  ; Load 02h into A which counts failed students  
		OUT 03h     ; Output 01h to port 03h

end:	HLT            

data:	db 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h, 0ah, 0bh, 0ch, 0dh, 0eh, 0fh, 10h, 11h, 12h, 13h, 14h
