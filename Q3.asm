;Write a program with a loop and indexed addressing that calculates the sum of all the gaps between successive array elements. 
;The array elements are doublewords, sequenced in nondecreasing order. So, for example, the array {0, 2, 5, 9, 10}
;has gaps of 2, 3, 4, and 1, whose sum equals 10.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	array DWORD 0, 2, 5, 9, 10						; sample array
	sum	  DWORD	0									; variable to hold sum

.code
main proc
	mov esi, OFFSET array							; offset myWords so esi starts at first element
	mov ecx, LENGTHOF array - 1						
	
	L1:
		mov eax, [esi]								; i
		mov ebx, [esi + TYPE array]					; i + 1
		sub ebx, eax								; [i+1] - i
		add sum, ebx								; add difference to sum to calculate the sum
		add esi, TYPE array							; increment register by TYPE array (4 bytes) to get to next element of array
		loop L1

	invoke ExitProcess,0
main endp
end main