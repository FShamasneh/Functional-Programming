-- Functional languages practice 03

import Prelude hiding (even)

-- repetition

swap3 :: ((a, b), c) -> (b, c, a)
swap3 ((x, y), z) = undefined

-- Ex: what is the type of (swap3 ((True, 'c'), [False, True]))? Try
--     to guess it without using ghci.

-- 2.8 Curried functions

-- Given f :: Int -> Bool and u :: Int, we get f u :: Bool.

-- Similarly, f :: Int -> (Int -> Bool) and u :: Int, we get f u :: Int -> Bool.

add' :: Int -> (Int -> Int)
add' x y = x + y

-- Ex: use add' to define add3 (which adds 3 to an integer)

add3 :: Int -> Int
add3 = undefined

-- Ex: multiply 1 2 3 should be 6

multiply :: Int -> (Int -> (Int -> Int))
multiply x y z = undefined

-- a -> (b -> c) is the same as a -> b -> c

-- similarly, ((add' x) y) is the same as add' x y

-- Ex: reversePair

reversePair :: a -> b -> (b, a)
reversePair x y = undefined

-- Ex:

apply :: (a -> b) -> a -> b -- TODO: move these later for next year
apply f x = undefined

-- Ex:

flip :: (a -> b -> c) -> b -> a -> c
flip f y x = undefined

-- Ex:

duplicateApply :: ((a, a) -> b) -> a -> b
duplicateApply f x = undefined

-- Ex:

transitivity3 :: (a -> b) -> (b -> c) -> (c -> d) -> a -> d
transitivity3 f g h x = undefined

-- 2.8 Type classes

-- 2.8.1 Num

-- Try :type (+)

-- Try :type (*)

-- Try :info Num

-- 2.8.2 Eq

-- Try :type (==)

-- Try :info Eq

-- 2.8.3. Other type classes

-- Ord, Show, Integral, Fractional

-- 2.9 Exercises

-- Ex: even 2 == True
--     even 5 == False

even :: Integer -> Bool
even x = undefined

-- Ex: divides 12 6 == True
--     divides 11 2 == False

divides :: Integer -> Integer -> Bool
divides x y = undefined

-- Ex: palindrome [1,2,3,2,1] == True,
-- and palindrome "racecar" == True,
-- but palindrome "racecars" == False

palindrome :: Eq a => [a] -> Bool
palindrome xs = undefined