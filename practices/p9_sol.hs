-- Functional languages practice 09

import Prelude hiding (map, filter, takeWhile, dropWhile, all, any, foldr, sum, foldl, zipWith, reverse, iterate, elem)
import Data.Char (isLower, isUpper, isSpace, toUpper)

-- Ex: redefine the following Prelude functions
-- Use recursion

map :: (a -> b) -> [a] -> [b]
map f []     = []
map f (x:xs) = f x : map f xs

test_map = [
    map (+ 1) [1, 2, 3] == [2, 3, 4]
  , map even  [1, 2, 3] == [False, True, False]
  , map isUpper "Hs"    == [True, False]
  ]

filter :: (a -> Bool) -> [a] -> [a]
filter p []     = []
filter p (x:xs)
  | p x       = x : filter p xs
  | otherwise = filter p xs

test_filter = [
    filter (< 5) [1,2,3,5,9,4,0,1] == [1,2,3,4,0,1]
  , filter even  [1,0,2,0,5,5,4]   == [0,2,0,4]
  ]

takeWhile :: (a -> Bool) -> [a] -> [a]
takeWhile p []     = []
takeWhile p (x:xs)
  | p x       = x : takeWhile p xs
  | otherwise = []

test_takeWhile = [
    takeWhile (< 5) [1,2,0,6,9,3,0] == [1,2,0]
  , takeWhile isLower "hello world" == "hello"
  , takeWhile isSpace "hello world" == ""
  ]

dropWhile :: (a -> Bool) -> [a] -> [a]
dropWhile p []     = []
dropWhile p l@(x:xs)          -- as-pattern
  | p x       = dropWhile p xs
  | otherwise = l

test_dropWhile = [
    dropWhile (< 5) [1,2,0,6,9,3,0] == [6,9,3,0]
  , dropWhile isLower "hello world" == " world"
  , dropWhile isSpace "hello world" == "hello world"
  ]

all :: (a -> Bool) -> [a] -> Bool
all p []     = True
all p (x:xs) = p x && all p xs

all'' p l    = and (map p l)

test_all = [
    all even [0,2,10,-2,4] == True
  , all even []            == True
  , all isUpper "HASKEll"  == False
  ]

any :: (a -> Bool) -> [a] -> Bool
any p []     = False
any p (x:xs) = p x || any p xs

test_any = [
    any even [0,2,10,-2,4]   == True
  , any even []              == False
  , any even [1,3,5,2,9]     == True
  , any (== 2) [0,0,5,9,2,3] == True
  , any (== 2) [0,0,5,9,3]   == False
  , any isUpper "HASKEll"    == True
  ]

-- Ex: rewrite the following list comprehension to combination of
-- a map and a filter

lowerToUpper :: String -> String
lowerToUpper s = [toUpper c | c <- s, isLower c]

lowerToUpper' :: String -> String
lowerToUpper' s = map toUpper (filter isLower s)

-- Ex: define elem using any

elem :: Eq a => a -> [a] -> Bool
elem x xs = any (\y -> x == y) xs

elem' x xs = any (x ==) xs

-- Folds

-- See http://learnyouahaskell.com/higher-order-functions#folds for more.

-- Folding a list from right to left (from last to first)

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr f e []     = e
foldr f e (x:xs) = f x (foldr f e xs)

-- Ex: define 'sum' using foldr

sum :: Num a => [a] -> a
sum ns = foldr (+) 0 ns

-- Ex: define 'all' using foldr

all' :: (a -> Bool) -> [a] -> Bool
all' p xs = foldr (\x acc -> p x && acc) True xs

-- Compare to 'all':

-- all :: (a -> Bool) -> [a] -> Bool
-- all p []     = True
-- all p (x:xs) = p x && all p xs

-- Now focus on foldr (\x acc -> p x && acc) True xs
--     an element of xs ^                    ^^^^ result when xs is empty (right hand side of 'all p []' equation above)
--                               ^^^^^^^^^^ what to do with an element and the result of the recursive call
--                                          (right hand side of 'app p (x:xs)')
--                        ^^^ result of the recursive call 'all p xs'

