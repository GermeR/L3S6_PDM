.data
	UnNom :
		.quad 43
		.quad 54
		.quad 23
		.quad 32
		.quad 76
		.string "Hello World"
	UnAutre :
		.space 8

.text
.globl _start

_start:
	movq $5,%rax
	movq $0,%rbx
	movq $UnNom, %rcx

top:
	addq (%rcx),%rbx
	addq $8, %rcx
	decq %rax
	jnz top

done:
	movq %rbx,UnAutre
	movq $0,%rbx
	movq $1,%rax
	int $0x80
