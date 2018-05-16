-- Functional languages practice 07

import Prelude hiding (flip, elem)
import Data.Char (toUpper)

-- Ex: count 'a' s returns the number of 'a' characters in the string
-- s. Use the library function sum.

count :: Eq a => a -> [a] -> Int
count = undefined

-- Ex: how many times the maximal element appears in a list? Use the
-- library function maximum

howManyMaxs :: Ord a => [a] -> Int
howManyMaxs = undefined

-- Ex: return a list of length 1000 with False and True alternating in it: [False, True, False, True, False, ...]

falseTrues :: [Bool]
falseTrues = undefined

-- Ex:

flip :: (a -> b -> c) -> b -> a -> c
flip = undefined

-- filter

-- all the off numbers from [1..100]

odds' :: [Int]
odds' = filter odd [1..100]

-- Ex: use filter

count' :: Eq a => a -> [a] -> Int
count' = undefined

-- Ex: get the vowels from a string

vowels :: String -> String
vowels = undefined

-- Ex: return the numbers from the input list which are divisible by 3
-- or 5

nums35 :: [Int] -> [Int]
nums35 = undefined

-- Ex: return True if the first input is in the second input

elem :: (Eq a) => a -> [a] -> Bool
elem = undefined

-- list comprehensions

powersOf2 :: Int -> [Int]
powersOf2 n = map (^2) [0..(n-1)]

-- an alternative version close to the mathematical notation { x^2 | x ∈ {0,1,...,n-1} }

powersOf2' :: Int -> [Int]
powersOf2' n = [ x^2 | x <- [0..(n-1)]]

-- Ex: double of the First 10 Square Numbers

doubleOfSquares :: [Int]
doubleOfSquares = undefined

-- Ex: list the divisors of 60.

divisorsOf60 :: [Int]
divisorsOf60 = undefined

-- Ex: test whether a number is a prime (meaning it only has two
-- divisors: 1 and itself).

isPrime :: Int -> Bool
isPrime = undefined

-- Ex: which is the least power of 2 which is bigger than 10^20
-- (100000000000000000000)? Hint: use the head function.

leastPowerOf2 :: Integer
leastPowerOf2 = undefined

-- Ex: generate the following infinite string: "* ** *** ****
-- *****..." Hint: use replicate to generate sequences of starts and
-- unwords to make them into a string.

stars :: String
stars = undefined

-- Ex: generate a list that contains all (hour, minute) pairs in a day.

hoursMinutes :: [(Int, Int)]
hoursMinutes = undefined

-- Ex: generate the following infinite list: [1,1,2,1,2,3,1,2,3,4,...].

counting :: [Int]
counting = undefined

-- Advanced exercises for clever people

-- Ex: generate the following list:
-- 0,1,0,-1,0,1,2,1,0,-1,-2,-1,0,1,2,3,2,1,0,-1,...

-- Ex: define the map function using list comprehension

map' :: (a -> b) -> [a] -> [b]
map' = undefined

-- Ex: define the filter function using list comprehension

filter' :: (a -> Bool) -> [a] -> [a]
filter' = undefined

-- Ex: generate a list that contains all (month, day) pairs in a
-- 365-day year.

monthsDays :: [(Int, Int)]
monthsDays = undefined

-- Ex: generate the infinite list all pairs of natural numbers,
-- e.g. [(0,0),(0,1),(1,0),(0,2),(1,1),(2,0), ...].

allPairs :: [(Integer, Integer)]
allPairs = undefined

-- Ex: which is the least natural number n for which 1024^n > 2 * 1000^n?

someNumber :: Integer
someNumber = undefined

-- Ex: calculate the value of pi using Leibniz' method:
-- pi/4 = 1 - 1/3 + 1/5 - 1/7 + 1/9 - ...
-- It is enough to take the first 1000 components.
-- Hint: first generate the [1, -3, 5, -7, 9, -11, ... ] infinite list.
-- Then take the reciprocals and add the numbers.

pi' :: Double
pi' = undefined