.model small
.stack
.data
	lblwelcomemain db "WELCOME TO THE GREATEST GAME SHOW ON EARTH$"
	lblmain db "GREATEST GAME SHOW ON EARTH$"
	lblentername db "PLEASE ENTER YOUR NAME: $"
	lblplayername db "PLAYER NAME: $"
	playername db "$"
	playernameseparator db "The quick brown fox jumps over the lazy dog near the bank of the river$"
	lblmoneylevel db "MONEY LEVEL$"

	; prizes
	lblfirstprize db "1,000.00$"
	lblsecondprize db "500.00$"
	lblthirdprize db "100.00$"
	lblzeroprize db "0.00$"

	; question 1
	lblheadquestion1 db "QUESTION 1$"
	lblquestion1 db "How many vowels are in the word Asian?$"
	lblq1choice1 db "a. 2$"
	lblq1choice2 db "b. 3$"

	; question 2
	lblheadquestion2 db "QUESTION 2$"
	lblquestion2 db "How many towers are in the Twin Towers?$"
	lblq2choice1 db "a. 2$"
	lblq2choice2 db "b. 3$"

	; question 3
	lblheadquestion3 db "QUESTION 3$"
	lblquestion3 db "How many bits are in a nibble?$"
	lblq3choice1 db "a. 4$"
	lblq3choice2 db "b. 8$"

	; answer handler
	lblenteranswer db "Enter answer: $"
	lblcorrect db "Correct!$"
	lblwrong db "Wrong!$"
	lblenteranykey db "Enter any key to continue.$"

	; tryagain
	lblplayagain db "DO YOU WANT TO PLAY AGAIN? [Y/N]: $"
	playagain db "$"
	playagainseparator db "The quick brown fox jumps over the lazy dog near the bank of the river$"

	answer db "$"
	answerseparator db "The quick brown fox jumps over the lazy dog near the bank of the river$"

	lblcongratulations db "CONGRATULATIONS$"

	score db 0

.code
start:
	mov ax, @data
	mov ds, ax

	; initialize
	mov score, 30h

	; paint
		; header green
		mov ax, 0600h
		mov bh, 20h
		mov cx, 0000h
		mov dx, 024fh
		int 10h

		;  body red
		mov ax, 0600h
		mov bh, 40h
		mov cx, 0300h
		mov dx, 184fh
		int 10h

		; textbox for entername
		mov ax, 0600h
		mov bh, 70h
		mov cx, 0527h
		mov dx, 053fh
		int 10h

	; move cursor for main
	mov ah, 02h
	mov bh, 00
	mov dx, 0112h
	int 10h

	; print lblwelcomemain
	mov ah, 09h
	lea dx, lblwelcomemain
	int 21h

enternameagain:
	; move cursor for lblentername
	mov ah, 02h
	mov bh, 00
	mov dx, 050fh
	int 10h

	; print lblentername
	mov ah, 09h
	lea dx, lblentername
	int 21h

	; accept playername
	lea si, playername

acceptplayername:
	mov ah, 01h
	int 21h

	cmp al, 13
	je stopplayername

	mov [si], al
	inc si
	jmp acceptplayername

stopplayername:
	mov al, 36
	mov [si], al
	
	; check if name is empty
		cmp playername, 36
		je enternameagain
		jmp startgame

