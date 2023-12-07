;152120201039
;Hakan YAVAS
;2020h--> 8224 dec
;1039h--> 4153 dec

jmp start

;data


;code
start: nop

	MVI H, 20h ; Load 20h which is high bits of 2020h to H register.
	MVI L, 20h  ; Load 20h which is high bits of 2020h to L register.
	MOV B, M     

 
	MVI H, 10h   ; Load 20h which is high bits of 1039h to H register.
	MVI L, 39h   ; Load 20h which is high bits of 1039h to L register.
	MOV D, M     
	

	;Stack operations

	PUSH B 
	PUSH D
	;After line 28, the stack is currently -> Data D, Data B
	POP B ; Old Data D is loaded to B register. 
	;Stack is currently -> Data B
	POP D ; Old data B is loaded to D register.

	;out to I/O Ports
	MOV A, B
	OUT 00h

	MOV A, D
	OUT 01h


hlt