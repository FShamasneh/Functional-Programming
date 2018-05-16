-- Functional languages practice 05

import Prelude hiding ((&&), not, (||), fst, head, tail)
import Data.Char (toUpper)

not :: Bool -> Bool
not True = False
not _    = True

-- Ex:

(&&) :: Bool -> Bool -> Bool
True && True = True
_    && _    = False

-- Ex:

(||) :: Bool -> Bool -> Bool
False || False = False
_     || _     = True

-- Ex:

ifthenelse :: Bool -> a -> a -> a
ifthenelse True x y = x
ifthenelse _    x y = y

-- Ex:

xor :: Bool -> Bool -> Bool
xor True  False = True
xor False True  = True
xor _     _     = False

-- Ex: we did this before but this was actually pattern matching

fst :: (a,b) -> a
fst (x, _) = x

-- Ex: replaceNewline '\n' should be '_', everything else unchanged

replaceNewline :: Char -> Char
replaceNewline '\n' = '_'
replaceNewline c    = c

-- Ex: modulo 3 addition: sum3 2 2 = 1, sum3 1 2 = 0, sum3 1 1 = 2,
-- etc. Try to make it short!

sum3 :: Int -> Int -> Int
sum3 0 n = n
sum3 n 0 = n
sum3 1 1 = 2
sum3 1 2 = 0
sum3 2 1 = 0
sum3 2 2 = 1

-- list patterns

test0 :: [Char] -> Bool
test0 ['a',_,_] = True
test0 _ = False

-- Ex:

isSingleton :: [a] -> Bool
isSingleton [_] = True
isSingleton _   = False

-- 

test :: [Char] -> Bool
test ('a':_) = True
test _ = False

-- Ex:

head :: [a] -> a
head (x:_) = x
{-
head _     = error "head: empty list"
-}

-- Ex:

tail :: [a] -> [a]
tail (_:xs) = xs
{-
tail _      = error "tail: empty list"
-}

-- Ex: True, if there is a character 'a' in the first three characters
-- of the input

aInFirst3 :: [Char] -> Bool
aInFirst3 ('a':_)     = True
aInFirst3 (_:'a':_)   = True
aInFirst3 (_:_:'a':_) = True
aInFirst3 _           = False