.MODEL SMALL
.STACK
.DATA
	lblexaminee db "Examinee: $"
	examineename db "$"
	tryagain db "$"
	separatingvar db "The quick brown fox jumps over the lazy dog near the bank of the river.$"
	score db 0
	easyanswer1 db 0
	separatingvar1 db "The quick brown fox jumps over the lazy dog near the bank of the river.$"
	easyanswer2 db 0
	separatingvar2 db "The quick brown fox jumps over the lazy dog near the bank of the river.$"
	easyanswer3 db 0
	separatingvar3 db "The quick brown fox jumps over the lazy dog near the bank of the river.$"
	; choose between easy, medium, or hard
	lblchoice db "Please choose a category: $"
	lblchoiceeasy db "1. Easy$"
	lblchoicemedium db "2. Medium$"
	lblchoicehard db "3. Hard$"
	lbluserchoice db "Enter your choice: $"
	userchoice db "$"


	separatingvar4 db "The quick brown fox jumps over the lazy dog near the bank of the river.$"
	lblready db "Are you ready to take the quiz?[Y/N]: $"
	lblname db "Enter your name: $"
	lblanswer1 db "A. YES    B. NO$"
	lblanswer2 db "Enter the letter of your answer: $"
	lblnquestion1 db "QUESTION NO. 1$"
	lblnquestion2 db "QUESTION NO. 2$"
	lblnquestion3 db "QUESTION NO. 3$"
	lblquestion1 db "Assembly does not require a source code. $"
	lblquestion2 db "1 byte is equal to 8 bits. $"
	lblquestion3 db "10100 in binary is 20 in decimal. $"

	;REPORTS
	lblreport db "REPORT$"
	lblstars0 db "Result: 0 stars $"
	lblstars1 db "Result: 1 star $"
	lblstars2 db "Result: 2 stars $"
	lblstars3 db "Result: 3 stars $"
	lbltryagain db "Repeat the Quiz? N/Y: $"
	lblcorrect db "The answer is Correct!$"
	lblwrong db "The answer is Wrong!$"
	lblconfirm db "Press any key to continue.$"

	; medium
	lblmquestion1 db "Convert 14855 decimal to hexadecimal.$"
	lblmquestion2 db "28A70 hex + 90B6 hex = ? hex$"
	lblmquestion3 db "74A hex - 2EFH hex = ? hex$"
	lblmanswer db "Enter your answer in ALL CAPS: $"
	lblmanswer1 db "3A07H$"
	lblmanswer2 db "31B26$"
	lblmanswer3 db "45BH$"

	; hard
	; question 1
	lblhquestion10 db "A type of low-level language in which$"
	lblhquestion11 db "mnemonic abbreviations represent$"
	lblhquestion12 db "machine operations and storage$"
	lblhquestion13 db "operations.$"
	lblhanswer1 db "ASSEMBLY$"

	; question 2
	lblhquestion20 db "A program that translates low-level$"
	lblhquestion21 db "programs into machine language.$"
	lblhanswer2 db "ASSEMBLER$"

	; question 3
	lblhquestion30 db "This instruction is used to deviate$"
	lblhquestion31 db "the flow of a program without taking$"
	lblhquestion32 db "into account the actual conditions of$"
	lblhquestion33 db "the flags or of the data.$"
	lblhanswer3 db "JMP$"

	lblreadyanswer db "$"
	separatingvar5 db "The quick brown fox jumps over the lazy dog near the bank of the river.$"
	mediumanswer1 db "$"
	separatingvar6 db "The quick brown fox jumps over the lazy dog near the bank of the river.$"
	mediumanswer2 db "$"
	separatingvar7 db "The quick brown fox jumps over the lazy dog near the bank of the river.$"
	mediumanswer3 db "$"
	separatingvar8 db "The quick brown fox jumps over the lazy dog near the bank of the river.$"
	hardanswer1 db "$"
	separatingvar9 db "The quick brown fox jumps over the lazy dog near the bank of the river.$"
	hardanswer2 db "$"
	separatingvar10 db "The quick brown fox jumps over the lazy dog near the bank of the river.$"
	hardanswer3 db "$"
	separatingvar11 db "The quick brown fox jumps over the lazy dog near the bank of the river.$"
	
