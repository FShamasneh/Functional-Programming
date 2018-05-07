-- Keywords:
-- Value constructors; are actually functions that return a value of a data type.
-- type signiture

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

