section .data
	;Need 3 things, name, type(size of bytes), and inital value
	;This memory exits on the stack memory, given value of 5 and 32 bits are allocated to value

	num DD 5 ;define byte (8 bits)
	;   DW  define word 2 bytes (16 bits)
	;   DD  4 bytes (32 bits)
	;   DQ  8 bytes (64 bits)
	;   DT  10 bytes (80 bits)

	;No need to declare type since we're at such a low level
	;since we're working with actualy bits/bytes

section .text

global _start

_start:
	MOV eax, 1
	;MOV ebx, num <- Can't do this to move bit because "num" is more like a pointer
	;moves 0x804a000 into ebx, this is a memory location, num is the address, not value

	MOV ebx, [num] ;[var]<- Rather than adress, go into the memory location and grab the data
	int 0x80
