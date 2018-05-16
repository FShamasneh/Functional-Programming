-- Functional languages practice 11

-- data MaybeInt  = JustInt Int   | NoInt
-- data MaybeBool = JustBool Bool | NoBool

-- Parametric type:
-- data Maybe a = Just a | Nothing

-- Ex: write some example values.

anInt :: Maybe Int
anInt = Just 0

anInt' :: Maybe Int
anInt' = Nothing

aChar :: Maybe Char
aChar = Just 'c'

aChar' :: Maybe Char
aChar' = Nothing

-- Ex: write a total variant of head:
-- returns Just x for a non-empty list, Nothing for an empty list.

safeHead :: [a] -> Maybe a
safeHead (x:xs) = Just x
safeHead []     = Nothing

-- Ex: define a function that looks up an element with a given key

lookup :: Eq a => a -> [(a, b)] -> Maybe b
lookup _ [] = Nothing
lookup x ((a, b) : pairs)  -- these 'a' and 'b' are different than in the above type 
  | x == a    = Just b
  | otherwise = Nothing