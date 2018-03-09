#include <stdio.h>

int somme(int a, int b);
int sous(int a, int b);
int mult(int a, int b);
int divi(int a, int b);
int pgcd(int a, int b);
int ppcd(int a, int b);
int factorielle(int a);

int main(void) {

	int a,b,res;
	int n;
	char op;

	while (1) {
	        printf("> ");
       		n = scanf("%d %c %d", &a, &op, &b);

        	if (op == 'q')
	            break;

        	switch (op) {
	 		case '+':
				res = somme(a,b);
	        		break;

	        	case '-':
        			res = sous(a,b);
				break;

		        case '*':
				res = mult(a,b);
            			break;

		        case '/':
        		    	res = divi(a,b);
	        	    	break;
			case 'p':
				res = ppcd(a,b);
				break;
			case 'g':
				res = pgcd(a,b);
				break;
		}
		printf("%d\n",res);
	}
	return 0;
}