.CODE
START:
	MOV AX, @DATA
	MOV DS, AX

	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; MOVE CURSOR FOR LBLREADY
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C14H
	INT 10H

	; PRINT LBLREADY
	MOV AH, 09H
	LEA DX, LBLREADY
	INT 21H

	; ACCEPT CHAR
	LEA SI, LBLREADYANSWER

ACCEPTREADYANSWER:
	MOV AH, 01H
	INT 21H

	CMP AL, 13
	JE STOPREADYANSWER

	MOV [SI], AL
	INC SI
	JMP ACCEPTREADYANSWER

STOPREADYANSWER:
	MOV AL, 36
	MOV [SI], AL

	; COMPARE ANSWER IF YES/NO
	CMP LBLREADYANSWER, 59H
	JE INPUTNAME
	CMP LBLREADYANSWER, 79H
	JE INPUTNAME
	JMP SUPEREXIT

INPUTNAME:
	; MOVE CURSOR FOR LBLNAME
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1FH
	INT 10H

	; PRINT LBLNAME
	MOV AH, 09H
	LEA DX, LBLNAME
	INT 21H

	; ACCEPT CHAR
	LEA SI, examineename

ACCEPTNAME:
	MOV AH, 01H
	INT 21H

	CMP AL, 13
	JE STOPCHARNAME

	MOV [SI], AL
	INC SI
	JMP ACCEPTNAME

STOPCHARNAME:
	MOV AL, 36
	MOV [SI], AL
	JMP CATEGORY

CATEGORY:
	; CHOOSE CATEGORY
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR LBLEXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR LBLCHOICE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0715H
	INT 10H

	; PRINT LBLCHOICE
	MOV AH, 09H
	LEA DX, LBLCHOICE
	INT 21H

	; MOVE CURSOR FOR LBLCHOICEEASY
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0824H
	INT 10H

	; PRINT LBLCHOICEEASY
	MOV AH, 09H
	LEA DX, LBLCHOICEEASY
	INT 21H

	; MOVE CURSOR FOR LBLCHOICEMEDIUM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0924H
	INT 10H

	; PRINT LBLCHOICEMEDIUM
	MOV AH, 09H
	LEA DX, LBLCHOICEMEDIUM
	INT 21H

	; MOVE CURSOR FOR LBLCHOICEHARD
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0A24H
	INT 10H

	; PRINT LBLCHOICEHARD
	MOV AH, 09H
	LEA DX, LBLCHOICEHARD
	INT 21H

	; MOVE CURSOR FOR LBLUSERCHOICE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0B1EH
	INT 10H

	; PRINT LBLUSERCHOICE
	MOV AH, 09H
	LEA DX, LBLUSERCHOICE
	INT 21H

	; ACCEPT USERCHOICE
	LEA SI, USERCHOICE

ACCEPTUSERCHOICE:
	MOV AH, 01H
	INT 21H

	CMP AL, 13
	JE STOPUSERCHOICE

	MOV [SI], AL
	INC SI
	JMP ACCEPTUSERCHOICE

STOPUSERCHOICE:
	MOV AL, 36
	MOV [SI], AL

	CMP USERCHOICE, 31H
	JE EASYQ1
	JMP NOTEASY

EASYQ1:
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR EXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR NQUESTION1
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0614H
	INT 10H

	; PRINT NQUESTION1
	MOV AH, 09H
	LEA DX, LBLNQUESTION1
	INT 21H

	; MOVE CURSOR FOR QUESTION1
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0714H
	INT 10H

	; PRINT QUESTION1
	MOV AH, 09H
	LEA DX, LBLQUESTION1
	INT 21H

	; MOVE CURSOR FOR LBLANSWER1
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0920H
	INT 10H

	; PRINT LBLANSWER1
	MOV AH, 09H
	LEA DX, LBLANSWER1
	INT 21H

	; MOVE CURSOR FOR LBLANSWER2
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0B17H
	INT 10H

	; PRINT LBLANSWER2
	MOV AH, 09H
	LEA DX, LBLANSWER2
	INT 21H

	; ACCEPT CHAR
	LEA SI, EASYANSWER1

ACCEPTEASYQ1ANSWER:
	MOV AH, 01H
	INT 21H
	
	CMP AL, 13
	JE STOPEASYQ1ANSWER

	MOV [SI], AL
	INC SI
	JMP ACCEPTEASYQ1ANSWER