-- That is, foldr does the recursive call instead of you, and makes sure that the recursion terminates (if the list is finite).
-- You don't have to worry about recursion and accidental infinite recursion.

-- Folding a list from left to right (from first to last)

foldl :: (b -> a -> b) -> b -> [a] -> b
foldl f e []     = e
foldl f e (x:xs) = foldl f (f e x) xs

-- Ex: convert a binary number to a decimal number

binToDec :: [Int] -> Int
binToDec ns = foldl (\acc n -> acc * 2 + n) 0 ns

-- Without foldl:
binToDec' ns = f 0 ns
  where
    step :: Int -> Int -> Int
    step acc n = acc * 2 + n

    f :: Int -> [Int] -> Int
    f acc []       = acc
    f acc l@(n:ns) = f (step acc n) ns

-- Here f is foldl tailored for this exercise.

-- In case of [1, 0, 1], values of l and acc are as follows:
--        l         acc   recursive call to f (right hand side of 'f acc l@(n:ns)')
-- 1. [1, 0, 1]      0    f (0 * 2 + 1) [0, 1]
-- 2.    [0, 1]      1    f (1 * 2 + 0)    [1]
-- 3.       [1]      2    f (2 * 2 + 1)     []
-- 4.        []      5    (end of recursion)

-- So, foldl works like a for loop. In every step, we update the value of acc.
-- Since we cannot change the value of acc, we recursively call f with new value of acc.
--
-- int binToDec(int[] ns) {
--   int acc = 0
--   for (n : ns) {
--     acc = acc * 2 + n;
--   }
--   return acc;
-- }

--  foldl (\acc n -> acc * 10 + n) 0 ns
--                                 ^ what is the initial value of the loop variable
--                   ^^^^^^^^^^^^ how to update the loop variable (the body of the loop)
--              ^ ith element of ns
--          ^^^ actual value of the loop variable after i-1 elements

test_binToDec = [
    binToDec [1, 0, 0]    == 4
  , binToDec [1, 0, 1]    == 5
  , binToDec [1, 1, 1]    == 7
  , binToDec [1, 1, 0, 0] == 12
  ]

-- Ex: define reverse using foldl

reverse :: [a] -> [a]
reverse xs = foldl (flip (:)) [] xs

-- We need flip here, because foldl needs a ?  :: [a] -> a   -> [a]
-- but                                     (:) :: a   -> [a] -> [a]
-- Fortunately,                       flip (:) :: [a] -> a   -> [a]
-- exactly what foldl needs.

reverse' xs = foldl (\acc x -> x : acc) [] xs

test_reverse = [
    reverse "Haskell" == "lleksaH"
  , reverse [1..10]   == [10, 9 .. 1]
  ]

-- Ex: redefine the Prelude function zipWith

zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith f (x:xs) (y:ys) = f x y : zipWith f xs ys
zipWith f _      _      = []

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

iterate :: (a -> a) -> a -> [a]
iterate f x = x : iterate f (f x)

test_iterate = [
    take 5 (iterate (+ 1) 0)   == [0,1,2,3,4]
  , take 4 (iterate ('a':) "") == ["", "a", "aa", "aaa"]
  ]

-- Ex: construct an infinite list of Fibonacci numbers

fibs :: [Integer]
fibs = map fst (iterate (\(actual, next) -> (next, actual + next)) (0, 1))

test_fibs = [
    take 6 fibs == [0, 1, 1, 2, 3, 5]
  ]

-- Ex: construct an infinite list of primes

primes :: [Integer]
primes = tail (iterate nextPrime 1)
  where
    nextPrime :: Integer -> Integer
    nextPrime n = head (filter isPrime [n + 1..])

    isPrime :: Integer -> Bool
    isPrime n = null [d | d <- [2..n `div` 2], n `mod` d == 0]
    

test_primes = [
    take 4 primes == [2, 3, 5, 7]
  ]