===============================================================
Say "Hello, World!" in Python

def main():
    print("Hello, World!")

if __name__ == "__main__":
    main()
===============================================================
Python If-Else

#!/bin/python3

import math
import os
import random
import re
import sys


def test(n):
    if n % 2 != 0:
        print("Weird")
    elif (n % 2 ==0) and (2 <= n <= 5):
        print("Not Weird")
    elif (n % 2 ==0) and (6 <= n <= 20):
        print("Weird")
    elif (n % 2 ==0) and (20 < n):
        print("Not Weird")

if __name__ == '__main__':
    n = int(input().strip())
    test(n)
===============================================================
Arithmetic Operators

if __name__ == '__main__':
    a = int(input())
    b = int(input())
    print(a+b)
    print(a-b)
    print(a*b)
===============================================================
Python: Division

if __name__ == '__main__':
    a = int(input())
    b = int(input())
    print(a//b)
    print(a/b)
===============================================================