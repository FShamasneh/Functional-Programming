-- Functional languages practice 06

import Data.Char (toUpper)

-- repetition

-- Ex: change the first character to uppercase (use toUpper from Data.Char)

toUpperFirst :: String -> String
toUpperFirst = undefined

-- pattern matching

-- Ex: return True if the length of the list is 2 or 3. Don't use the
-- length function.

len2or3 :: [a] -> Bool
len2or3 = undefined

-- Ex: return the first element of the first list, the second element
-- of the second list and the third element of the third list

one23 :: ([a],[b],[c]) -> (a,b,c)
one23 = undefined

-- lambda expressions

add3 :: Int -> Int
add3 = \x -> x + 3

-- Ex: write it using lambdas

add :: Int -> Int -> Int
add = undefined

-- map

odds :: Int -> [Int]
odds n = map (\ x -> 2*x+1) [0..(n-1)]

-- Ex: change the first characters of all words to uppercase. Use
-- functions words, unwords.

toUpperFirsts :: String -> String
toUpperFirsts = undefined

-- Ex: powersOf2 n returns the first n powers of two.

powersOf2 :: Int -> [Int]
powersOf2 = undefined