STOPEASYQ1ANSWER:
	MOV AL, 36
	MOV [SI], AL

	; DETERMINE IF CORRECT
	CMP EASYANSWER1, 42H
	JE EASYCORRECTQ1
	CMP EASYANSWER1, 62H
	JE EASYCORRECTQ1
	JMP EASYWRONGQ1

EASYCORRECTQ1:
	MOV SCORE, 0
	ADD SCORE, 1
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR EXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR CORRECT
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1CH
	INT 10H

	; PRINT CORRECT
	MOV AH, 09H
	LEA DX, lblcorrect
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP EASYQ2

EASYWRONGQ1:


	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR EXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR WRONG
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1DH
	INT 10H

	; PRINT WRONG
	MOV AH, 09H
	LEA DX, lblwrong
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP EASYQ2

EASYQ2:

	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR EXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR NQUESTION2
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0614H
	INT 10H

	; PRINT NQUESTION2
	MOV AH, 09H
	LEA DX, LBLNQUESTION2
	INT 21H

	; MOVE CURSOR FOR QUESTION2
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 071AH
	INT 10H

	; PRINT QUESTION2
	MOV AH, 09H
	LEA DX, LBLQUESTION2
	INT 21H

	; MOVE CURSOR FOR LBLANSWER1
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0920H
	INT 10H

	; PRINT LBLANSWER1
	MOV AH, 09H
	LEA DX, LBLANSWER1
	INT 21H

	; MOVE CURSOR FOR LBLANSWER2
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0B17H
	INT 10H

	; PRINT LBLANSWER2
	MOV AH, 09H
	LEA DX, LBLANSWER2
	INT 21H

	; ACCEPT CHAR
	LEA SI, EASYANSWER2

ACCEPTEASYQ2ANSWER:
	MOV AH, 01H
	INT 21H

	CMP AL, 13
	JE STOPEASYQ2ANSWER

	MOV [SI], AL
	INC SI
	JMP ACCEPTEASYQ2ANSWER

STOPEASYQ2ANSWER:
	MOV AL, 36
	MOV [SI], AL


	; CHECK IF CORRECT ANSWER
	CMP EASYANSWER2, 41H
	JE EASYCORRECTQ2
	CMP EASYANSWER2, 61H
	JE EASYCORRECTQ2
	JMP EASYWRONGQ2

EASYCORRECTQ2:

	ADD SCORE, 1
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR EXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR CORRECTQ2
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1CH
	INT 10H

	; PRINT CORRECTQ2
	MOV AH, 09H
	LEA DX, lblcorrect
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP EASYQ3

EASYWRONGQ2:


	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR EXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR WRONGQ2
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1DH
	INT 10H

	; PRINT WRONGQ2
	MOV AH, 09H
	LEA DX, lblwrong
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP EASYQ3

EASYQ3:


	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR EXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR NQUESTION3
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0614H
	INT 10H

	; PRINT NQUESTION3
	MOV AH, 09H
	LEA DX, LBLNQUESTION3
	INT 21H

	; MOVE CURSOR FOR QUESTION3
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0716H
	INT 10H

	; PRINT QUESTION3
	MOV AH, 09H
	LEA DX, LBLQUESTION3
	INT 21H

	; MOVE CURSOR FOR LBLANSWER1
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0920H
	INT 10H

	; PRINT LBLANSWER1
	MOV AH, 09H
	LEA DX, LBLANSWER1
	INT 21H

	; MOVE CURSOR FOR LBLANSWER2
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0B17H
	INT 10H

	; PRINT LBLANSWER2
	MOV AH, 09H
	LEA DX, LBLANSWER2
	INT 21H

	; ACCEPT CHAR
	LEA SI, EASYANSWER3

ACCEPTEASYQ3ANSWER:

	MOV AH, 01H
	INT 21H
	
	CMP AL, 13
	JE STOPEASYQ3ANSWER

	MOV [SI], AL
	INC SI
	JMP ACCEPTEASYQ3ANSWER

STOPEASYQ3ANSWER:
	MOV AL, 36
	MOV [SI], AL

	; DETERMINE IF CORRECTQ3
	CMP EASYANSWER3, 41H
	JE EASYCORRECTQ3
	CMP EASYANSWER3, 61H
	JE EASYCORRECTQ3
	JMP EASYWRONGQ3

