.MODEL SMALL
.STACK
.DATA
	lblInput db "Enter a character: $"
	lblDisplay db "The character is $"
	char db 0
.CODE
START:
	 MOV AX, @DATA
	 MOV DS, AX
	 
	 ; SET BACKGROUND
	 MOV AX, 0600H
	 MOV BH, 07H
	 MOV CX, 0000H
	 MOV DX, 184FH
	 INT 10H
	 
	 ; MOVE CURSOR
	 MOV AH, 02H
	 MOV BH, 00
	 MOV DX, 071FH
	 INT 10H
	 
	 ; PRINT
	 MOV AH, 09H
	 LEA DX, lblInput
	 INT 21H
	 
	 ; ACCEPT CHARACTER
	 MOV AH, 01H
	 INT 21H
	 
	 ; STORE TO VAR
	 MOV CHAR, AL
	 
	 ; MOVE CURSOR
	 MOV AH, 02H
	 MOV BH, 00
	 MOV DX, 081FH
	 INT 10H
	 
	 ; DISPLAY INPUT
		 ; DISPLAY CHARACTER LABEL
		 MOV AH, 09H
		 LEA DX, lblDisplay
		 INT 21H
		 
		 ; DISPLAY
		 MOV DL, CHAR 
		 MOV AH, 02H
		 INT 21H
		 
		 
	 MOV AH, 4CH
	 INT 21H
	 
	
END START