startgame:
	; alter header
		; repaint welcomemain
		mov ax, 0600h
		mov bh, 20h
		mov cx, 0000h
		mov dx, 024fh
		int 10h

		; move cursor for lblmain
		mov ah, 02h
		mov bh, 00
		mov dx, 011ah
		int 10h

		; print lblmain
		mov ah, 09h
		lea dx, lblmain
		int 21h

	; alter body
		; paint white for playername
		mov ax, 0600h
		mov bh, 70h
		mov cx, 0300h
		mov dx, 034fh
		int 10h

		; paint Question header background red
		mov ax, 0600h
		mov bh, 40h
		mov cx, 0400h
		mov dx, 044fh
		int 10h

		; repaint mainbody bluebg whitefg
		mov ax, 0600h
		mov bh, 17h
		mov cx, 0500h
		mov dx, 184fh
		int 10h


		; move cursor for lblplayername
		mov ah, 02h
		mov bh, 00
		mov dx, 0300h
		int 10h

		; print lblplayername
		mov ah, 09h
		lea dx, lblplayername
		int 21h

		; print playername
		mov ah, 09h
		lea dx, playername
		int 21h

		; move cursor for lblmoneylevel
		mov ah, 02h
		mov bh, 00
		mov dx, 043bh
		int 10h

		; print lblmoneylevel
		mov ah, 09h
		lea dx, lblmoneylevel
		int 21h

		; money stuff
			; paint money group
			mov ax, 0600h
			mov bh, 67h
			mov cx, 053bh
			mov dx, 084fh
			int 10h

			; move cursor for lblfirstprize
			mov ah, 02h
			mov bh, 00
			mov dx, 0641h
			int 10h

			; print lblfirstprize
			mov ah, 09h
			lea dx, lblfirstprize
			int 21h

			; move cursor for lblsecondprize
			mov ah, 02h
			mov bh, 00
			mov dx, 0742h
			int 10h

			; print lblsecondprize
			mov ah, 09h
			lea dx, lblsecondprize
			int 21h

			; move cursor for lblthirdprize
			mov ah, 02h
			mov bh, 00
			mov dx, 0842h
			int 10h

			; print lblthirdprize
			mov ah, 09h
			lea dx, lblthirdprize
			int 21h

			; move cursor for lblzeroprize
			mov ah, 02h
			mov bh, 00
			mov dx, 0943h
			int 10h

			; print lblzeroprize
			mov ah, 09h
			lea dx, lblzeroprize
			int 21h
	q1:
		; Question 1 
			; header
			; move cursor for lblheadquestion1
			mov ah, 02h
			mov bh, 00
			mov dx, 0400h
			int 10h

			; print lblheadquestion1
			mov ah, 09h
			lea dx, lblheadquestion1
			int 21h

			; Question 1
			; move cursor for lblquestion1
			mov ah, 02h
			mov bh, 00
			mov dx, 0500h
			int 10h

			; print lblquestion1
			mov ah, 09h
			lea dx, lblquestion1
			int 21h

			; choices
				; move cursor for lblq1choice1
				mov ah, 02h
				mov bh, 00
				mov dx, 0604h
				int 10h

				; print lblq1choice1
				mov ah, 09h
				lea dx, lblq1choice1
				int 21h

				; move cursor for lblq1choice2
				mov ah, 02h
				mov bh, 00
				mov dx, 0704h
				int 10h

				; print lblq1choice2
				mov ah, 09h
				lea dx, lblq1choice2
				int 21h

			; answer handler
				; move cursor for lblenteranswer
				mov ah, 02h
				mov bh, 00
				mov dx, 0800h
				int 10h

				; print lblenteranswer
				mov ah, 09h
				lea dx, lblenteranswer
				int 21h

				; accept answer
				lea si, answer

				q1acceptanswer:
					mov ah, 01h
					int 21h

					cmp al, 13
					je q1stopanswer

					mov [si], al
					inc si
					jmp q1acceptanswer

				q1stopanswer:
					mov al, 36
					mov [si], al

				; check if correct
				cmp answer, 62h
				je q1correct
				cmp answer, 42h
				je q1correct
				jmp q1wrong

				q1correct:
				add score, 31h
				; increase money level
					; shade blue least prize
					mov ax, 0600h
					mov bh, 17h
					mov cx, 083bh
					mov dx, 084fh
					int 10h

					; shade yellow zeroprize
					mov ax, 0600h
					mov bh, 67h
					mov cx, 093bh
					mov dx, 094fh
					int 10h

					; move cursor for lblthirdprize
					mov ah, 02h
					mov bh, 00
					mov dx, 0842h
					int 10h

					; print lblthirdprize
					mov ah, 09h
					lea dx, lblthirdprize
					int 21h

					; move cursor for lblzeroprize
					mov ah, 02h
					mov bh, 00
					mov dx, 0943h
					int 10h

					; print lblzeroprize
					mov ah, 09h
					lea dx, lblzeroprize
					int 21h

					; move cursor for lblcorrect
					mov ah, 02h
					mov bh, 00
					mov dx, 0900h
					int 10h

					; print lblcorrect
					mov ah, 09h
					lea dx, lblcorrect
					int 21h

					q1enteranykey:
					; move cursor for lblenteranykey
					mov ah, 02h
					mov bh, 00
					mov dx, 0a00h
					int 10h

					; print lblenteranykey
					mov ah, 09h
					lea dx, lblenteranykey
					int 21h

					; wait for input
					mov ah, 01h
					int 21h
					jmp q2

				q1wrong:
				; move cursor for lblwrong
				mov ah, 02h
				mov bh, 00
				mov dx, 0900h
				int 10h

				; print lblwrong
				mov ah, 09h
				lea dx, lblwrong
				int 21h

				jmp q1enteranykey

	q2:
		; repaint main body
		mov ax, 0600h
		mov bh, 17h
		mov cx, 0500h
		mov dx, 183ah
		int 10h

		; Question 2
			; overwrite header
			; move cursor to line 4
			mov ah, 02h
			mov bh, 00
			mov dx, 0400h
			int 10h

			; print lblheadquestion2
			mov ah, 09h
			lea dx, lblheadquestion2
			int 21h

			; move cursor for lblquestion2
			mov ah, 02h
			mov bh, 00
			mov dx, 0500h
			int 10h

			; print lblquestion2
			mov ah, 09h
			lea dx, lblquestion2
			int 21h

			; choices
				; move cursor for lblq2choice1
				mov ah, 02h
				mov bh, 00
				mov dx, 0604h
				int 10h

				; print lblq2choice1
				mov ah, 09h
				lea dx, lblq2choice1
				int 21h

				; move cursor for lblq2choice2
				mov ah, 02h
				mov bh, 00
				mov dx, 0704h
				int 10h

				; print lblq2choice2
				mov ah, 09h
				lea dx, lblq2choice2
				int 21h

				; move cursor for lblenteranswer
				mov ah, 02h
				mov bh, 00
				mov dx, 0800h
				int 10h

				; print lblenteranswer
				mov ah, 09h
				lea dx, lblenteranswer
				int 21h

				; accept answer
				mov answer, 36
				lea si, answer

				q2acceptanswer:
					mov ah, 01h
					int 21h

					cmp al, 13
					je q2stopanswer

					mov [si], al
					inc si
					jmp q2acceptanswer

				q2stopanswer:
					mov al, 36
					mov [si], al

				; check if correct
				cmp answer, 61h
				je q2correct
				cmp answer, 41h
				je q2correct
				jmp q2wrong

				q2correct:
				mov al, score
				add al, 1
				mov score, al

				; shade yellow all money levels
				mov ax, 0600h
				mov bh, 67h
				mov cx, 053bh
				mov dx, 094fh
				int 10h

				; check score
				cmp score, 31h
				jne q2score2
				jmp q2score1

				q2score1:
				; shade blue least prize
				mov ax, 0600h
				mov bh, 17h
				mov cx, 083bh
				mov dx, 084fh
				int 10h

				jmp q2correctcontinue

				q2score2:
				; shade blue second prize
				mov ax, 0600h
				mov bh, 17h
				mov cx, 073bh
				mov dx, 074fh
				int 10h

				jmp q2correctcontinue

				q2correctcontinue:
				; move cursor for lblfirstprize
				mov ah, 02h
				mov bh, 00
				mov dx, 0641h
				int 10h

				; print lblfirstprize
				mov ah, 09h
				lea dx, lblfirstprize
				int 21h

				; move cursor for lblsecondprize
				mov ah, 02h
				mov bh, 00
				mov dx, 0742h
				int 10h

				; print lblsecondprize
				mov ah, 09h
				lea dx, lblsecondprize
				int 21h

				; move cursor for lblthirdprize
				mov ah, 02h
				mov bh, 00
				mov dx, 0842h
				int 10h

				; print lblthirdprize
				mov ah, 09h
				lea dx, lblthirdprize
				int 21h

				; move cursor for lblzeroprize
				mov ah, 02h
				mov bh, 00
				mov dx, 0943h
				int 10h

				; print lblzeroprize
				mov ah, 09h
				lea dx, lblzeroprize
				int 21h

				; move cursor for lblcorrect
				mov ah, 02h
				mov bh, 00
				mov dx, 0900h
				int 10h

				; print lblcorrect
				mov ah, 09h
				lea dx, lblcorrect
				int 21h

				q2enteranykey:
				; move cursor for lblenteranykey
				mov ah, 02h
				mov bh, 00
				mov dx, 0a00h
				int 10h

				; print lblenteranykey
				mov ah, 09h
				lea dx, lblenteranykey
				int 21h

				; wait for input
				mov ah, 01h
				int 21h
				jmp q3

				q2wrong:
				; move cursor for lblwrong
				mov ah, 02h
				mov bh, 00
				mov dx, 0900h
				int 10h

				; print lblwrong
				mov ah, 09h
				lea dx, lblwrong
				int 21h

				jmp q2enteranykey

	q3:
		; repaint main body
		mov ax, 0600h
		mov bh, 17h
		mov cx, 0500h
		mov dx, 183ah
		int 10h

		; Question 3
			; overwrite header at line 4 - move
			mov ah, 02h
			mov bh, 00
			mov dx, 0400h
			int 10h

			; print lblheadquestion3
			mov ah, 09h
			lea dx, lblheadquestion3
			int 21h

			; move cursor for lblquestion3
			mov ah, 02h
			mov bh, 00
			mov dx, 0500h
			int 10h

			; print lblquestion3
			mov ah, 09h
			lea dx, lblquestion3
			int 21h
			; choices
				; move cursor for lblq3choice1
				mov ah, 02h
				mov bh, 00
				mov dx, 0604h
				int 10h

				; print lblq3choice1
				mov ah, 09h
				lea dx, lblq3choice1
				int 21h

				; move cursor for lblq3choice2
				mov ah, 02h
				mov bh, 00
				mov dx, 0704h
				int 10h

				; print lblq3choice2
				mov ah, 09h
				lea dx, lblq3choice2
				int 21h

			; answer
				; move cursor for lblenteranswer
				mov ah, 02h
				mov bh, 00
				mov dx, 0800h
				int 10h

				; print lblenteranswer
				mov ah, 09h
				lea dx, lblenteranswer
				int 21h

				; accept answer
				mov answer, 36
				lea si, answer

				q3acceptanswer:
					mov ah, 01h
					int 21h

					cmp al, 13
					je q3stopanswer

					mov [si], al
					inc si
					jmp q3acceptanswer

				q3stopanswer:
					mov al, 36
					mov [si], al

				; check if correct
				cmp answer, 61h
				je q3correct
				cmp answer, 41h
				je q3correct
				jmp q3wrong

				q3correct:
					mov al, score
					add al, 1
					mov score, al

					; move cursor for lblcorrect
					mov ah, 02h
					mov bh, 00
					mov dx, 0900h
					int 10h

					; print lblcorrect
					mov ah, 09h
					lea dx, lblcorrect
					int 21h

					; shade all money stuff yellow
					mov ax, 0600h
					mov bh, 67h
					mov cx, 053bh
					mov dx, 094fh
					int 10h

					; initialize color code
					mov ax, 0600h
					mov bh, 17h
					
					; check score
					cmp score, 31h
					je q3score1
					cmp score, 32h
					je q3score2
					jmp q3score3

					q3score1:
						; shade least prize blue
						mov cx, 083bh
						mov dx, 084fh

						jmp q3continue

					q3score2:
						; shade second prize blue
						mov cx, 073bh
						mov dx, 074fh
						int 10h

						jmp q3continue

					q3score3:
						; shade first prize blue
						mov cx, 063bh
						mov dx, 064fh
						int 10h
						
						; prepare cells for congratulations
						mov ax, 0600h
						mov bh, 64h
						mov cx, 053bh
						mov dx, 054fh
						int 10h

						; move cursor for lblcongratulations
						mov ah, 02h
						mov bh, 00
						mov dx, 053eh
						int 10h

						; print lblcongratulations
						mov ah, 09h
						lea dx, lblcongratulations
						int 21h

						jmp q3enteranykey

					q3continue:
						; terminate color code
						int 10h

					q3enteranykey:
						; move cursor for lblfirstprize
						mov ah, 02h
						mov bh, 00
						mov dx, 0641h
						int 10h

						; print lblfirstprize
						mov ah, 09h
						lea dx, lblfirstprize
						int 21h

						; move cursor for lblsecondprize
						mov ah, 02h
						mov bh, 00
						mov dx, 0742h
						int 10h

						; print lblsecondprize
						mov ah, 09h
						lea dx, lblsecondprize
						int 21h

						; move cursor for lblthirdprize
						mov ah, 02h
						mov bh, 00
						mov dx, 0842h
						int 10h

						; print lblthirdprize
						mov ah, 09h
						lea dx, lblthirdprize
						int 21h

						; move cursor for lblzeroprize
						mov ah, 02h
						mov bh, 00
						mov dx, 0943h
						int 10h

						; print lblzeroprize
						mov ah, 09h
						lea dx, lblzeroprize
						int 21h

						; move cursor for lblenteranykey
						mov ah, 02h
						mov bh, 00
						mov dx, 0a00h
						int 10h

						; print lblenteranykey
						mov ah, 09h
						lea dx, lblenteranykey
						int 21h

						; wait for input
						mov ah, 01h
						int 21h
						jmp exit

				q3wrong:
					; move cursor for lblwrong
					mov ah, 02h
					mov bh, 00
					mov dx, 0900h
					int 10h

					; print lblwrong
					mov ah, 09h
					lea dx, lblwrong
					int 21h

					jmp q3enteranykey
