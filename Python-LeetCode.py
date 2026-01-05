===============================================================
1. Two Sum

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for i in range(len(nums)):
            for j in range(i+1,len(nums)):
                if((nums[i]+nums[j])==target):
                    return [i,j]
===============================================================
1108. Defanging an IP Address

class Solution:
    def defangIPaddr(self, address: str) -> str:
        my_list = address.split(".")
        new_address = "[.]".join(my_list)
        return new_address
===============================================================
9. Palindrome Number

class Solution:
    def isPalindrome(self, x: int) -> bool:
        if x <0:
            return False
        if x ==0:
            return True
        if x %10 ==0:
            return False
        originalX = x
        numReversed =0
        while x >0:
            lastDigit = x%10
            numReversed = numReversed*10 + lastDigit
            x = x//10
        
        return numReversed == originalX
===============================================================
2011. Final Value of Variable After Performing Operations

class Solution:
    def finalValueAfterOperations(self, operations: List[str]) -> int:
        count = 0
        length = len(operations)
        for i in range(length):
            if (operations[i]=='++X') or (operations[i]=='X++'):
                count=count+1
            elif (operations[i]=='--X') or (operations[i]=='X--'):
                count=count-1
        return count
===============================================================