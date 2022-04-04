.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	myWords DWORD 10h, 20h, 30h, 40h, 50h, 60h			; sample data 


.code
main proc
	mov esi, OFFSET myWords								; offset myWords so esi starts at first element
	mov ecx, LENGTHOF myWords/2							; divide length of myWords since we're swapping pairs and moving every other

	L1:													; will loop 3 times since sample data has 3 pairs
		mov eax, [esi]									; get first element of the pair, eax = i
		mov ebx, [esi + TYPE myWords]					; get second element of the pair, ebx = i+1
		xchg eax, ebx									; swap the pair's values in the array, eax = i+1, ebx = i

		add esi, 2 * TYPE myWords						; increment the register by 2 * TYPE (in this case DWORD = 4 bytes) to get to the next pair
		loop L1 

	invoke ExitProcess,0
main endp
end main