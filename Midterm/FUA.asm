.MODEL SMALL
.STACK
.DATA
	lblgame db "SORTING ALGORITHM$"
	lblentproceed db "Press enter to proceed$"
	lblenter1stnumber db "Enter 1st number: $"
	lblenter2ndnumber db "Enter 2nd number: $"
	lblenter3rdnumber db "Enter 3rd number: $"
	lblentertosort db "*Press enter to sort$"
	lblselect db "SELECT..$"
	lblascending db "ASCENDING$"
	lbldescending db "DESCENDING$"
	lblascendingresult db "THE NUMBERS IN ASCENDING ORDER$"
	lbldescendingresult db "THE NUMBERS IN DESCENDING ORDER$"
	lblquit db "*Press Q to Quit$"
	lblrepeat db "*Press R to Repeat$"
	lblscs db " , $"

	num1 db 0, 36
	num2 db 0, 36
	num3 db 0, 36
	tempnum db 0, 36
	result db 0

	selectvar db 0
	ascendingvar db 0
	descendingvar db 0
.CODE
START:
	mov ax, @data
	mov ds, ax

	; initialize vars
	mov selectvar, 30h
	mov ascendingvar, 30h
	mov descendingvar, 30h

	; paint whole screen black
	mov ax, 0600h
	mov bh, 00
	mov cx, 0000h
	mov dx, 184fh
	int 10h

	; paint blue box
	mov ax, 0600h
	mov bh, 10h
	mov cx, 0613h
	mov dx, 123ah
	int 10h

	; move cursor for lblgame
	mov ah, 02h
	mov bh, 00
	mov dx, 0c1fh
	int 10h

	; print lblgame
	mov ah, 09h
	lea dx, lblgame
	int 21h

	; move cursor for lblentproceed
	mov ah, 02h
	mov bh, 00
	mov dx, 0d1ch
	int 10h

	; print lblentproceed
	mov ah, 09h
	lea dx, lblentproceed
	int 21h

	; wait for enter
	starttrap:
	mov ah, 01h
	int 21h

	; check if al is enter key
	cmp al, 13
	je startgame
	jmp starttrap

	startgame:
	; paint blue box
	mov ax, 0600h
	mov bh, 10h
	mov cx, 0613h
	mov dx, 123ah
	int 10h

	; move cursor for lblenter1stnumber
	mov ah, 02h
	mov bh, 00
	mov dx, 0b1eh
	int 10h

	; print lblenter1stnumber
	mov ah, 09h
	lea dx, lblenter1stnumber
	int 21h

	; accept input
	mov ah, 01h
	int 21h
	mov num1, al

	; move cursor for lblenter2ndnumber
	mov ah, 02h
	mov bh, 00
	mov dx, 0c1eh
	int 10h

	; print lblenter2ndnumber
	mov ah, 09h
	lea dx, lblenter2ndnumber
	int 21h

	; accept input
	mov ah, 01h
	int 21h
	mov num2, al

	; move cursor for lblenter3rdnumber
	mov ah, 02h
	mov bh, 00
	mov dx, 0d1eh
	int 10h

	; print lblenter3rdnumber
	mov ah, 09h
	lea dx, lblenter3rdnumber
	int 21h

	; accept input
	mov ah, 01h
	int 21h
	mov num3, al

	; move cursor for lblentertosort
	mov ah, 02h
	mov bh, 00
	mov dx, 0e1ch
	int 10h

	; print lblentertosort
	mov ah, 09h
	lea dx, lblentertosort
	int 21h

	; wait for enter key
	startsorttrap:
	mov ah, 01h
	int 21h

	; check if al is enter key
	cmp al, 13
	je sortmenu
	jmp startsorttrap

	sortmenu:
	; paint blue box
	mov ax, 0600h
	mov bh, 10h
	mov cx, 0613h
	mov dx, 123ah
	int 10h

	; move cursor for lblselect
	mov ah, 02h
	mov bh, 00
	mov dx, 0b13h
	int 10h

	; print lblselect
	mov ah, 09h
	lea dx, lblselect
	int 21h

	; move cursor for lblascending
	mov ah, 02h
	mov bh, 00
	mov dx, 0c23h
	int 10h

	; print lblascending
	mov ah, 09h
	lea dx, lblascending
	int 21h

	; move cursor for lbldescending
	mov ah, 02h
	mov bh, 00
	mov dx, 0d22h
	int 10h

	; print lbldescending
	mov ah, 09h
	lea dx, lbldescending
	int 21h

	; move cursor for lblentertosort
	mov ah, 02h
	mov bh, 00
	mov dx, 0e1ch
	int 10h

	; print lblentertosort
	mov ah, 09h
	lea dx, lblentertosort
	int 21h

	; begin highlighting
		selectwhite:
		; activate select var
		mov selectvar, 31h

		; deactivate all other choices
		mov ascendingvar, 30h
		mov descendingvar, 30h

		; highlight lblselect white
		mov ax, 0600h
		mov bh, 70h
		mov cx, 0b13h
		mov dx, 0b3ah
		int 10h

		; move cursor for lblselect
		mov ah, 02h
		mov bh, 00
		mov dx, 0b13h
		int 10h

		; print lblselect
		mov ah, 09h
		lea dx, lblselect
		int 21h

		; check what key is pressed
		mov ah, 01h
		int 21h

		; check if enter key is pressed
		cmp al, 13
		je checkifselect

		; check if al is 's'
		cmp al, 73h
		je downarrow

		; check if al is 'w'
		cmp al, 77h
		je uparrow

		checkifselect:
		cmp selectvar, 1
		je selectwhite

		downarrow:
		mov selectvar, 0
		je ascending
		
		uparrow:
		je selectwhite



		ascending:
		; activate ascending var
		mov ascendingvar, 31h

		; deactivate all other vars
		mov selectvar, 30h
		mov descendingvar, 30h

		; paint everything blue
		mov ax, 0600h
		mov bh, 10h
		mov cx, 0613h
		mov dx, 123ah
		int 10h

		; paint ascending white
		mov ax, 0600h
		mov bh, 70h
		mov cx, 0c13h
		mov dx, 0c3ah
		int 10h

		; move cursor for lblselect
		mov ah, 02h
		mov bh, 00
		mov dx, 0b13h
		int 10h

		; print lblselect
		mov ah, 09h
		lea dx, lblselect
		int 21h

		; move cursor for lblascending
		mov ah, 02h
		mov bh, 00
		mov dx, 0c23h
		int 10h

		; print lblascending
		mov ah, 09h
		lea dx, lblascending
		int 21h

		; move cursor for lbldescending
		mov ah, 02h
		mov bh, 00
		mov dx, 0d22h
		int 10h

		; print lbldescending
		mov ah, 09h
		lea dx, lbldescending
		int 21h

		; move cursor for lblentertosort
		mov ah, 02h
		mov bh, 00
		mov dx, 0e1ch
		int 10h

		; print lblentertosort
		mov ah, 09h
		lea dx, lblentertosort
		int 21h

		; accept nav keys
		mov ah, 01h
		int 21h

		; check if al is enter key
		cmp al, 13
		je sortascending
		jmp notsortascending

		sortascending:
		; check if num1 >= num2
		mov al, num2
		cmp num1, al
		jge num1ge2
		jl num1l2

			num1ge2:
				; move num2 to tempnum
				mov al, num2
				mov tempnum, al

				; move num1 to num2, and tempnum to num1
				mov al, num1
				mov num2, al
				mov al, tempnum
				mov num1, al


				checknum2num3:
				; check if num2 >= num3
				mov al, num3
				cmp num2, al
				jge num2ge3
				jl num2l3

				num2ge3:
					; move num3 to tempnum
					mov al, num3
					mov tempnum, al

					; move num2 to num3, and tempnum to num2
					mov al, num2
					mov num3, al
					mov al, tempnum
					mov num2, al

					checknum1num3:
					; check if num1 >= num3
					mov al, num3
					cmp num1, al
					jge num1ge3
					jl num1l3

					num1ge3:
					; move num3 to tempnum
					mov al, num3
					mov tempnum, al

					; move num1 to num3, and tempnum to num1
					mov al, num1
					mov num3, al
					mov al, tempnum
					mov num1, al

					jmp printascendingresult

					num1l3:
					; check if num2 >= num1
					mov al, num1
					cmp num2, al
					jl num1ge2

					jmp printascendingresult

				num2l3:
				jmp checknum1num3

			num1l2:
			jmp checknum2num3


		notsortascending:
		; check if al is s key
		cmp al, 73h
		je descending
		jmp ascending

		descending:
		; activate descendingvar
		mov descendingvar, 31h

		; deactivate all other vars
		mov selectvar, 30h
		mov ascendingvar, 30h

		; paint everything blue
		mov ax, 0600h
		mov bh, 10h
		mov cx, 0613h
		mov dx, 123ah
		int 10h

		; paint descending white
		mov ax, 0600h
		mov bh, 70h
		mov cx, 0d13h
		mov dx, 0d3ah
		int 10h

		; move cursor for lblselect
		mov ah, 02h
		mov bh, 00
		mov dx, 0b13h
		int 10h

		; print lblselect
		mov ah, 09h
		lea dx, lblselect
		int 21h

		; move cursor for lblascending
		mov ah, 02h
		mov bh, 00
		mov dx, 0c23h
		int 10h

		; print lblascending
		mov ah, 09h
		lea dx, lblascending
		int 21h

		; move cursor for lbldescending
		mov ah, 02h
		mov bh, 00
		mov dx, 0d22h
		int 10h

		; print lbldescending
		mov ah, 09h
		lea dx, lbldescending
		int 21h

		; move cursor for lblentertosort
		mov ah, 02h
		mov bh, 00
		mov dx, 0e1ch
		int 10h

		; print lblentertosort
		mov ah, 09h
		lea dx, lblentertosort
		int 21h

		; accept nav keys
		mov ah, 01h
		int 21h

		; check if al is enter key
		cmp al, 13
		je sortdescending

		; check if al is 'w' key
		cmp al, 77h
		jne descending
		jmp ascending

		sortdescending:
		; check if num1 < num2
		mov al, num2
		cmp num1, al
		jl desc1l2
		jge desc1ge2

			desc1l2:
			; move num1 to tempnum
			mov al, num2
			mov tempnum, al

			; move num2 to num1, tempnum to num2
			mov al, num2
			mov num1, al
			mov al, tempnum
			mov num2, al

			; check if num1 < num3
			mov al, num3
			cmp num1, al
			jl desc1l3
			jge desc1ge3

				desc1l3:
				; move num1 to tempnum
				mov al, num1
				mov tempnum, al

				; move num3 to num1, and move tempnum to num3
				mov al, num3
				mov num1, al
				mov al, tempnum
				mov num3, al

				desc1ge3:


			desc1ge2:



		printascendingresult:
		; paint blue box
		mov ax, 0600h
		mov bh, 10h
		mov cx, 0613h
		mov dx, 123ah
		int 10h

		; move cursor for lblascendingresult
		mov ah, 02h
		mov bh, 00
		mov dx, 0818h
		int 10h

		; print lblascendingresult
		mov ah, 09h
		lea dx, lblascendingresult
		int 21h

		; move cursor for result
		mov ah, 02h
		mov bh, 00
		mov dx, 0922h
		int 10h

		; print num1
		mov ah, 09h
		lea dx, num1
		int 21h

		; print lblscs
		mov ah, 09h
		lea dx, lblscs
		int 21h

		; print num2
		mov ah, 09h
		lea dx, num2
		int 21h

		; print lblscs
		mov ah, 09h
		lea dx, lblscs
		int 21h

		; print num3
		mov ah, 09h
		lea dx, num3
		int 21h
		jmp exit

	EXIT:
		; move cursor for lblquit
		mov ah, 02h
		mov bh, 00
		mov dx, 111fh
		int 10h

		; print lblquit
		mov ah, 09h
		lea dx, lblquit
		int 21h

		; move cursor for lblrepeat
		mov ah, 02h
		mov bh, 00
		mov dx, 121eh
		int 10h

		; print lblrepeat
		mov ah, 09h
		lea dx, lblrepeat
		int 21h

		acceptexit:
		; accept input
		mov ah, 01h
		int 21h

		; check if input is Q
		cmp al, 51h
		je superexit
		cmp al, 71h
		je superexit

		; check if input is R
		cmp al, 52h
		jne continuerepeat
		jmp start
continuerepeat:
		cmp al, 72h
		jne superexit
		jmp start




	SUPEREXIT:
	; terminate
	mov ah, 4ch
	int 21h
END START