exit:
	; header
		; repaint header
		mov ax, 0600h
		mov bh, 20h
		mov cx, 0000h
		mov dx, 024fh
		int 10h

		; move cursor for lblwelcomemain
		mov ah, 02h
		mov bh, 00
		mov dx, 0112h
		int 10h

		; print lblwelcomemain
		mov ah, 09h
		lea dx, lblwelcomemain
		int 21h

	; body
		; repaint body
		mov ax, 0600h
		mov bh, 40h
		mov cx, 0300h
		mov dx, 184fh
		int 10h

		; paint lblplayagain textbox
		mov ax, 0600h
		mov bh, 70h
		mov cx, 0537h
		mov dx, 053fh
		int 10h

		; move cursor for lblplayagain
		mov ah, 02h
		mov bh, 00
		mov dx, 0515h
		int 10h

		; print lblplayagain
		mov ah, 09h
		lea dx, lblplayagain
		int 21h

		; accept playagain
		mov playagain, 36
		lea si, playagain

		acceptplayagain:
			mov ah, 01h
			int 21h

			cmp al, 13
			je stopplayagain

			mov [si], al
			inc si
			jmp acceptplayagain

		stopplayagain:
			mov al, 36
			mov [si], al

		cmp playagain, 59h
		jne compare2
		jmp start

	compare2:
		cmp playagain, 79h
		jne superexit
		jmp start
		
superexit:
	; terminate
	mov ah, 4ch
	int 21h
end start