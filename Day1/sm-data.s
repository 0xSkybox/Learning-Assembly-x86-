;Prev worked with DW which was 32 bits in size which worked well sicne they
;were same size as memory and register (takes up single slot in memory and single register)

;working with smaller data though creates new challenges

section .data
	num DB 1
	num2 DB 2

section .text
;		(a,b,c,d)	
;4 registers, eax, ebx, ecx, edx  <-- extended form, (get all 32 bits)
;Need to get less data, remove the e 
;bx is 16 bits of 32 bits			     0000 0000		0000 0000
;Spliting that 16 bits in half again gets us 8 bits (left (higher) and right (lower))
; ah and al, bh and bl, ch and cl, dh and dl

global _start
_start:
	;MOV ebx, [num] <- poorly refrencing registers
	;MOV ecx, [num2]
	;What happens?
	;Two adress between num and num2 only differ by 1 and sit next to each other in memory
	;When we go to grab [num], we grab while chunk of 32 bits, not just the single bit
	;0x804a000 --> 0x 00 00 02 01
	;		      num2 num
	;When working at low level, we try to be efficent by storing byte next to each other
	
	;Need to tell x86 to grab a single byte rather than whole chunck of memory at that locaiton
	
	MOV bl, [num] ;bh <- placing in differnt spots creata differeent value for registers
	MOV cl, [num2]

	;exit
	MOV eax, 1
	INT 0x80