EASYCORRECTQ3:

	ADD SCORE, 1
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR EXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR CORRECTQ3
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1CH
	INT 10H

	; PRINT CORRECTQ3
	MOV AH, 09H
	LEA DX, lblcorrect
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP STARS

EASYWRONGQ3:

	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR EXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR WRONGQ3
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1DH
	INT 10H

	; PRINT WRONGQ3
	MOV AH, 09H
	LEA DX, lblwrong
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP STARS

NOTEASY:
	CMP USERCHOICE, 32H
	JE MEDIUMQ1
	JMP NOTMEDIUM

MEDIUMQ1:

	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR EXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR LBLNQUESTION1
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0614H
	INT 10H

	; PRINT LBLNQUESTION1
	MOV AH, 09H
	LEA DX, LBLNQUESTION1
	INT 21H

	; MOVE CURSOR FOR LBLMQUESTION1
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0715H
	INT 10H

	; PRINT LBLMQUESTION1
	MOV AH, 09H
	LEA DX, LBLMQUESTION1
	INT 21H

	; MOVE CURSOR FOR LBLMANSWER
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0818H
	INT 10H

	; PRINT LBLMANSWER
	MOV AH, 09H
	LEA DX, LBLMANSWER
	INT 21H

	; ACCEPT INPUT
	LEA SI, MEDIUMANSWER1

ACCEPTMEDIUMQ1ANSWER:
	MOV AH, 01H
	INT 21H

	CMP AL, 13
	JE STOPMEDIUMQ1ANSWER

	MOV [SI], AL
	INC SI
	JMP ACCEPTMEDIUMQ1ANSWER

STOPMEDIUMQ1ANSWER:
	MOV AL, 36
	MOV [SI], AL

	; CHECK IF CORRECT ANSWER
	MOV AL, MEDIUMANSWER1
	CMP LBLMANSWER1, AL
	JE MEDIUMCORRECTQ1
	JMP MEDIUMWRONGQ1

MEDIUMCORRECTQ1:

	MOV SCORE, 0
	ADD SCORE, 1
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR EXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR CORRECT
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1CH
	INT 10H

	; PRINT CORRECT
	MOV AH, 09H
	LEA DX, LBLCORRECT
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP MEDIUMQ2

MEDIUMWRONGQ1:
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR EXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR WRONG
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1DH
	INT 10H

	; PRINT WRONG
	MOV AH, 09H
	LEA DX, lblwrong
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP MEDIUMQ2

MEDIUMQ2:
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR EXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR LBLNQUESTION2
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0613H
	INT 10H

	; PRINT LBLNQUESTION2
	MOV AH, 09H
	LEA DX, LBLNQUESTION2
	INT 21H

	; MOVE CURSOR FOR LBLMQUESTION2
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 071BH
	INT 10H

	; PRINT LBLMQUESTION2
	MOV AH, 09H
	LEA DX, LBLMQUESTION2
	INT 21H

	; MOVE CURSOR FOR LBLMANSWER
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0818H
	INT 10H

	; PRINT LBLMANSWER
	MOV AH, 09H
	LEA DX, LBLMANSWER
	INT 21H

	; ACCEPT INPUT
	LEA SI, MEDIUMANSWER2

ACCEPTMEDIUMQ2ANSWER:
	MOV AH, 01H
	INT 21H

	CMP AL, 13
	JE STOPMEDIUMQ2ANSWER

	MOV [SI], AL
	INC SI
	JMP ACCEPTMEDIUMQ2ANSWER

STOPMEDIUMQ2ANSWER:
	MOV AL, 36
	MOV [SI], AL

	; CHECK IF CORRECT ANSWER
	MOV AL, MEDIUMANSWER2
	CMP LBLMANSWER2, AL
	JE MEDIUMCORRECTQ2
	JMP MEDIUMWRONGQ2

MEDIUMCORRECTQ2:
	ADD SCORE, 1
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR LBLEXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR CORRECT
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1CH
	INT 10H

	; PRINT CORRECT
	MOV AH, 09H
	LEA DX, LBLCORRECT
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; ACCEPT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP MEDIUMQ3

