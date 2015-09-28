.MODEL SMALL
.STACK
.DATA
	lblenterstring db "Enter a string: $"
	lblvowels db "No. of Vowels: $"
	lblconsonants db "No. of Consonants: $"
	lblspaces db "No. of Spaces: $"
	lblcharacters db "No. of Characters: $"
	lbltryagain db "Try again? Y/N: $"

	characters1 db ?, 36
	characters2 db ?, 36
	string db ?, 100 dup (?)
	vowels1 db ?, 36
	vowels2 db ?, 36
	consonants1 db ?, 36
	consonants2 db ?, 36
	spaces1 db ?, 36
	spaces2 db ?, 36
	tryagain db ?, 36
.CODE
START:
	mov ax, @data
	mov ds, ax

	; initialize variables
	mov vowels1, 30h
	mov vowels2, 30h
	mov consonants1, 30h
	mov consonants2, 30h
	mov spaces1, 30h
	mov spaces2, 30h
	mov characters1, 30h
	mov characters2, 30h

	; paint whole screen black
	mov ax, 0600h
	mov bh, 07h
	mov cx, 0000h
	mov dx, 184fh
	int 10h

	; move cursor to topmost
	mov ah, 02h
	mov bh, 00
	mov dx, 0000h
	int 10h

	; print lblenterstring
	mov ah, 09h
	lea dx, lblenterstring
	int 21h

	; accept input
	lea si, string

	acceptstring:
		mov ah, 01h
		int 21h

		cmp al, 13
		jne string2
		jmp stopstring
	string2:
		; check if space
		cmp al, 32
		je incspaces
		jmp inccharacters

	incspaces:
		; check if spaces2 > 9
		cmp spaces2, 39h
		je addtenspaces

		; inc spaces2
		inc spaces2
		jmp resumestring

	addtenspaces:
		; add 1 to first digit, and make second digit 0
		add spaces1, 01h
		sub spaces2, 09h

		jmp resumestring

	inccharacters:
		; check if characters2 > 9
		cmp characters2, 39h
		je addtenchar

		; increment characters2
		inc characters2
		jmp checkvowel

	addtenchar:
		; add 1 to first digit, and make second digit 0
		add characters1, 01h
		sub characters2, 09h
		

	checkvowel:
		; check if vowel
		cmp al, 61h
		je incvowel
		cmp al, 41h
		je incvowel
		cmp al, 65h
		je incvowel
		cmp al, 45h
		je incvowel
		cmp al, 69h
		je incvowel
		cmp al, 49h
		je incvowel
		cmp al, 6fh
		je incvowel
		cmp al, 4fh
		je incvowel
		cmp al, 75h
		je incvowel
		cmp al, 55h
		je incvowel
		jmp incconsonant

	incvowel:
		; check if vowels2 > 9
		cmp vowels2, 39h
		je addtenvowels

		; increment vowels2
		inc vowels2
		jmp resumestring

	addtenvowels:
		; add 1 to first digit, and make second digit 0
		add vowels1, 01h
		sub vowels2, 09h
		jmp resumestring

	incconsonant:
		; check if consonants2 > 9
		cmp consonants2, 39h
		je addtenconsonants

		; increment consonants2
		inc consonants2
		jmp resumestring

	addtenconsonants:
		; add 1 to first digit, and make second digit 0
		add consonants1, 01h
		sub consonants2, 09h
		jmp resumestring

	resumestring:
		mov [si], al
		inc si
		jmp acceptstring
	
	stopstring:
		mov al, 36
		mov [si], al

	; lblvowels
		; move cursor for lblvowels
		mov ah, 02h
		mov bh, 00
		mov dx, 0100h
		int 10h

		; print lblvowels
		mov ah, 09h
		lea dx, lblvowels
		int 21h

		; check if vowels1 != 0
		cmp vowels1, 30h
		je printvowels2

		; print var vowels1
		mov ah, 09h
		lea dx, vowels1
		int 21h

printvowels2:
		; print var vowels2
		mov ah, 09h
		lea dx, vowels2
		int 21h

	; lblconsonants
		; move cursor for lblconsonants
		mov ah, 02h
		mov bh, 00
		mov dx, 0200h
		int 10h

		; print lblconsonants
		mov ah, 09h
		lea dx, lblconsonants
		int 21h

		; check if consonants1 != 0
		cmp consonants1, 30h
		je printconsonants2

		; print var consonants1
		mov ah, 09h
		lea dx, consonants1
		int 21h

printconsonants2:
		; print var consonants2
		mov ah, 09h
		lea dx, consonants2
		int 21h

	; lblspaces
		; move cursor for lblspaces
		mov ah, 02h
		mov bh, 00
		mov dx, 0300h
		int 10h

		; print lblspaces
		mov ah, 09h
		lea dx, lblspaces
		int 21h

		; check if spaces1 != 0
		cmp spaces1, 30h
		je printspaces2

		; print var spaces1
		mov ah, 09h
		lea dx, spaces1
		int 21h
printspaces2:
		; print var spaces2
		mov ah, 09h
		lea dx, spaces2
		int 21h

	; lblcharacters
		; move cursor for lblcharacters
		mov ah, 02h
		mov bh, 00
		mov dx, 0400h
		int 10h

		; print lblcharacters
		mov ah, 09h
		lea dx, lblcharacters
		int 21h

		; check if characters1 != 0
		cmp characters1, 30h
		je printchar2

		; print var characters1
		mov ah, 09h
		lea dx, characters1
		int 21h

printchar2:
		; print var characters2
		mov ah, 09h
		lea dx, characters2
		int 21h

	; lbltryagain
		; move cursor for lbltryagain
		mov ah, 02h
		mov bh, 00
		mov dx, 0500h
		int 10h

		; print lbltryagain
		mov ah, 09h
		lea dx, lbltryagain
		int 21h

		; accept input
		lea si, tryagain

		accepttryagain: 
			mov ah, 01h
			int 21h

			cmp al, 13
			je stoptryagain

			mov [si], al
			inc si
			jmp accepttryagain

		stoptryagain:
			mov al, 36
			mov [si], al

		; check if input is Y
		cmp tryagain, 59h
		jne compare2
		jmp start

		compare2:
		cmp tryagain, 79h
		jne superexit
		jmp start

superexit:
	;terminate
	mov ah, 4ch
	int 21h

END START