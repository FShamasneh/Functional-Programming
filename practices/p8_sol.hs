-- Functional languages practice 08

import Prelude hiding (sum, init, last, minimum, concat, (++), zip, elem)
import Data.Char (toUpper)

-- recursion

-- Ex: redefine sum, e.g. sum [1,3,2,4] = 10

sum :: Num a => [a] -> a
sum [] = 0
sum (x:xs) = x + sum xs

-- Exs: redefine the following Prelude functions

last :: [a]{-non-empty-} -> a
last [x]    = x
last (x:xs) = last xs

init :: [a]{-non-empty-} -> [a]
init [x]    = []
init (x:xs) = x : init xs

minimum :: Ord a => [a]{-finite, non-empty-} -> a
minimum [x]                = x
minimum (x:xs) | x < y     = x
               | otherwise = y
  where
    y = minimum xs

concat :: [[a]] -> [a]
concat [] = []
concat ([]:xss) = concat xss
concat ((x:xs):xss) = x : concat (xs:xss)

(++) :: [a] -> [a] -> [a]
[]     ++ ys = ys
(x:xs) ++ ys = x : (xs ++ ys)

-- Ex: merge two ordered lists:

merge :: Ord a => [a] -> [a] -> [a]
merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) | x < y     = x : merge xs (y:ys)
                    | otherwise = y : merge (x:xs) ys

-- Ex: redefine the function for combining lists into a list of pairs (which is called “zipping”).

zip :: [a] -> [b] -> [(a,b)]
zip [] _ = []
zip _ [] = []
zip (x:xs) (y:ys) = (x, y) : zip xs ys

-- Ex: redefine the isPrefixOf function from the Data.List module
-- which determines if the second parameter starts with the first
-- parameter (and contains it entirely). If this is true, then we say
-- that the first parameter is the prefix of the second.

isPrefixOf :: Eq a => [a] -> [a] -> Bool
isPrefixOf [] _ = True
isPrefixOf _ [] = False
isPrefixOf (x:xs) (y:ys) | x == y    = isPrefixOf xs ys
                         | otherwise = False

-- Ex: redefine the elem function which decides a value is element of a list.

elem :: Eq a => a -> [a]{-finite-} -> Bool
elem x []                 = False
elem x (y:ys) | x == y    = True
              | otherwise = elem x ys

-- Ex: the nub function is to remove duplicate elements from a list.
-- E.g. nub [1,1,2,1,1,2,2,3] = [1, 2, 3]

nub :: Eq a => [a] -> [a]
nub [] = []
nub (x:xs) | x `elem` ys = ys
           | otherwise   = x : ys
  where
    ys = nub xs

-- Ex: split a list into segments of a given length. E.g.
-- runs 3 [1..10] = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]

runs :: Int -> [a] -> [[a]]
runs n [] = []
runs n xs = take n xs : runs n (drop n xs)
            

-- Ex: split a list into segments of lengths given in another
-- list. E.g. slice [3,2,3] [1..10] = [[1, 2, 3], [4, 5], [6, 7, 8]],
-- slice [3,2,3,4,2] [1..10] = [[1, 2, 3], [4, 5], [6, 7, 8], [9, 10], []]

slice :: [Int] -> [a] -> [[a]]
slice [] _ = []
slice (n:ns) xs = take n xs : slice ns (drop n xs)