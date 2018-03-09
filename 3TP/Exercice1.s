.data
	rez:
		.rept 10
		.byte 0
		.endr
.text

.globl _start

_start:
read:
	movq $0, %rbx
	movq $3, %rax
	movq $10, %rdx
	movq $rez, %rcx
	int $0x80
print:
	movq $0, %rbx
	movq $4, %rax
	movq $10, %rdx
	movq $rez, %rcx
	int $0x80

exit:
	movq $0, %rbx               # fin du programme
	movq $1, %rax
	int $0x80


