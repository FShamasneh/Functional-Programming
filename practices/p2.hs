-- Functional languages practice 02

import Prelude hiding (even, fst, snd)

-- 2. Types and classes

-- 2.1 Basic types

-- Bool, Char, String, Int, Integer, Float, Double

-- 2.2 List

-- sequence of elements of the same type

-- 2.3 Lists of lists

-- 2.4 Tuple

-- fixed number of elements of different types

-- 2.5 Exercises

-- Try ('a', True)

-- Try (True, 'a')

-- Try :type ('a', True)

-- Try :type (True, 'a')

-- Try :type ('b', False, "hello")

-- Try :type [True, 'a']

tuple1 :: (Int, String, Bool)
tuple1 = undefined

tuple2 :: (Bool, String, [Char])
tuple2 = undefined

tuple3 :: ([Int], [[Bool]], [(Int, Bool)])
tuple3 = undefined

-- 2.6 Function types

-- notation: function :: argument type -> result type

-- 2.7 Exercises

-- Try :type not

-- Ex: zeroto 5 should be [0,1,2,3,4,5]

zeroto :: Int -> [Int]
zeroto n = undefined

-- Ex: add (2, 4) should be 6

add :: (Int, Int) -> Int
add (x, y) = undefined

-- 2.8 Polymorphic types

-- Try :type head

-- Try :type tail

-- Try :type take

-- Try :type drop

-- Try :type zip

-- Ex: what does zip do?

-- Try :type id

-- Ex: what does id do? Can you give another definition of id?

-- Ex: operations

operations :: [[a] -> [a]]
operations = undefined

-- Ex: copy

copy :: a -> (a, a)
copy x = undefined

-- Ex:

fst :: (a,a) -> a
fst (x,y) = undefined

-- Ex:

snd :: (a,b) -> b
snd (x,y) = undefined

-- Ex:

copy' :: a -> (a,b)
copy' x = undefined

-- Ex:

missionImpossible :: b
missionImpossible = undefined

-- Ex: pair

pair :: a -> b -> (a, b)
pair x y = undefined

-- Ex: swap

swap :: (a, b) -> (b, a)
swap (x, y) = undefined