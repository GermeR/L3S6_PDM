#!/bin/bash

FILES=$(ls | grep '.s$') # $= FIN DE LIGNE

for i in $FILES
do
	out=$(echo $i | cut -d "." -f 1)
	as -gstabs -o $out.o $i
	ld -melf_x86_64 -o $out $out.o
	echo $out
done


