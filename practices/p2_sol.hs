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
tuple1 = (2, "hello", True)

-- String is the same as [Char]

tuple2 :: (Bool, String, [Char])
tuple2 = (True, "something", "abc")

tuple3 :: ([Int], [[Bool]], [(Int, Bool)])
tuple3 = ([1,2], [[False], [True, False]], [(1, False), (0, True)])

-- 2.6 Function types

-- notation: function :: argument type -> result type

-- 2.7 Exercises

-- Try :type not

-- Ex: zeroto 5 should be [0,1,2,3,4,5]

zeroto :: Int -> [Int]
zeroto n = [0..n]

-- Ex: add (2, 4) should be 6

add :: (Int, Int) -> Int
add (x, y) = x + y

-- 2.8 Polymorphic types

-- Try :type head

-- Try :type tail

-- Try :type take

-- Try :type drop

-- Try :type zip

-- Ex: what does zip do?

-- Answer: pairs up elements from two lists.

-- Try :type id

-- Ex: what does id do? Can you give another definition of id?

-- Answer:
--   It simply returns its parameter.
--   id :: a -> a
--   id x = x
--
--   No, there are no more function definitions such that the type is a -> a.
--   Except id x = id x but that's useless, and some languages does not even accept that. Haskell does.

-- Ex: operations

-- 'drop 2' is called partial function application

operations :: [ [a] -> [a] ]
operations = [id, tail, drop 2, reverse]

-- Ex: copy

copy :: a -> (a, a)
copy x = (x, x)

-- Ex:

-- The type of the real fst is (a, b) -> a.

fst :: (a,a) -> a
fst (x,y) = x

--fst (x,y) = y

-- Ex:

snd :: (a,b) -> b
snd (x,y) = y

-- Ex:

copy' :: a -> (a,b)
copy' x = undefined -- The second component makes it impossible to define copy'.

-- Ex:

missionImpossible :: b
missionImpossible = undefined -- It's simply impossible. Sorry.

-- Ex: pair

pair :: a -> b -> (a, b)
pair x y = (x, y)

-- Ex: swap

swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)