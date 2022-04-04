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