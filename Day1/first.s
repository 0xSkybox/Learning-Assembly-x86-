;writing x86 programs based of intel syntax (nasm)
;Creates simplified apporach (for general user)
;Usually, x86 is based on serveral syntax (mostly AT&T)
;Fundementals are the same

;Typical, file formats are .s, .as, .asm

section .data
	;Variables
	

section .text
	;Instructions

;How to tell our interpretuer where to start
;"label" this is a section and everything runs under start when it's called
global _start

_start:
	;Learning to move data in registers
	MOV eax, 1 ; 1 = Run the exit system call (end program and set status code) 
	MOV ebx, 1 ; 1 = status code
	;Moves data from one location to another

	;Moveds from source to desination
	;MOV DESITNATION, SOURCE

	int 0x80 ;80 in hexadecimal = 5 0 OR 80h
	;This will tell our operating system that our program needs to do something
	;The next action taken is based off the data we moved to the register (eax)
	

	;eax = what we want to do
	;ebx = output for status code
	;int = system interupt, calls op sys to do something using code in eax