MEDIUMWRONGQ2:
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR LBLEXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR WRONG
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1DH
	INT 10H

	; PRINT WRONG
	MOV AH, 09H
	LEA DX, LBLWRONG
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP MEDIUMQ3

MEDIUMQ3:
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR LBLEXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR LBLNQUESTION3
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0614H
	INT 10H

	; PRINT LBLNQUESTION3
	MOV AH, 09H
	LEA DX, LBLNQUESTION3
	INT 21H

	; MOVE CURSOR FOR LBLMQUESTION3
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 071AH
	INT 10H

	; PRINT LBLMQUESTION3
	MOV AH, 09H
	LEA DX, LBLMQUESTION3
	INT 21H

	; MOVE CURSOR FOR LBLMANSWER
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0818H
	INT 10H

	; PRINT LBLANSWER
	MOV AH, 09H
	LEA DX, LBLMANSWER
	INT 21H

	; ACCEPT INPUT
	LEA SI, MEDIUMANSWER3

ACCEPTMEDIUMQ3ANSWER:
	MOV AH, 01H
	INT 21H

	CMP AL, 13
	JE STOPMEDIUMQ3ANSWER

	MOV [SI], AL
	INC SI
	JMP ACCEPTMEDIUMQ3ANSWER

STOPMEDIUMQ3ANSWER:
	MOV AL, 36
	MOV [SI], AL

	; CHECK IF CORRECT
	MOV AL, MEDIUMANSWER3
	CMP LBLMANSWER3, AL
	JE MEDIUMCORRECTQ3
	JMP MEDIUMWRONGQ3

MEDIUMCORRECTQ3:
	ADD SCORE, 1
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR EXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR CORRECT
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1CH
	INT 10H

	; PRINT CORRECT
	MOV AH, 09H
	LEA DX, LBLCORRECT
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP STARS

MEDIUMWRONGQ3:
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR EXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR WRONG
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1DH
	INT 10H

	; PRINT WRONG
	MOV AH, 09H
	LEA DX, lblwrong
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP STARS

NOTMEDIUM:
	CMP USERCHOICE, 33H
	JE HARDQ1
	JMP CATEGORY

HARDQ1:
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR LBLEXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR LBLNQUESTION1
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0614H
	INT 10H

	; PRINT LBLNQUESTION1
	MOV AH, 09H
	LEA DX, LBLNQUESTION1
	INT 21H

	; MOVE CURSOR FOR LBLHQUESTION10
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0715H
	INT 10H
	
	; PRINT LBLHQUESTION10
	MOV AH, 09H
	LEA DX, LBLHQUESTION10
	INT 21H
	
	; MOVE CURSOR FOR LBLHQUESTION11
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0817H
	INT 10H
	
	; PRINT LBLHQUESTION11
	MOV AH, 09H
	LEA DX, LBLHQUESTION11
	INT 21H
	
	; MOVE CURSOR FOR LBLHQUESTION12
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0918H
	INT 10H
	
	; PRINT LBLHQUESTION12
	MOV AH, 09H
	LEA DX, LBLHQUESTION12
	INT 21H
	
	; MOVE CURSOR FOR LBLHQUESTION13
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0A22H
	INT 10H

	; PRINT LBLHQUESTION13
	MOV AH, 09H
	LEA DX, LBLHQUESTION13
	INT 21H

	; MOVE CURSOR FOR LBLMANSWER
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0B14H
	INT 10H
	
	; PRINT LBLMANSWER
	MOV AH, 09H
	LEA DX, LBLMANSWER
	INT 21H
	
	; ACCEPT ANSWER
	LEA SI, HARDANSWER1

ACCEPTHARDQ1ANSWER:
	MOV AH, 01H
	INT 21H

	CMP AL, 13
	JE STOPHARDQ1ANSWER

	MOV [SI], AL
	INC SI
	JMP ACCEPTHARDQ1ANSWER

STOPHARDQ1ANSWER:
	MOV AL, 36
	MOV [SI], AL

	; CHECK IF CORRECT
	MOV AL, HARDANSWER1
	CMP LBLHANSWER1, AL
	JE HARDCORRECTQ1
	JMP HARDWRONGQ1

HARDCORRECTQ1:
	MOV SCORE, 0
	ADD SCORE, 1
	; PAINT SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR LBLEXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR CORRECT
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1CH
	INT 10H
	
	; PRINT CORRECT
	MOV AH, 09H
	LEA DX, lblcorrect
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP HARDQ2

