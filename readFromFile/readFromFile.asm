; readFromFile.asm

; Author:			Orjan Johansen
; Creation date:	18.08.2022
; Modified date:	

; Guide on how this is done: https://www.tutorialspoint.com/assembly_programming/assembly_file_management.htm

global _start

section .data ; Declared and initialized variables
	filename db "thisFileToReadFrom.txt"
	filenameLen equ $-filename
	accessMode equ 0
	accessModeLen equ $-accessMode
	fileDescriptorLen equ 1
	fileContentsLen equ 256

section .bss ; Uninitialized variables
	fileDescriptor resb fileDescriptorLen
	fileContents resb fileContentsLen

section .text ; Code section

_start:	; Starting point
	mov eax, 5					; open file
	mov ebx, filename
	mov ecx, accessMode
	mov edx, 0777 ; rwx for all
	int 0x80

	mov [fileDescriptor], eax	; save file descriptor

	mov eax, 3					; read from opened file
	mov ebx, [fileDescriptor]
	mov ecx, fileContents
	mov edx, fileContentsLen
	int 0x80

	mov eax, 4					; print file contents
	mov ebx, 1
	mov ecx, fileContents
	mov edx, fileContentsLen
	int 0x80


	mov eax, 6					; close file
	mov ebx, fileDescriptor
	int 0x80

	; gracefully exit
	mov eax, 1
	mov ebx, 0
	int 0x80
