#!/usr/bin/env python3

import sys
import math

def is_prime(n: int) -> bool:
    if n % 2 == 0:
        return False

    for i in range(2, int(math.sqrt(n)) + 1):
        if n % i == 0:
            return False

    return True

def calculate(n: int) -> list[int]:
    if n % 2 != 0:
        return []

    if is_prime(n // 2):
        return [1, n // 2]

    return [1, *[grp_sz for grp_sz in range(2, n // 2) if n % grp_sz == 0 and n // grp_sz % 2 == 0], n // 2]

def main(argc: int, argv: list[str]) -> int:
    up_to = int(argv[1]) if argc > 1 else 100

    for i in range(2, up_to + 1, 2):
        print(f"{i}: {calculate(i)}")

    return 0

if __name__ == '__main__':
    sys.exit(main(len(sys.argv), sys.argv))
