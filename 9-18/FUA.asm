.MODEL SMALL
.STACK
.DATA
	lblinput db "Enter a string: $"
	lblucase db "Uppercase: $"
	lbllcase db "Lowercase: $"
	lblproper db "Proper case: $"
	lbltoggle db "Toggle case: $"

	varinput db 255 dup(?)
	varinputorig db 255 dup(?)
	
.CODE
START:
	mov ax, @data
	mov ds, ax

	; paint whole screen black
	mov ax, 0600h
	mov bh, 07h
	mov cx, 0000h
	mov dx, 184fh
	int 10h

	; move cursor for lblinput
	mov ah, 02h
	mov bh, 00
	mov dx, 0000h
	int 10h

	; print lblinput
	mov ah, 09h
	lea dx, lblinput
	int 21h

	; accept input
	lea si, varinput
	lea di, varinputorig

	acceptinput:
		mov ah, 01h
		int 21h

		cmp al, 13
		je stopinput

		mov [si], al
		mov [di], al
		inc si
		inc di
		jmp acceptinput

	stopinput:
		mov al, 36
		mov [si], al
		mov [di], al


	; convert to uppercase
		; check if input >= 61h
		lea si, varinput

		upcase:
		mov al, [si]
		cmp al, 61h
		jge ltu ; lowercase to uppercase
		
		; check if [si] is 36 or $
		cmp al, 36
		je printucase
		
		; increment [si], and back to upcase
		inc si
		jmp upcase

		ltu:
			sub al, 20h
			mov [si], al
			inc si
			jmp upcase

		printucase:
			; move cursor for lblucase
			mov ah, 02h
			mov bh, 00
			mov dx, 0100h
			int 10h

			; print lblucase
			mov ah, 09h
			lea dx, lblucase
			int 21h

			; print varinput
			mov ah, 09h
			lea dx, varinput
			int 21h

	; convert to lowercase
		; check if input <= 5Ah
		lea si, varinput
		
		lcase:
		mov al, [si]

		cmp al, 32
		je lcasespacebar
		jmp lcasenotspacebar

		lcasespacebar:
		inc si
		jmp lcase

		lcasenotspacebar:
		cmp al, 5ah
		jl uptolow

		cmp al, 36
		je printlcase

		uptolow:
			add al, 20h
			mov [si], al
			inc si
			mov al, [si]
			cmp al, 36
			jne lcase

		printlcase:
			; move cursor for lbllcase
			mov ah, 02h
			mov bh, 00
			mov dx, 0200h
			int 10h

			; print lbllcase
			mov ah, 09h
			lea dx, lbllcase
			int 21h

			; print varinput
			mov ah, 09h
			lea dx, varinput
			int 21h

	; convert to proper case
		lea si, varinput

		pcase:
		mov al, [si]

		; check if small letter
		cmp al, 61h
		jge pcaseltu
		
		; check if terminator
		cmp al, 36
		je printpcase

		; check if spacebar
		cmp al, 32
		je pcasespace
		jmp pcasenotspace

		pcaseltu:
		sub al, 20h
		mov [si], al
		inc si
		mov al, [si]

		pcasespace:
		inc si
		cmp al, 61h
		jge pcaseltu

		pcasenotspace:
		add al, 20h
		mov [si], al
		inc si
		jmp pcase


		printpcase:
		; move cursor for lblproper
		mov ah, 02h
		mov bh, 00
		mov dx, 0300h
		int 10h

		; print lblproper
		mov ah, 09h
		lea dx, lblproper
		int 21h

		; print varinput
		mov ah, 09h
		lea dx, varinput
		int 21h

	; convert case
		lea si, varinputorig

		ccase:
		mov al, [si]

		; check if spacebar
		cmp al, 32
		je ccasespacebar
		jmp ccasenotspacebar

		ccasespacebar:
		inc si
		mov al, [si]
		jmp ccase

		ccasenotspacebar:

		mov al, [si]
		; check if terminator
		cmp al, 36
		je ccaseterminator

		ccasenotterminator:
		; check if small letter
		mov al, [si]
		cmp al, 61h
		jge ccaseltu ; convert case lowercase to uppercase
		jmp ccaseutl ; convert case uppercase to lowercase

		ccaseltu:
		sub al, 20h
		mov [si], al
		inc si
		mov al, [si]
		jmp ccase

		ccaseutl:
		add al, 20h
		mov [si], al
		inc si
		mov al, [si]
		jmp ccase

		ccaseterminator:
		; move cursor for lbltoggle
		mov ah, 02h
		mov bh, 00
		mov dx, 0400h
		int 10h

		; print lbltoggle
		mov ah, 09h
		lea dx, lbltoggle
		int 21h

		; print varinput
		mov ah, 09h
		lea dx, varinputorig
		int 21h

	; terminate
	mov ah, 4ch
	int 21h
END START
