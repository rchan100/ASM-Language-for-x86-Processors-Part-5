.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	array	WORD 10h, 20h, 30h, 40h, 50h			; sample WORD array
	Darray	DWORD	LENGTHOF array DUP(?)			; declare an array of DWORD with same length of array

.code
main proc
	mov esi, OFFSET array							; offset array so esi starts at first element
	mov edi, OFFSET Darray							; offset Darray so edi starts at first element 
	mov ecx, LENGTHOF array							; counter
	
	L1:
		mov eax, 0									
		mov ax, [esi]								; move element of array to ax
		mov [edi], eax								; move that element from the eax register to the element location of Darray
		add esi, TYPE array							; increment register by TYPE array (2 bytes) 
		add edi, TYPE Darray						; increment register by TYPE Darray (4 bytes) 
		
		loop L1

	invoke ExitProcess,0
main endp
end main