HARDWRONGQ1:
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR LBLEXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR WRONG
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1DH
	INT 10H

	; PRINT LBLWRONG
	MOV AH, 09H
	LEA DX, LBLWRONG
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP HARDQ2

HARDQ2:
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR LBLEXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR LBLNQUESTION2
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0614H
	INT 10H

	; PRINT LBLNQUESITON2
	MOV AH, 09H
	LEA DX, LBLNQUESTION2
	INT 21H

	; MOVE CURSOR FOR LBLHQUESTION20
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0716H
	INT 10H

	; PRINT LBLHQUESITON20
	MOV AH, 09H
	LEA DX, LBLHQUESTION20
	INT 21H

	; MOVE CURSOR FOR LBLHQUESTION21
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0818H
	INT 10H

	; PRINT LBLHQUESTION21
	MOV AH, 09H
	LEA DX, LBLHQUESTION21
	INT 21H

	; MOVE CURSOR FOR LBLMANSWER
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0B14H
	INT 10H

	; PRINT LBLMANSWER
	MOV AH, 09H
	LEA DX, LBLMANSWER
	INT 21H

	; ACCEPT HARDANSWER2
	LEA SI, HARDANSWER2

ACCEPTHARDQ2ANSWER:
	MOV AH, 01H
	INT 21H

	CMP AL, 13
	JE STOPHARDQ2ANSWER

	MOV [SI], AL
	INC SI
	JMP ACCEPTHARDQ2ANSWER

STOPHARDQ2ANSWER:
	MOV AL, 36
	MOV [SI], AL

	; CHECK IF CORRECT
	MOV AL, HARDANSWER2
	CMP LBLHANSWER2, AL
	JE HARDCORRECTQ2
	JMP HARDWRONGQ2

HARDCORRECTQ2:
	ADD SCORE, 1

	; PAINT SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR LBLEXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR CORRECT
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1CH
	INT 10H

	; PRINT CORRECT
	MOV AH, 09H
	LEA DX, LBLCORRECT
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP HARDQ3

HARDWRONGQ2:
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR LBLEXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR WRONG
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1DH
	INT 10H

	; PRINT LBLWRONG
	MOV AH, 09H
	LEA DX, LBLWRONG
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP HARDQ3

HARDQ3:
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR LBLEXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR LBLNQUESTION3
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0614H
	INT 10H

	; PRINT LBLNQUESITON3
	MOV AH, 09H
	LEA DX, LBLNQUESTION3
	INT 21H

	; MOVE CURSOR FOR LBLHQUESTION30
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0716H
	INT 10H

	; PRINT LBLHQUESTION30
	MOV AH, 09H
	LEA DX, LBLHQUESTION30
	INT 21H

	; MOVE CURSOR FOR LBLHQUESTION31
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0815H
	INT 10H

	; PRINT LBLHQUESTION31
	MOV AH, 09H
	LEA DX, LBLHQUESTION31
	INT 21H

	; MOVE CURSOR FOR LBLHQUESTION32
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0915H
	INT 10H

	; PRINT LBLHQUESTION32
	MOV AH, 09H
	LEA DX, LBLHQUESTION32
	INT 21H

	; MOVE CURSOR FOR LBLHQUESTION33
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0A18H
	INT 10H

	; PRINT LBLHQUESTION33
	MOV AH, 09H
	LEA DX, LBLHQUESTION33
	INT 21H

	; MOVE CURSOR FOR LBLMANSWER
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0B14H
	INT 10H

	; PRINT LBLMANSWER
	MOV AH, 09H
	LEA DX, LBLMANSWER
	INT 21H

	; ACCEPT HARDANSWER3
	LEA SI, HARDANSWER3

ACCEPTHARDQ3ANSWER:
	MOV AH, 01H
	INT 21H

	CMP AL, 13
	JE STOPHARDQ3ANSWER

	MOV [SI], AL
	INC SI
	JMP ACCEPTHARDQ3ANSWER

STOPHARDQ3ANSWER:
	MOV AL, 36
	MOV [SI], AL

	; CHECK IF CORRECT
	MOV AL, HARDANSWER3
	CMP LBLHANSWER3, AL
	JE HARDCORRECTQ3
	JMP HARDWRONGQ3

