.MODEL SMALL

.STACK

.DATA

		msg1 db "ASSEMBLY$"

		

.CODE

START:

		MOV AX, @DATA

		MOV DS, AX

		

		;4th quadrant
		mov ax, 0600h
		mov bh, 70
		mov cx, 0000h
		mov dx, 0c26h
		int 10h
		
		;white in 4th quadrant
		mov ax, 0600h
		mov bh, 20
		mov cx, 0000h
		mov dx, 0309h
		int 10h
		
		;1st quadrant
		mov ax, 0600h
		mov bh, 30
		mov cx, 0027h
		mov dx, 0c4fh
		int 10h
		
		;white in 1st quadrant
		mov ax, 0600h
		mov bh, 70
		mov cx, 0046h
		mov dx, 034fh
		int 10h
		
		;2nd quadrant
		mov ax, 0600h
		mov bh, 60
		mov cx, 0d27h
		mov dx, 184fh
		int 10h
		
		;white in 2nd quadrant
		mov ax, 0600h
		mov bh, 90
		mov cx, 0d46h
		mov dx, 104fh
		int 10h
		
		;3rd quadrant
		mov ax, 0600h
		mov bh, 30
		mov cx, 0d00h
		mov dx, 1826h
		int 10h
		
		;white in 3rd quadrant
		mov ax, 0600h
		mov bh, 60
		mov cx, 0d00h
		mov dx, 1009h
		int 10h
		
		;CENTER SOMETHING
		mov ax, 0600h
		mov bh, 10
		mov cx, 0613h
		mov dx, 123Ch
		int 10h
		
		;cursor position
		mov ah, 02h
		mov bh, 00
		mov dx, 0c23h
		int 10h
		
		;print message
		mov ah, 09h
		lea dx, msg1
		int 21h
		
		
		mov ah, 4ch
		int 21h

		

END START