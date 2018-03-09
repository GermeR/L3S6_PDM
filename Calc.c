#include <math.h>
#include <stdio.h>
#include <stdlib.h>

unsigned long pgcd(unsigned long, unsigned long);
unsigned long ppcd(unsigned long, unsigned long);
unsigned long factorielle(unsigned long);


unsigned long pgcd(unsigned long a, unsigned long b)
{
    unsigned long r = a % b;

    while (r != 0)
    {
            a = b;
            b = r;
            r = a % b;
    }

    return b;
}


unsigned long ppcd(unsigned long a, unsigned long b)
{
    unsigned long i;
    unsigned long min = (a < b) ? a : b;

    for (i = 2; i <= min; ++i)
        if (a % i == 0 && b % i == 0)
            return i;

    return 0;
}


unsigned long factorielle(unsigned long a)
{
    unsigned long i;
    unsigned long r = 1;

    for (i = 2; i <= a; ++i)
        r *= i;

    return r;
}


int
main(void)
{
    double a;
    double b;
    double res = 0;
    int n;
    char op;

    while (1)
    {
        printf("> ");
        n = scanf("%lf %c %lf", &a, &op, &b);

        if (n <= 1)
        {
            scanf("%c", &op);
            b = a;
            a = res;
        }
        if (op == 'q')
            break;

        switch (op)
        {
        case '+':
            res = a + b;
            break;

        case '-':
            res = a - b;
            break;

        case '*':
            res = a * b;
            break;

        case '/':
            res = a / b;
            break;

        case '%':
            res = (unsigned long)a % (unsigned long)b;
            break;

	case '!':
            res = factorielle((n == 0) ? a : b);
            break;

        case 'g':
            res = pgcd(a, b);
            break;

        case 'p':
            res = ppcd(a, b);
            break;
        }

        printf("%lf\n", res);
    }
    return 0;
}
