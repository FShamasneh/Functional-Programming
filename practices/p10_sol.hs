-- Functional languages practice 10

import Prelude hiding (exp)

-- The following is needed to define Time without any way to
-- construct a value of it. Once you completed the
-- exercises, you can remove the next line.
{-# LANGUAGE EmptyDataDecls #-}

-- EmptyDataDecls is a language extension that allows us
-- to define empty types (having no constructors).
-- There are plenty of extensions to Haskell.

data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun

isFirstDayOfWeek :: Day -> Bool
isFirstDayOfWeek Mon = True
isFirstDayOfWeek _   = False

-- Type synonyms often make the code lot more easier to read.

type Hour   = Int
type Minute = Int

-- There is no difference between Hour and Int.

-- Ex: define a new data type for time. It should store the hour and
-- the minute.

data Time = ATime Int Int
  deriving Show

-- same as
-- data Time = ATime Hour Minute
--   deriving Show

-- Ex: define a way to show a Time value. We can use it to see the
-- hour and minute in a Time.
-- The result could be "16.00".
-- You can use 'show' to convert an Int to String.

showTime :: Time -> String
showTime (ATime h m) = show h ++ "." ++ show m

-- Note: most of the time, we can ask GHC to write a very simple
-- showTime for us. This can be done with the deriving construct:

-- data Time = ...
--   deriving Show

-- This showTime probably is not as pretty as ours.

-- Ex: define equality over Time values.

eqTime :: Time -> Time -> Bool
eqTime (ATime h m) (ATime h' m') = h == h' && m == m'

-- Ex: define the 'isEarlier' relation between Time values

isEarlier :: Time -> Time -> Bool
isEarlier (ATime h m) (ATime h' m')
  | h == h'   = m < m'
  | otherwise = h < h'

-- Ex: define the 'isBetween' relation between Time values

isBetween :: Time -> Time -> Time -> Bool
isBetween t1 t2 t3 = (t1 `isEarlier` t2 && t2 `isEarlier` t3) ||
                     (t3 `isEarlier` t2 && t2 `isEarlier` t1)

-- Ex: define a smart constructor for Time. It rejects invalid hours
-- and minutes with error.
-- Note the type. This is where type synonyms are useful.

time :: Hour -> Minute -> Time
time h m
  | h < 0 || h > 23 = error ("time: invalid hour: " ++ show h)
  | m < 0 || m > 59 = error ("time: invalid minute: " ++ show m)
  | otherwise       = ATime h m

-- Ex: define a variant of Time that stores time in AM PM format.
-- There should be two ways to construct it:
-- AM hour minute and PM hour minute.

data UKTime = AM Int Int
            | PM Int Int
  deriving Show

--  same as
-- data UKTime = AM Hour Minute
--             | PM Hour Minute
--   deriving Show

-- Ex: define a way to show a UKTime. Like "1.00 pm" or "10.00 am"

showUKTime :: UKTime -> String
showUKTime (AM h m) = show h ++ "." ++ show m ++ " am"
showUKTime (PM h m) = show h ++ "." ++ show m ++ " pm"

-- Ex: define a conversion between Time and UKTime.

ukTimeToTime :: UKTime -> Time
ukTimeToTime (AM h m)
  | h == 12   = ATime 0 m
  | otherwise = ATime h m
ukTimeToTime (PM h m)
  | h == 12   = ATime h m
  | otherwise = ATime (h + 12) m

timeToUKTime :: Time -> UKTime
timeToUKTime (ATime h m)
  | h == 0    = AM 12 m
  | h <= 11   = AM h m
  | h == 12   = PM 12 m
  | otherwise = PM (h - 12) m

-- Cookies

-- Ex: define a privilege type for a web application.
-- There are user and admin privileges.
-- This is an enumeration type (none of the constructors have parameters).

data Privilege = User | Admin
  deriving Show

-- Ex: define a cookie type for user state.
-- A user is either logged out, or is logged in and has a username
-- and privilege.

data Cookie = LoggedOut | LoggedIn Username Privilege
  deriving Show

-- We model the database with a list of rows in user table.

type Username = String
type Password = String
type Database = [(Username, Password, Privilege)]

-- Advanced exercises

-- Ex: Define a type for natural numbers.
-- There should be two ways to write a natural number.
-- It can be either zero or (n + 1) where n is a natural number.
-- This is called Peano number.

data Nat = Zero | Succ Nat
  deriving Show

-- Ex: define two natural numbers: one and two

one :: Nat
one = Succ Zero

two :: Nat
two = Succ (Succ Zero)

-- Ex: define addition over natural numbers

add :: Nat -> Nat -> Nat
add Zero     m = m
add (Succ n) m = Succ (add n m)

-- Ex: define multiplication over natural numbers

mul :: Nat -> Nat -> Nat
mul Zero     _ = Zero
mul (Succ n) m = add m (mul n m)

-- Ex: define exponentiation over natural numbers

exp :: Nat -> Nat -> Nat
exp n Zero     = one
exp n (Succ m) = mul (exp n m) n