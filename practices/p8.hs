-- Functional languages practice 08

import Prelude hiding (sum, init, last, minimum, concat, (++), zip, elem)
import Data.Char (toUpper)

-- recursion

-- Ex: redefine sum, e.g. sum [1,3,2,4] = 10

sum :: Num a => [a] -> a
sum = undefined

-- Exs: redefine the following Prelude functions

last :: [a]{-non-empty-} -> a
last = undefined

init :: [a]{-non-empty-} -> [a]
init = undefined

minimum :: Ord a => [a]{-finite, non-empty-} -> a
minimum = undefined

concat :: [[a]] -> [a]
concat = undefined

(++) :: [a] -> [a] -> [a]
(++) = undefined

-- Ex: merge two ordered lists:

merge :: Ord a => [a] -> [a] -> [a]
merge = undefined

-- Ex: redefine the function for combining lists into a list of pairs (which is called “zipping”).

zip :: [a] -> [b] -> [(a,b)]
zip = undefined

-- Ex: redefine the isPrefixOf function from the Data.List module
-- which determines if the second parameter starts with the first
-- parameter (and contains it entirely). If this is true, then we say
-- that the first parameter is the prefix of the second.

isPrefixOf :: Eq a => [a] -> [a] -> Bool
isPrefixOf = undefined

-- Ex: redefine the elem function which decides a value is element of a list.

elem :: Eq a => a -> [a]{-finite-} -> Bool
elem = undefined

-- Ex: the nub function is to remove duplicate elements from a list.
-- E.g. nub [1,1,2,1,1,2,2,3] = [1, 2, 3]

nub :: Eq a => [a] -> [a]
nub = undefined

-- Ex: split a list into segments of a given length. E.g.
-- runs 3 [1..10] = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]

runs :: Int -> [a] -> [[a]]
runs = undefined

-- Ex: split a list into segments of lengths given in another
-- list. E.g. slice [3,2,3] [1..10] = [[1, 2, 3], [4, 5], [6, 7, 8]],
-- slice [3,2,3,4,2] [1..10] = [[1, 2, 3], [4, 5], [6, 7, 8], [9, 10], []]

slice :: [Int] -> [a] -> [[a]]
slice = undefined