; countFinalWord.asm

; Author: Orjan Johansen
; Date: 29.07.2022

section .text		; main, code to be run
	global _start

_start:				; startingpoint of the program
	; write prompt to user to enter string
	mov eax, 4						; write to screen
	mov ebx, 1						; stdout
	mov ecx, enterString			; string to write
	mov edx, enterString_length		; length of string to write
	int 0x80						; run this syscall

	; read user input into <inputString> variable
	mov eax, 3						; read from something
	mov ebx, 2						; stdin
	mov ecx, inputString			; where to put the read input
	mov edx, 256					; number of bytes allocated to variable, we gave 256(32x8)
	int 0x80						; run this syscall

	; try to detect the final word of the <inputString>
	

	; count the number of letters in the final word of <inputString>


	; gracefully exit
	mov eax, 0x1
	mov ebx, 0
	int 0x80

section .data		; Data variables
	enterString db "Please enter the string:", 0xA									; message to ask user to enter the string to be counted
	enterString_length equ $-enterString											; length of mesenterString string
	countStatement db "The length of the final word in the entered string is: "		; message to convey the length counted
	countStatement_length equ $-countStatement										; length of countStatement

section .bss		; uninitialized variables
	count resb 5			; declare count, give it 5 bytes
	inputString resq 32		; declare inputString, give it 32x8 bytes, 256 bytes. 1 Byte = 1 Letter/Number
