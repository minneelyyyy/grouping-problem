#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <assert.h>
#include <sys/types.h>
#include <math.h>

#define INT_ARRAY_TYPE int
#define INT_ARRAY_HEAP 1
#define INT_ARRAY_FREE(value) NULL
#define INT_ARRAY_COMPARE(cmp_a, cmp_b) (a > b)
#define INT_ARRAY_PRINT_ELEM(x) printf("%d", x)

#define CARRAY_INITIAL_SIZE 32
#include "carray.h"

struct IntArray {
	int length;
	int capacity;
	int* contents;
};

int is_prime(int n) {
	int i;

	if (n % 2 == 0) {
		return 0;
	}

	for (i = 2; i < n / 2; i++) {
		if (n % i == 0) {
			return 0;
		}
	}

	return 1;
}

struct IntArray* calculate(int n, struct IntArray* optional_provided) {
	struct IntArray* numbers = optional_provided ? optional_provided : carray_init(numbers, INT_ARRAY);
	int grouping_size;

	if (n % 2 != 0) {
		return numbers;
	}

	if (is_prime(n / 2)) {
		carray_append(numbers, 1, INT_ARRAY);
		carray_append(numbers, n / 2, INT_ARRAY);
		
		return numbers;
	}

	for (grouping_size = 1; grouping_size < n / 2 + 1; grouping_size++) {
		if (n % grouping_size == 0 && (n / grouping_size) % 2 == 0) {
			carray_append(numbers, grouping_size, INT_ARRAY);
		}
	}

	return numbers;
}

int main(int argc, char** argv) {
	int i;
	const int up_to = argc > 1 ? atoi(argv[1]) : 100;

	struct IntArray* arr;

	for (i = 2; i <= up_to; i += 2) {
		arr = calculate(i, NULL);

		printf("%d: ", i);
		carray_print(arr, INT_ARRAY);
		printf("\n");

		carray_free(arr, INT_ARRAY);
	}

	return 0;
}
