; Prompt: Fibonacci Numbers
;	  Write a program that uses a loop to calculate the first seven values of a Fibonacci number 
;	  sequence, described by the following formula:
;		Fib(1) = 1
;		Fib(2) = 1
;		Fib(n) = Fib(n-1) + Fib(n-2)

; Solution:

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	array	DWORD	7	DUP(1,1,?,?,?,?,?)	; declare an array of DWORD with length 7 (for first 7 fib numbers), 
													; with first two val instantiated
	count	DWORD	5				; set since LENGTHOF array produces 31?

.code
main proc
	mov esi, OFFSET array				; offset array so esi starts at first element
	mov ecx, count					; counter, minus 2 since first two instantiated
	add esi, 2 * TYPE array				; increment 2 elements since first two instantiated


	L1:
		mov eax, [esi - TYPE array]		; eax = n - 1									
		mov ebx, [esi - 2 * TYPE array]		; ebx = n - 2
		add eax, ebx				; eax = (n-1) + (n-2)
		mov [esi], eax				; move value of eax into the address esi is currently assigned
		add esi, TYPE array			; increment by TYPE array (4 bytes) to get to the address of the next element
		
		loop L1
	invoke ExitProcess,0
main endp
end main
