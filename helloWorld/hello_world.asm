; hello_world.asm

; Author:			Orjan Johansen
; Creation date:	26.07.2022
; Modified date:	07.08.2022

global _start

section .text				; Do NOT use : at end of sections, will not compile, as opposed to John Hammonds video, dunno why

_start:
	mov eax, 0x4			; use the write syscall
	mov ebx, 1			; use stdout as the file descriptor
	mov ecx, message		; use the message as the buffer
	mov edx, message_length		; supply the message length
	int 0x80			; invoke the syscall

	; Gracefully exit
	mov eax, 0x1
	mov ebx, 0
	int 0x80

section .data				; Do NOT use : at end of sections, will not compile, as opposed to John Hammonds video, dunno why
	message: db "Hello World!", 0xA
	message_length equ $-message
