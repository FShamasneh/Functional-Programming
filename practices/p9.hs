-- Functional languages practice 09

import Prelude hiding (map, filter, takeWhile, dropWhile, all, any, foldr, sum, foldl, zipWith, reverse, iterate, elem)
import Data.Char (isLower, isUpper, isSpace, toUpper)

-- Ex: redefine the following Prelude functions
-- Use recursion

map :: (a -> b) -> [a] -> [b]
map = undefined

test_map = [
    map (+ 1) [1, 2, 3] == [2, 3, 4]
  , map even  [1, 2, 3] == [False, True, False]
  , map isUpper "Hs"    == [True, False]
  ]

filter :: (a -> Bool) -> [a] -> [a]
filter = undefined

test_filter = [
    filter (< 5) [1,2,3,5,9,4,0,1] == [1,2,3,4,0,1]
  , filter even  [1,0,2,0,5,5,4]   == [0,2,0,4]
  ]

takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile = undefined

test_takeWhile = [
    takeWhile (< 5) [1,2,0,6,9,3,0] == [1,2,0]
  , takeWhile isLower "hello world" == "hello"
  , takeWhile isSpace "hello world" == ""
  ]

dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile = undefined

test_dropWhile = [
    dropWhile (< 5) [1,2,0,6,9,3,0] == [6,9,3,0]
  , dropWhile isLower "hello world" == " world"
  , dropWhile isSpace "hello world" == "hello world"
  ]

all :: (a -> Bool) -> [a] -> Bool
all = undefined

test_all = [
    all even [0,2,10,-2,4] == True
  , all even []            == True
  , all isUpper "HASKEll"  == False
  ]

any :: (a -> Bool) -> [a] -> Bool
any = undefined

test_any = [
    any even [0,2,10,-2,4]   == True
  , any even []              == False
  , any even [1,3,5,2,9]     == True
  , any (== 2) [0,0,5,9,2,3] == True
  , any (== 2) [0,0,5,9,3]   == False
  , any isUpper "HASKEll"    == True
  , any isLower "HASKEll"    == True
  ]

-- Ex: rewrite the following list comprehension to combination of
-- a map and a filter

lowerToUpper :: String -> String
lowerToUpper s = [toUpper c | c <- s, isLower c]

lowerToUpper' :: String -> String
lowerToUpper' = undefined

-- Ex: define elem using any

elem :: Eq a => a -> [a] -> Bool
elem = undefined

-- Folds

-- Folding a list from right to left (from last to first)

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f e []     = e
foldr f e (x:xs) = f x (foldr f e xs)

-- Ex: define 'sum' using foldr

sum :: Num a => [a] -> a
sum = undefined

-- Ex: define 'all' using foldr

all' :: (a -> Bool) -> [a] -> Bool
all' = undefined

-- Folding a list from left to right (from first to last)

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f e []     = e
foldl f e (x:xs) = foldl f (f e x) xs

-- Ex: convert a binary number to a decimal number

binToDec :: [Int] -> Int
binToDec = undefined

test_binToDec = [
    binToDec [1, 0, 0]    == 4
  , binToDec [1, 0, 1]    == 5
  , binToDec [1, 1, 1]    == 7
  , binToDec [1, 1, 0, 0] == 12
  ]

-- Ex: define reverse using foldl

reverse :: [a] -> [a]
reverse = undefined

test_reverse = [
    reverse "Haskell" == "lleksaH"
  , reverse [1..10]   == [10, 9 .. 1]
  ]

-- Ex: redefine the Prelude function zipWith

zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith = undefined

test_zipWith = [
    zipWith (*) [1,2,3] [2,0,2] == [2,0,6]
  , zipWith (*) [1,2,3] [2,0]   == [2,0]
  , zipWith (*) [1,2]   [2,0,2] == [2,0]
  , zipWith (++) ["hell", "has"] ["o", "kell"] == ["hello", "haskell"]
  , zipWith (,) [True, False] ['a'..'z']       == [(True, 'a'), (False, 'b')]
  ]

-- Advanced exercises

-- Ex: redefine the Prelude function iterate.
-- Note: it constructs an infinite list. So be careful and use 'take'.
-- iterate f x constructs [x, f x, f(f x), f(f(f x)), ...]
-- So, given the nth element of a list, f produces the n+1th element.

iterate :: (a -> a) -> a -> [a]
iterate = undefined

test_iterate = [
    take 5 (iterate (+ 1) 0)   == [0,1,2,3,4]
  , take 4 (iterate ('a':) "") == ["", "a", "aa", "aaa"]
  ]

-- Ex: construct an infinite list of Fibonacci numbers

fibs :: [Integer]
fibs = undefined

test_fibs = [
    take 6 fibs == [0, 1, 1, 2, 3, 5]
  ]

-- Ex: construct an infinite list of primes

primes :: [Integer]
primes = undefined

test_primes = [
    take 4 primes == [2, 3, 5, 7]
  ]