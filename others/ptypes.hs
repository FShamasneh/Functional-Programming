-- Functional languages practice 10

import Prelude hiding (exp)

-- The following is needed to define Time without any way to
-- construct a value of it. Once you completed the
-- exercises, you can remove the next line.
{-# LANGUAGE EmptyDataDecls #-}

-- EmptyDataDecls is a language extension that allows us
-- to define empty types (having no constructors).
-- There are plenty of extensions to Haskell.

-- Ex: define a type for the days of week

data Day = Sunday| Monday| Tuesday| Wednesday| Thursday| Friday| Saturday deriving (Show)

-- Ex: test whether a day is the first in a week

isFirstDayOfWeek :: Day -> Bool
isFirstDayOfWeek (Sunday) = True
isFirstDayOfWeek _  = False

-- Type synonyms often make the code lot more easier to read.

type Hour   = Int
type Minute = Int

-- There is no difference between Hour and Int.

-- Ex: define a new data type for time. It should store the hour and
-- the minute.

data Time = Time Hour Minute deriving (Show)

-- Ex: define a way to show a Time value. We can use it to see the
-- hour and minute in a Time.
-- The result could be "16.00".
-- You can use 'show' to convert an Int to String.

showTime :: Time -> String
showTime (Time h m) = show h ++ ":" ++ show m 

-- Note: most of the time, we can ask GHC to write a very simple
-- showTime for us. This can be done with the deriving construct:

-- data Time = ...
--   deriving Show

-- This showTime probably is not as pretty as ours.

-- Ex: define equality over Time values.

eqTime :: Time -> Time -> Bool
eqTime (Time h1 m1) (Time h2 m2) 
								|  h1 == h2  && m1 == m2 = True
								| otherwise = False
								

-- Ex: define the 'isEarlier' relation between Time values

isEarlier :: Time -> Time -> Bool
isEarlier (Time h1 m1) (Time h2 m2) 
                                    | h1 < h2 = True
                                    | h1 == h2 && m1 < m2 = True
                                    | otherwise = False

-- Ex: define the 'isBetween' relation between Time values

isBetween :: Time -> Time -> Time -> Bool
isBetween (Time h1 m1) (Time h2 m2) (Time h3 m3)
												| h1 < h2 && h2 < h3 	  		                     = True
												| (h1 == h2) && (h2 == h3) && (m1 < m2) && (m2 < m3) = True
												| otherwise 						                 = False 

-- Ex: define a smart constructor for Time. It rejects invalid hours
-- and minutes with error.
-- Note the type. This is where type synonyms are useful.

time :: Hour -> Minute -> Time
time h m 
         | h `elem` [0..24] && m `elem` [0..59] = (Time h m)
         | otherwise = (Time 0 0)

-- Ex: define a variant of Time that stores time in AM PM format.
-- There should be two ways to construct it:
-- AM hour minute and PM hour minute.

data UKTime = PM Hour Minute | AM Hour Minute deriving (Show)

-- Ex: define a way to show a UKTime. Like "1.00 pm" or "10.00 am"

showUKTime :: UKTime -> String
showUKTime (PM h m) = "PM " ++ show h ++ ":" ++ show m 
showUKTime (AM h m) = "AM " ++ show h ++ ":" ++ show m 
						
-- Ex: define a conversion between Time and UKTime.

ukTimeToTime :: UKTime -> Time
ukTimeToTime (PM h m) = (Time (h+12) m)
ukTimeToTime (AM h m) = (Time h m)


timeToUKTime :: Time -> UKTime
timeToUKTime (Time h m) 
                       | h > 12    = (PM (h - 12) m)
                       | otherwise = (AM h m )  

-- Cookies

-- Ex: define a privilege type for a web application.
-- There are user and admin privileges.
-- This is an enumeration type (none of the constructors have parameters).

data Privilege = Admin | User


-- Ex: define a cookie type for user state.
-- A user is either logged out, or is logged in and has a username
-- and privilege.

data Cookie = Logged_Out | Logged_In Username Privilege

-- We model the database with a list of rows in user table.

type Username = String
type Password = String
type Database = [(Username, Password, Privilege)]

-- Advanced exercises

-- Ex: Define a type for natural numbers.
-- There should be two ways to write a natural number.
-- It can be either zero or (n + 1) where n is a natural number.
-- This is called Peano number.

-- data Nat = indef

-- -- Ex: define two natural numbers: one and two

-- one :: Nat
-- one = undefined

-- two :: Nat
-- two = undefined

-- -- Ex: define addition over natural numbers

-- add :: Nat -> Nat -> Nat
-- add = undefined

-- -- Ex: define multiplication over natural numbers

-- mul :: Nat -> Nat -> Nat
-- mul = undefined

-- -- Ex: define exponentiation over natural numbers

-- exp :: Nat -> Nat -> Nat
-- exp = undefined

-- type 102
class YesNo a where  
    yesno :: a -> Bool

instance YesNo Int where
	yesno 0 = False
	yesno _ = True

instance YesNo [a] where  
    yesno [] = False  
    yesno _ = True  

instance YesNo (Maybe a) where  
    yesno (Just _) = True  
    yesno Nothing = False 

instance YesNo Bool where  
    yesno = id   

yesnoIf :: (YesNo y) => y -> a -> a -> a  
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult