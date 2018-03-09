.data
	t1:
		.quad 1,2,5,7,9,0
	t2:
		.quad 3,4,6,8,10,0
	t3:
		.rept 10
		.quad 0
		.endr
.text

.globl _start

_start:
	movq $t1, %r8               # pointeur de t1 dans r8
	movq $t2, %r9               # pointeur de t2 dans r9
	movq $t3, %r10              # pointeur de t3 dans r10
        movq (%r8) , %r11           # valeur de la case actuelle de t1 dans r11
        movq (%r9) , %r12           # valeur de la case actuelle de t2 dans r12

while:
	movq (%r8) , %r11           # valeur de la case actuelle de t1 dans r11                           0x6001bc:       4       6
        movq (%r9) , %r12           # valeur de la case actuelle de t2 dans r12
	cmpq %r11 , %r12            # compare les deux cases actuelles des tableaux
	jg sup                      # si r11 > r12 goto sup
	jle inf                     # si r11 <= r12 goto inf

fin:
	movq $0, %rbx               # fin du programme
	movq $1, %rax
	int $0x80

sup:
	movq $0, %r13               # 0 = valeur de fin de tableau
	cmpq %r11, %r13             # comparaison case tableau et fin de tableau
	je endSup                   # si fin de tableau goto endSup
	add %r11, (%r10 , %rbx , 8) # sinon ajout de la valeur dans t3
	add $8, %r8                 # incrementation de t1
	inc %rbx                    # incrementation de t3
	jmp while                   # poursuite de calcul

inf:
	movq $0, %r13               # 0 = valeur de fin de tableau
	cmpq %r12, %r13             # comparaison case tableau et fin de tableau
	je endInf                   # si fin de tableau goto endInf
	add %r12, (%r10 , %rbx , 8) # sinon ajout de la valeur dans t3
	add $8, %r9                 # incrementation de t2
	inc %rbx                    # incrementation de t3
	jmp while                   # poursuite de clacul

endInf:
	movq $0, %r13               #
        movq (%r8), %r14            #
        cmpq %r14, %r13             #
	je fin                      #
	jmp while                   #

endSup:
	movq $0, %r13               #
        movq (%r9), %r15            #
        cmpq %r15, %r13             #
	je fin                      #
	jmp while                   #
