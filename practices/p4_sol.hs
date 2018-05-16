-- Functional languages practice 04

import Prelude hiding (max, min, otherwise)

-- repetition

-- 2.8 Type classes

-- Ex: palindrome [1,2,3,2,1] == True,
-- and palindrome "racecar" == True,
-- but palindrome "racecars" == False

palindrome :: Eq a => [a] -> Bool
palindrome xs = xs == reverse xs

-- Ex: polynomial2 (1,3,2) 4 == 1*4^2 + 3*4 + 2

polynomial2 :: Num t => (t,t,t) -> t -> t
polynomial2 (a,b,c) x = a * x ^ 2 + b * x + c

-- Ex: isBetween30and50 32 == True,
--     isBetween30and50 29 == False
--     isBetween30and50 52 == False

isBetween30and50 :: (Ord a, Num a) => a -> Bool
isBetween30and50 x = 30 <= x && x <= 50

-- Ex: isOrdered (1,2,3) == True,
--     isOrdered (3,1,2) == False

isOrdered :: Ord a => (a,a,a) -> Bool
isOrdered (x,y,z) = x <= y && y <= z

-- Ex: shiftBy (3,4) (2,0) == (5,4)

shiftBy :: Num a => (a,a) -> (a,a) -> (a,a)
shiftBy (x,y) (x',y') = (x + x', y + y')

-- Ex: circumference (x,y) (x',y') gives the circumference
-- of the rectangle given by coordinates of opposite corners

circumference :: Num a => (a,a) -> (a,a) -> a
circumference (x,y) (x',y') = 2 * (abs (x - x') + abs (y - y'))

-- Ex :: area  (x,y) (x',y') gives the area
-- of the rectangle given by coordinates of opposite corners

area :: Num a => (a,a) -> (a,a) -> a
area (x,y) (x',y') = abs ((x - x') * (y - y'))

-- Ex: distance of the two points

distance :: Floating a => (a,a) -> (a,a) -> a
distance (x,y) (x',y') = sqrt ((x - x') ^ 2 + (y - y') ^ 2)

-- Ex: three numbers are called Pythagorean triples if the
-- sum of squares of any two is equal to the sqaure of the third

-- (Eq a, Num a) means that 'a' is a number and supports the == operator.
isPythagoreanTriple :: (Eq a, Num a) => a -> a -> a -> Bool
isPythagoreanTriple x y z = x ^ 2 + y ^ 2 == z ^ 2 || x ^ 2 + z ^ 2 == y ^ 2 || y ^ 2 + z ^ 2 == x ^ 2

-- Conditional expressions

absInt :: Int -> Int
absInt n = if n >= 0 then n else -n

-- Ex: signumInt 3 == 1, signumInt (-2) == -1, signumInt 0 == 0

-- Note that the indentation is important here. This is called the margin rule.

signumInt :: Int -> Int
signumInt n = if n > 0
              then 1
              else if n == 0
                   then 0
                   else -1

-- Ex: return the maximal element from two

maxInt :: Int -> Int -> Int
maxInt a b = if a > b then a else b

-- Ex: return the maximal element from two

max :: Ord a => a -> a -> a
max x y = if x > y then x else y

-- Ex: return the minimal element from two

min :: Ord a => a -> a -> a
min x y = if x > y then y else x

-- Guards

absInt' :: Int -> Int
absInt' n | n >= 0    = n
          | otherwise = -n

otherwise :: Bool
otherwise = True

-- Exs: write the following functions using guards

signumInt' :: Int -> Int
signumInt' n | n > 0     = 1
             | n == 0    = 0
             | otherwise = -1

max' :: Ord a => a -> a -> a
max' x y | x > y     = x
         | otherwise = y

min' :: Ord a => a -> a -> a
min' x y | x > y     = y
         | otherwise = x