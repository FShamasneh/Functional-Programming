-- Keywords:
-- Value constructors; are actually functions that return a value of a data type.
-- type signiture
-- polymorphic type

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point deriving (Show)  

surface :: Shape -> Float  
surface (Circle _ r) = pi * r ^ 2  
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- if i want to be able to display Circle 10 20 5 i have to add "deriving (Show)" in the data type decleration.

-- Value constructors are functions, so we can map them and partially apply them and everything. 
-- If we want a list of concentric circles with different radii, we can do this.
-- map (Circle 10 20) [4,5,6,6] 

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = (Circle (Point (x+a) (y+b)) r)
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = (Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b)))

baseCircle :: Float -> Shape
baseCircle r = (Circle (Point 0 0) r) 

baseRect :: Float -> Float -> Shape
baseRect x y = (Rectangle (Point 0 0) (Point x y))


-- Record Syntax
-- data Person = Person String String Int Float String String deriving (Show)  

-- another better way to define the above. 
data Person = Person { firstName :: String  
                     , lastName :: String  
                     , age :: Int  
                     , height :: Float  
                     , phoneNumber :: String  
                     , flavor :: String  
                     } deriving (Show)
-- Haskell automatically made these functions: firstName, lastName, age, height, phoneNumber and flavor
-- try: let guy = Person "Buddy" "Finklestein" 43 184.2 "526-2928" "Chocolate"
-- firstName guy 

-- Type Parameter (Usually we use them when our data type would work regardless of the type of the value it holds inside it)
data Maybe' a = Nothing' | Just' a  deriving (Show)

-- another example for data
-- data Car = Car { company :: String  
--                , model :: String  
--                , year :: Int  
--                } deriving (Show) 

data Car a b c = Car { company :: a  
                     , model :: b  
                     , year :: c   
                     } deriving (Show) 

tellCar :: (Show a) => Car String String a  -> String  
tellCar (Car {company = c, model = m, year = y}) = "This " ++ c ++ " " ++ m ++ " was made in " ++ show y  

-- vectors example 
data Vector a = Vector a a a deriving (Show)

vplus :: (Num t) => Vector t -> Vector t -> Vector t  
(Vector i j k) `vplus` (Vector l m n) = Vector (i+l) (j+m) (k+n)  

vectMult :: (Num t) => Vector t -> t -> Vector t  
(Vector i j k) `vectMult` m = Vector (i*m) (j*m) (k*m)  
  
scalarMult :: (Num t) => Vector t -> Vector t -> t  
(Vector i j k) `scalarMult` (Vector l m n) = i*l + j*m + k*na

-- Typeclasses 102
-- How to make our own typeclasses and how to make types instances of them by hand.
