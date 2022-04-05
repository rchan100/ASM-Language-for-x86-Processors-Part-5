; Prompt: Converting from Big Endian to Little Endian
; 	  Write a program using the variables below and MOV instructions to copy the value 
;	  from bigEndian to littleEndian, reversing the order of the bytes. The number's 
;	  32-bit value is understood to be 12345678 hexadecimal

; Given:
;	.data
;	bigEndian BYTE 12h, 34h, 56h, 78h
;	littleEndian DWORD?

; Solution:

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	bigEndian BYTE 12h,34h,56h,78h
	littleEndian DWORD ?
	
.code 
main proc

	; using DWORD PTR will reverse the order of the bytes since it starts the first element
	; is copied to the lower part of register and the last element will be copied at the upper part of the register
	
	mov eax, DWORD PTR bigEndian		; eax = 78563412
	mov littleEndian, eax				; littleEndian = 78563412
	
	invoke ExitProcess,0
main endp
end main
