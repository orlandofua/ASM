.MODEL SMALL
.STACK
.DATA
	msg1 db "My name is Orlando Fua III$"
	msg2 db "21 years old$"
	msg3 db "I live in Bantayn Dumaguete City$"
	msg4 db "I am a third year BSIT student of Asian College$"
	msg5 db "My friends call me ting2x$"
	msg6 db "I was born on November 17 1993$"
	msg7 db "And yes I am a scorpio$"
	msg8 db "I am from Siquijor$"
	msg9 db "I have a future and wife and a daughter$"
	msg10 db "They are my inspiration$"
.CODE
START:
	mov ax, @data
	mov ds, ax
	
	lea dx, msg1
	mov ah, 09h
	int 21h
	
	mov dl, 10
	mov ah, 02h
	int 21h
	mov dl, 13
	mov ah, 02h
	int 21h
	
	lea dx, msg2
	mov ah, 09h
	int 21h
	
	mov dl, 10
	mov ah, 02h
	int 21h
	mov dl, 13
	mov ah, 02h
	int 21h
	
	lea dx, msg3
	mov ah, 09h
	int 21h
	
	mov dl, 10
	mov ah, 02h
	int 21h
	mov dl, 13
	mov ah, 02h
	int 21h
	
	lea dx, msg4
	mov ah, 09h
	int 21h
	
	mov dl, 10
	mov ah, 02h
	int 21h
	mov dl, 13
	mov ah, 02h
	int 21h
	
	lea dx, msg5
	mov ah, 09h
	int 21h
	
	mov dl, 10
	mov ah, 02h
	int 21h
	mov dl, 13
	mov ah, 02h
	int 21h
	
	lea dx, msg6
	mov ah, 09h
	int 21h
	
	mov dl, 10
	mov ah, 02h
	int 21h
	mov dl, 13
	mov ah, 02h
	int 21h
	
	lea dx, msg7
	mov ah, 09h
	int 21h
	
	mov dl, 10
	mov ah, 02h
	int 21h
	mov dl, 13
	mov ah, 02h
	int 21h
	
	lea dx, msg8
	mov ah, 09h
	int 21h
	
	mov dl, 10
	mov ah, 02h
	int 21h
	mov dl, 13
	mov ah, 02h
	int 21h
	
	lea dx, msg9
	mov ah, 09h
	int 21h
	
	mov dl, 10
	mov ah, 02h
	int 21h
	mov dl, 13
	mov ah, 02h
	int 21h
	
	lea dx, msg10
	mov ah, 09h
	int 21h
	
	mov ah, 4ch
	int 21h	
END START