/* Example test file for travis-ci */
#include <stdio.h>
#include "lib.h"

#define S_OK (0)
#define E_FAIL (-1)


/* ************************************************
	simple test cases for the library functions 
   ************************************************
*/
/*   test cases for test_gammaln() function  */
int test_gammaln(){
	if (gammaln(1) != gammaln(1))
		return E_FAIL;
	return S_OK;
}


/* 	************************************************
	this is a simple test suite.  
	normally you would run cppUnit or some other 
	more general purpose test framework.
*/
int run_tests(){
	if (E_FAIL == test_gammaln()) {
		printf("Failed test_gammaln()\n");
		return E_FAIL;
	}
	return S_OK;
}

/* 
	This main function only runs all the test code.
    If successful it returns S_OK which is equal to the numerical value of 0.
 	Any other value is considered a failure.
 */
int main(){
	int result;
	
	printf("Running tests...\n");
	result = run_tests();

	if (result == S_OK) 
		printf("Tests passed\n");
	else
		printf("Tests failed\n");

    return result;  /* remember the value 0 is considered passing in a travis-ci sense */
}
