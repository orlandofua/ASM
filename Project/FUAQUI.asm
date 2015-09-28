.MODEL SMALL
.STACK
.DATA
	lblpressenter db "Press enter to start$"
	lblplayer1ready db "Player 1 ready?$"
	lblplayer2ready db "Player 2 ready?$"
	lblplayer1 db "Player 1$"
	lblplayer2 db "Player 2$"
	lblchooseacup db "Choose a cup:$"
	lblcup1 db "Cup A$"
	lblcup2 db "Cup B$"
	lblcup3 db "Cup C$"
	lblnote1 db "Note: What you choose here is the correct cup.$", 255 dup(?)
	lblnote2 db "Player 1 will need to guess what cup you chose.$", 255 dup(?)

	correctcup db ?, 255 dup(?)
	p1cup db ?, 255 dup(?)
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

	; move cursor for lblplayer2ready
		mov ah, 02h
		mov bh, 00
		mov dx, 0b20h
		int 10h

	; print lblplayer2ready
		mov ah, 09h
		lea dx, lblplayer2ready
		int 21h

	; move cursor for lblpressenter
		mov ah, 02h
		mov bh, 00
		mov dx, 0c1eh
		int 10h

	; print lblpressenter
		mov ah, 09h
		lea dx, lblpressenter
		int 21h

	; wait for enter key
	acceptenterkey:
		mov ah, 01h
		int 21h

		cmp al, 13
		je enterkeypressed
		jmp acceptenterkey

	enterkeypressed:
	; paint whole screen black
		mov ax, 0600h
		mov bh, 07h
		mov cx, 0000h
		mov dx, 184fh
		int 10h

	; move cursor for lblplayer2
		mov ah, 02h
		mov bh, 00
		mov dx, 0223h
		int 10h

	; print lblplayer2
		mov ah, 09h
		lea dx, lblplayer2
		int 21h

	; move cursor for lblchooseacup
		mov ah, 02h
		mov bh, 00
		mov dx, 0321h
		int 10h

	; print lblchooseacup
		mov ah, 09h
		lea dx, lblchooseacup
		int 21h

	; NOTE STUFF HERE
		; highlight notestuff
			mov ax, 0600h
			mov bh, 60h
			mov cx, 130fh
			mov dx, 1645h
			int 10h

		; move cursor for lblnote1
			mov ah, 02h
			mov bh, 00h
			mov dx, 1410h
			int 10h

		; print lblnote1
			mov ah, 09h
			lea dx, lblnote1
			int 21h

		; move cursor for lblnote2
			mov ah, 02h
			mov bh, 00
			mov dx, 1516h
			int 10h

		; print lblnote2
			mov ah, 09h
			lea dx, lblnote2
			int 21h


	; END NOTE STUFF

	; print left cup
		mov ax, 0600h
		mov bh, 44h
		mov cx, 0e01h
		mov dx, 0e0eh
		int 10h

		mov ax, 0600h
		mov bh, 44h
		mov cx, 0d02h
		mov dx, 0d0dh
		int 10h

		mov ax, 0600h
		mov bh, 44h
		mov cx, 0c03h
		mov dx, 0c0ch
		int 10h

		mov ax, 0600h
		mov bh, 44h
		mov cx, 0b04h
		mov dx, 0b0bh
		int 10h

		mov ax, 0600h
		mov bh, 44h
		mov cx, 0a05h
		mov dx, 0a0ah
		int 10h

		mov ax, 0600h
		mov bh, 44h
		mov cx, 0906h
		mov dx, 0909h
		int 10h

		mov ax, 0600h
		mov bh, 44h
		mov cx, 0807h
		mov dx, 0808h
		int 10h

	; end left cup

	; print middle cup
		mov ax, 0600h
		mov bh, 11h
		mov cx, 0826h
		mov dx, 0827h
		int 10h

		mov ax, 0600h
		mov bh, 11h
		mov cx, 0925h
		mov dx, 0928h
		int 10h

		mov ax, 0600h
		mov bh, 11h
		mov cx, 0a24h
		mov dx, 0a29h
		int 10h

		mov ax, 0600h
		mov bh, 11h
		mov cx, 0b23h
		mov dx, 0b2ah
		int 10h

		mov ax, 0600h
		mov bh, 11h
		mov cx, 0c22h
		mov dx, 0c2bh
		int 10h

		mov ax, 0600h
		mov bh, 11h
		mov cx, 0d21h
		mov dx, 0d2ch
		int 10h

		mov ax, 0600h
		mov bh, 11h
		mov cx, 0e20h
		mov dx, 0e2dh
		int 10h

	; end middle cup

	; print right cup
		mov ax, 0600h
		mov bh, 22h
		mov cx, 0846h
		mov dx, 0847h
		int 10h

		mov ax, 0600h
		mov bh, 22h
		mov cx, 0945h
		mov dx, 0948h
		int 10h

		mov ax, 0600h
		mov bh, 22h
		mov cx, 0a44h
		mov dx, 0a49h
		int 10h

		mov ax, 0600h
		mov bh, 22h
		mov cx, 0b43h
		mov dx, 0b4ah
		int 10h

		mov ax, 0600h
		mov bh, 22h
		mov cx, 0c42h
		mov dx, 0c4bh
		int 10h

		mov ax, 0600h
		mov bh, 22h
		mov cx, 0d41h
		mov dx, 0d4ch
		int 10h

		mov ax, 0600h
		mov bh, 22h
		mov cx, 0e40h
		mov dx, 0e4dh
		int 10h

	; end right cup

	; LABELS BOIS
		highlblcup1:
		; highlight lblcup1
			mov ax, 0600h
			mov bh, 70h
			mov cx, 1103h
			mov dx, 110bh
			int 10h

		; reset lblcup2
			mov ax, 0600h
			mov bh, 07h
			mov cx, 1123h
			mov dx, 112bh
			int 10h

		; reset lblcup3
			mov ax, 0600h
			mov bh, 07h
			mov cx, 1143h
			mov dx, 114bh
			int 10h

		; move cursor for lblcup1
			mov ah, 02h
			mov bh, 00
			mov dx, 1105h
			int 10h

		; print lblcup1
			mov ah, 09h
			lea dx, lblcup1
			int 21h

		; move cursor for lblcup2
			mov ah, 02h
			mov bh, 00
			mov dx, 1125h
			int 10h

		; print lblcup2
			mov ah, 09h
			lea dx, lblcup2
			int 21h

		; move cursor for lblcup3
			mov ah, 02h
			mov bh, 00
			mov dx, 1145h
			int 10h

		; print lblcup3
			mov ah, 09h
			lea dx, lblcup3
			int 21h

		; wait for input
			mov ah, 01h
			int 21h

			; check if enter key is pressed
			cmp al, 13
			jne notenter1
			jmp p2entercup1

			notenter1:

			; check if input is 'd'
			cmp al, 64h
			je highlblcup2
			jmp highlblcup1			

		highlblcup2:
		; highlight lblcup2
			mov ax, 0600h
			mov bh, 70h
			mov cx, 1123h
			mov dx, 112bh
			int 10h

		; reset lblcup1
			mov ax, 0600h
			mov bh, 07h
			mov cx, 1103h
			mov dx, 110bh
			int 10h

		; reset lblcup3
			mov ax, 0600h
			mov bh, 07h
			mov cx, 1143h
			mov dx, 114bh
			int 10h

		; move cursor for lblcup1
			mov ah, 02h
			mov bh, 00
			mov dx, 1105h
			int 10h

		; print lblcup1
			mov ah, 09h
			lea dx, lblcup1
			int 21h

		; move cursor for lblcup2
			mov ah, 02h
			mov bh, 00
			mov dx, 1125h
			int 10h

		; print lblcup2
			mov ah, 09h
			lea dx, lblcup2
			int 21h

		; move cursor for lblcup3
			mov ah, 02h
			mov bh, 00
			mov dx, 1145h
			int 10h

		; print lblcup3
			mov ah, 09h
			lea dx, lblcup3
			int 21h

		; wait for input
			mov ah, 01h
			int 21h

			; check if enter key is pressed
			cmp al, 13
			jne notenter2
			jmp p2entercup2

			notenter2:

			; check if input is 'd'
			cmp al, 64h
			je highlblcup3

			; check if input is 'a'
			cmp al, 61h
			jne highlblcup2
			jmp highlblcup1

		highlblcup3:
		; highlight lblcup3
			mov ax, 0600h
			mov bh, 70h
			mov cx, 1143h
			mov dx, 114bh
			int 10h

		; reset lblcup1
			mov ax, 0600h
			mov bh, 07h
			mov cx, 1103h
			mov dx, 110bh
			int 10h

		; reset lblcup2
			mov ax, 0600h
			mov bh, 07h
			mov cx, 1123h
			mov dx, 112bh
			int 10h

		; move cursor for lblcup1
			mov ah, 02h
			mov bh, 00
			mov dx, 1105h
			int 10h

		; print lblcup1
			mov ah, 09h
			lea dx, lblcup1
			int 21h

		; move cursor for lblcup2
			mov ah, 02h
			mov bh, 00
			mov dx, 1125h
			int 10h

		; print lblcup2
			mov ah, 09h
			lea dx, lblcup2
			int 21h

		; move cursor for lblcup3
			mov ah, 02h
			mov bh, 00
			mov dx, 1145h
			int 10h

		; print lblcup3
			mov ah, 09h
			lea dx, lblcup3
			int 21h

		; wait for input
			mov ah, 01h
			int 21h			

			; check if enter key is pressed
			cmp al, 13
			jne notenter3
			jmp p2entercup3

			notenter3:
			
			; check if input is 'd'
			cmp al, 64h
			je highlblcup3

			; check if input is 'a'
			cmp al, 61h
			jne highlblcup3
			jmp highlblcup2

		p2entercup1:
			; define correct cup
				mov al, 31h
				mov correctcup, al
				jmp continuep1

		p2entercup2:
			; define correct cup
				mov al, 32h
				mov correctcup, al
				jmp continuep1

		p2entercup3:
			; define correctcup
				mov al, 33h
				mov correctcup, al
				jmp continuep1

		continuep1:

			; paint whole screen black
				mov ax, 0600h
				mov bh, 07h
				mov cx, 0000h
				mov dx, 184fh
				int 10h

			; move cursor for lblplayer1ready
				mov ah, 02h
				mov bh, 00
				mov dx, 0b20h
				int 10h

			; print lblplayer1ready
				mov ah, 09h
				lea dx, lblplayer1ready
				int 21h

			; move cursor for lblpressenter
				mov ah, 02h
				mov bh, 00
				mov dx, 0c1eh
				int 10h

			; print lblpressenter
				mov ah, 09h
				lea dx, lblpressenter
				int 21h

			; wait for enter
			p1cup1wait:
				mov ah, 01h
				int 21h

				cmp al, 13
				je p1cup1enterpressed
				jmp p1cup1wait

			p1cup1enterpressed:
				; paint whole screen black
					mov ax, 0600h
					mov bh, 07h
					mov cx, 0000h
					mov dx, 184fh
					int 10h

				; move cursor for lblplayer1
					mov ah, 02h
					mov bh, 00
					mov dx, 0223h
					int 10h

				; print lblplayer1
					mov ah, 09h
					lea dx, lblplayer1
					int 21h

				; move cursor for lblchooseacup
					mov ah, 02h
					mov bh, 00
					mov dx, 0321h
					int 10h

				; print lblchooseacup
					mov ah, 09h
					lea dx, lblchooseacup
					int 21h

				; print left cup
					mov ax, 0600h
					mov bh, 44h
					mov cx, 0e01h
					mov dx, 0e0eh
					int 10h

					mov ax, 0600h
					mov bh, 44h
					mov cx, 0d02h
					mov dx, 0d0dh
					int 10h

					mov ax, 0600h
					mov bh, 44h
					mov cx, 0c03h
					mov dx, 0c0ch
					int 10h

					mov ax, 0600h
					mov bh, 44h
					mov cx, 0b04h
					mov dx, 0b0bh
					int 10h

					mov ax, 0600h
					mov bh, 44h
					mov cx, 0a05h
					mov dx, 0a0ah
					int 10h

					mov ax, 0600h
					mov bh, 44h
					mov cx, 0906h
					mov dx, 0909h
					int 10h

					mov ax, 0600h
					mov bh, 44h
					mov cx, 0807h
					mov dx, 0808h
					int 10h

				; end left cup

				; print middle cup
					mov ax, 0600h
					mov bh, 11h
					mov cx, 0826h
					mov dx, 0827h
					int 10h

					mov ax, 0600h
					mov bh, 11h
					mov cx, 0925h
					mov dx, 0928h
					int 10h

					mov ax, 0600h
					mov bh, 11h
					mov cx, 0a24h
					mov dx, 0a29h
					int 10h

					mov ax, 0600h
					mov bh, 11h
					mov cx, 0b23h
					mov dx, 0b2ah
					int 10h

					mov ax, 0600h
					mov bh, 11h
					mov cx, 0c22h
					mov dx, 0c2bh
					int 10h

					mov ax, 0600h
					mov bh, 11h
					mov cx, 0d21h
					mov dx, 0d2ch
					int 10h

					mov ax, 0600h
					mov bh, 11h
					mov cx, 0e20h
					mov dx, 0e2dh
					int 10h

				; end middle cup

				; print right cup
					mov ax, 0600h
					mov bh, 22h
					mov cx, 0846h
					mov dx, 0847h
					int 10h

					mov ax, 0600h
					mov bh, 22h
					mov cx, 0945h
					mov dx, 0948h
					int 10h

					mov ax, 0600h
					mov bh, 22h
					mov cx, 0a44h
					mov dx, 0a49h
					int 10h

					mov ax, 0600h
					mov bh, 22h
					mov cx, 0b43h
					mov dx, 0b4ah
					int 10h

					mov ax, 0600h
					mov bh, 22h
					mov cx, 0c42h
					mov dx, 0c4bh
					int 10h

					mov ax, 0600h
					mov bh, 22h
					mov cx, 0d41h
					mov dx, 0d4ch
					int 10h

					mov ax, 0600h
					mov bh, 22h
					mov cx, 0e40h
					mov dx, 0e4dh
					int 10h

				; end right cup
				p1highlblcup1:
				; highlight lblcup1
					mov ax, 0600h
					mov bh, 70h
					mov cx, 1103h
					mov dx, 110bh
					int 10h

				; reset lblcup2
					mov ax, 0600h
					mov bh, 07h
					mov cx, 1123h
					mov dx, 112bh
					int 10h

				; reset lblcup3
					mov ax, 0600h
					mov bh, 07h
					mov cx, 1143h
					mov dx, 114bh
					int 10h

				; move cursor for lblcup1
					mov ah, 02h
					mov bh, 00
					mov dx, 1105h
					int 10h

				; print lblcup1
					mov ah, 09h
					lea dx, lblcup1
					int 21h

				; move cursor for lblcup2
					mov ah, 02h
					mov bh, 00
					mov dx, 1125h
					int 10h

				; print lblcup2
					mov ah, 09h
					lea dx, lblcup2
					int 21h

				; move cursor for lblcup3
					mov ah, 02h
					mov bh, 00
					mov dx, 1145h
					int 10h

				; print lblcup3
					mov ah, 09h
					lea dx, lblcup3
					int 21h

				; wait for input
					mov ah, 01h
					int 21h

				; check if enter key is pressed
					cmp al, 13
					jne p1h1notenter
					
					; if input == enterkey
						mov p1cup, al
						jmp checkanswer
				p1h1notenter:
				; check if input is 'd'
					cmp al, 64h
					je p1highlblcup2
					jmp p1highlblcup1

				p1highlblcup2:
					; highlight lblcup2
						mov ax, 0600h
						mov bh, 70h
						mov cx, 1123h
						mov dx, 112bh
						int 10h

					; reset lblcup1
						mov ax, 0600h
						mov bh, 07h
						mov cx, 1103h
						mov dx, 110bh
						int 10h

					; reset lblcup3
						mov ax, 0600h
						mov bh, 07h
						mov cx, 1143h
						mov dx, 114bh
						int 10h

					; move cursor for lblcup1
						mov ah, 02h
						mov bh, 00
						mov dx, 1105h
						int 10h

					; print lblcup1
						mov ah, 09h
						lea dx, lblcup1
						int 21h

					; move cursor for lblcup2
						mov ah, 02h
						mov bh, 00
						mov dx, 1125h
						int 10h

					; print lblcup2
						mov ah, 09h
						lea dx, lblcup2
						int 21h

					; move cursor for lblcup3
						mov ah, 02h
						mov bh, 00
						mov dx, 1145h
						int 10h

					; print lblcup3
						mov ah, 09h
						lea dx, lblcup3
						int 21h

					; wait for input
						mov ah, 01h
						int 21h

					; check if enter key is pressed
						cmp al, 13
						jne p1h2notenter

							; if enter key
							mov p1cup, al
							jmp checkanswer

					p1h2notenter:
						; check if input is 'd'
							cmp al, 64h
							je p1highlblcup3

						; check if input is 'a'
							cmp al, 61h
							jne p1highlblcup2
							jmp p1highlblcup1

				p1highlblcup3:
					; highlight lblcup3
						mov ax, 0600h
						mov bh, 70h
						mov cx, 1143h
						mov dx, 114bh
						int 10h

					; reset lblcup1
						mov ax, 0600h
						mov bh, 07h
						mov cx, 1103h
						mov dx, 110bh
						int 10h

					; reset lblcup2
						mov ax, 0600h
						mov bh, 07h
						mov cx, 1123h
						mov dx, 112bh
						int 10h

					; move cursor for lblcup1
						mov ah, 02h
						mov bh, 00
						mov dx, 1105h
						int 10h

					; print lblcup1
						mov ah, 09h
						lea dx, lblcup1
						int 21h

					; move cursor for lblcup2
						mov ah, 02h
						mov bh, 00
						mov dx, 1125h
						int 10h

					; print lblcup2
						mov ah, 09h
						lea dx, lblcup2
						int 21h

					; move cursor for lblcup3
						mov ah, 02h
						mov bh, 00
						mov dx, 1145h
						int 10h

					; print lblcup3
						mov ah, 09h
						lea dx, lblcup3
						int 21h

					; wait for input
						mov ah, 01h
						int 21h

					; check if enterkey is pressed
					cmp al, 13
					jne p1h3notenter

						; if enterkey
						mov p1cup, al
						jmp checkanswer
					
					p1h3notenter:

					; check if input is 'd'
						cmp al, 64h
						je p1highlblcup3

					; check if input is 'a'
						cmp al, 61h
						jne p1highlblcup3
						jmp p1highlblcup2

		checkanswer:
		
	SUPEREXIT:
	mov ah, 4ch
	int 21h
END START