#include <stdio.h>
#include <stdlib.h>

extern int *sumOf(int n, void(*callback)(int*));

void
callback(int *n)
{
    printf("callback called\n");    
};



int
main()
{
	int *result = sumOf(1000, callback);
	printf("result: %d\n", *result);
    free(result);
	return 0;
};
