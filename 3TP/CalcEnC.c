#include <stdio.h>

int pgcd(int a, int b) {
    int r = a % b;

    while (r != 0)
    {
            a = b;
            b = r;
            r = a % b;
    }

    return b;
}

int ppcd(int a, int b) {
    int i;
    int min = (a < b) ? a : b;

    for (i = 2; i <= min; ++i)
        if (a % i == 0 && b % i == 0)
            return i;

    return 0;
}


int factorielle(int a) {
    int i;
    int r = 1;

    for (i = 2; i <= a; ++i)
        r *= i;

    return r;
}


int somme(int a, int b) {
	return a+b;
}

int sous(int a,int b){
	return a-b;
}

int divi (int a, int b) {
	return a/b;
}

int mult (int a,int b) {
	return a*b;
}

