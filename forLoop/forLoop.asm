; forLoop.asm

; Author:			Orjan Johansen
; Creation date:	07.08.2022
; Modified date:	

global _start

section .data ; Variable declaration and initialization
; [Variable name] [Variable type] [contents of variable]


section .bss ; uninitialized variables
; [name of variable] [bitsize to allocate] [num of bitsize]
	num resb 1


section .text ; Code seciton

_start: ; Starting point
	mov ecx, 9		; set the end point for the loop
	mov eax, '1'	; set the starting point for the loop

l1:		; the loop body, it seems to run on eax and ecx, where ecx is the comparee, and the eax is the comparing, so as long as eax is not equal to ecx, it will run when loop l1 is called
	mov [num], eax	; set the [num] variable to be the starting point of the loop (eax)
	mov eax, 4		; SET the syscall WRITE
	mov ebx, 1		; write to stdout, write to screen
	push ecx		; push the end of the loop to the stack

	mov ecx, num	; set the print variable to be the [num] variable
	mov edx, 2		; the length of the printed variable is 1
	int 0x80		; EXECUTE the syscall WRITE

	mov eax, [num]	; set eax back from syscall to [num]
;	sub eax, '0'	; don't know what purpose this has
	inc eax			; increment eax for the next loop
;	add eax, '0'	; same don't know the purpose
	pop ecx			; get the last variable pushed to the stack (in this case the end number for the loop)

	loop l1			; loop back up, if eax and ecx, is not equal

	; Gracefully exit
	mov eax, 1
	mov ebx, 0
	int 0x80
