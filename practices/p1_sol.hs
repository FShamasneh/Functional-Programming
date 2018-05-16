import Data.List (sort)
 
-- requirements: http://lambda.inf.elte.hu/fp/FL_AboutCourse_en.xml

-- standard prelude arithmetic functions: (+), (-), (*), (^), div, sqrt

-- Try: 2+3*4

-- Try: 2*3^4

-- Try: 2^3^4

-- Ex: How many seconds are there in a normal year?

-- function notation

-- Ex:Decide whether 23 divides 532253373 or not.



-- Try: [1,2,3]

-- standard prelude list functions: head, tail, take, drop, length, sum, product, (++), reverse

-- Try: head [1,2,3,4,5]

-- Try: tail [1,2,3,4,5]

-- Try: take 3 [1,2,3,4,5]

-- Try: drop (1+2) [1,2,3,4,5]

-- Try: sum [1,2,3,4,5]

-- Try: product [1,2,3,4,5]

-- Try: [1,2,3] ++ [4,5]

-- Try: reverse [1,2,3,4,5]

-- Try: length [1,2,3,4,5]

-- Ex: last 2 elements of the list [1,2,3,4,5]

-- Ex: all elements of [1,2,3,4,5] except the last two

-- Ex: all but the last and first element of [1,2,3,4,5]

-- Try: reverse (reverse [1,2,3,4,5])



-- writing script: :load, :reload, :set editor name, :edit name, :edit, :type, :quit

inc x = x + 1

-- Ex: double

double x = x * 2

-- Ex: quadruple (you can reuse double)

-- quadruple x = x * 4
-- or
quadruple x = double (double x)

-- Ex: []

-- Try: [1..10]

-- Ex: upAndDown n = [1,2,3,...,n,n-1,n-2,...,1]

--upAndDown n = [1..n] ++ reverse [1..n - 1]
upAndDown n = [1..n] ++ [n-1, n-2..1]

-- Ex: list the numbers from n to -n: for example,
-- downwards 4 should be [4,3,2,1,0,-1,-2,-3,-4]

downwards n = [n,n-1 .. -n]

-- Ex: factorial (use product and ..)

factorial n = product [1..n]

-- Ex: integer average (use sum, div)

average ls = div (sum ls) (length ls)

-- Try: sort [4,3,2,5,2,2,5,6,8]

-- Ex: simple median (the middle element in a list, use sort, length, drop, take)

median ls = take 1 (drop (div (length ls) 2) (sort ls))



-- naming requirements: lowercase, keywords



-- layout rule, no tabs, where

a = b + c
  where
    b = 1
    c = 2
d = a * 2

-- comments



-- Ex: parenthesise: 2*3+4*5

-- Ex: parenthesise: 2+3*4^5