HARDCORRECTQ3:
	ADD SCORE, 1

	; PAINT SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR LBLEXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR CORRECT
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1CH
	INT 10H

	; PRINT CORRECT
	MOV AH, 09H
	LEA DX, LBLCORRECT
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP STARS

HARDWRONGQ3:
	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; PAINT EXAMINEE BAR WHITE
	MOV AX, 0600H
	MOV BH, 70H
	MOV CX, 1800H
	MOV DX, 184FH
	INT 10H

	; MOVE CURSOR FOR LBLEXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 1800H
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR WRONG
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C1DH
	INT 10H

	; PRINT LBLWRONG
	MOV AH, 09H
	LEA DX, LBLWRONG
	INT 21H

	; MOVE CURSOR FOR LBLCONFIRM
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1AH
	INT 10H

	; PRINT LBLCONFIRM
	MOV AH, 09H
	LEA DX, LBLCONFIRM
	INT 21H

	; WAIT FOR INPUT
	MOV AH, 01H
	INT 21H
	JMP STARS

STARS:

	; PAINT WHOLE SCREEN BLACK
	MOV AX, 0600H
	MOV BH, 00
	MOV CX, 0000H
	MOV DX, 184FH
	INT 10H

	; PAINT GREEN BOX
	MOV AX, 0600H
	MOV BH, 20H
	MOV CX, 0613H
	MOV DX, 123BH
	INT 10H

	; MOVE CURSOR FOR LBLREPORT
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0715H
	INT 10H

	; PRINT LBLREPORT
	MOV AH, 09H
	LEA DX, LBLREPORT
	INT 21H

	; MOVE CURSOR FOR LBLEXAMINEE
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0B1FH
	INT 10H

	; PRINT LBLEXAMINEE
	MOV AH, 09H
	LEA DX, LBLEXAMINEE
	INT 21H

	; PRINT EXAMINEENAME
	MOV AH, 09H
	LEA DX, EXAMINEENAME
	INT 21H

	; MOVE CURSOR FOR LBLSTARS
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0C21H
	INT 10H

	; PRINT LBLSTARS > 0
	CMP SCORE, 0
	JE ZEROSTAR
	CMP SCORE, 1
	JE ONESTAR
	CMP SCORE, 2
	JE TWOSTARS
	CMP SCORE, 3
	JE THREESTARS

ZEROSTAR:
	; PRINT ZERO STARS
	MOV AH, 09H
	LEA DX, LBLSTARS0
	INT 21H
	JMP EXIT

ONESTAR:
	; PRINT ONE STAR
	MOV AH, 09H
	LEA DX, LBLSTARS1
	INT 21H
	JMP EXIT

TWOSTARS:
	; PRINT 2 STARS
	MOV AH, 09H
	LEA DX, LBLSTARS2
	INT 21H
	JMP EXIT

THREESTARS:
	; PRINT 3 STARS
	MOV AH, 09H
	LEA DX, LBLSTARS3
	INT 21H
	JMP EXIT

EXIT:

	; MOVE CURSOR FOR TRYAGAIN
	MOV AH, 02H
	MOV BH, 00
	MOV DX, 0D1CH
	INT 10H

	; PRINT LBLTRYAGAIN
	MOV AH, 09H
	LEA DX, lbltryagain
	INT 21H

	; CLEAR VARIABLE TRYAGAIN
	MOV AL, 36
	MOV TRYAGAIN, AL

	; ACCEPT CHAR
	LEA SI, TRYAGAIN

ACCEPTTRYAGAIN:
	MOV AH, 01H
	INT 21H

	CMP AL, 13
	JE STOPTRYAGAIN

	MOV [SI], AL
	INC SI
	JMP ACCEPTTRYAGAIN

STOPTRYAGAIN:
	MOV AL, 36
	MOV [SI], AL

	; CHECK IF CHAR IS N
CMPTRYAGAIN:	
	CMP TRYAGAIN, 59H
	JNE COMPARE2
	JMP START

COMPARE2:
	CMP TRYAGAIN, 79H
	JNE SUPEREXIT
	JMP START

SUPEREXIT:
	; TERMINATE
	MOV AH, 4CH
	INT 21H
END START