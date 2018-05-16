-- Functional languages practice 05

import Prelude hiding ((&&), not, (||), fst, head, tail)
import Data.Char (toUpper)

not :: Bool -> Bool
not True = False
not _    = True

-- Ex:

(&&) :: Bool -> Bool -> Bool
a && b = undefined

-- Ex:

(||) :: Bool -> Bool -> Bool
a || b = undefined

-- Ex:

ifthenelse :: Bool -> a -> a -> a
ifthenelse b x y = undefined

-- Ex:

xor :: Bool -> Bool -> Bool
xor = undefined

-- Ex: we did this before but this was actually pattern matching

fst :: (a,b) -> a
fst = undefined

-- Ex: replaceNewline '\n' should be '_', everything else unchanged

replaceNewline :: Char -> Char
replaceNewline = undefined

-- Ex: modulo 3 addition: sum3 2 2 = 1, sum3 1 2 = 0, sum3 1 1 = 2,
-- etc. Try to make it short!

sum3 :: Int -> Int -> Int
sum3 = undefined

-- list patterns

test0 :: [Char] -> Bool
test0 ['a',_,_] = True
test0 _ = False

-- Ex:

isSingleton :: [a] -> Bool
isSingleton = undefined

-- 

test :: [Char] -> Bool
test ('a':_) = True
test _ = False

-- Ex:

head :: [a] -> a
head = undefined

-- Ex:

tail :: [a] -> [a]
tail = undefined

-- Ex: True, if there is a character 'a' in the first three characters
-- of the input

aInFirst3 :: [Char] -> Bool
aInFirst3 = undefined

-- Ex: change the first character to uppercase (use toUpper from Data.Char)

toUpperFirst :: String -> String
toUpperFirst = undefined