data Time   = Time Int Int
data UKTime = AM Int Int
             |PM Int Int

instance Show Time where
	show (Time h m) = show h  ++ ":" ++ show m

instance  Show UKTime where
	show (PM h m) = show h ++ ":" ++ show m ++ " pm"
	show (AM h m) = show h ++ ":" ++ show m ++ " am"

instance Eq Time where
	(Time h m) == (Time h' m') = h==h' && m==m'
	(Time h m) /= (Time h' m') = h /= h' || m /= m'


{-
eqInt  :: Int -> Int -> Int
eqBool :: Bool -> Bool -> Bool
-}


--Nullable 

{-

-}

class Nullable a where 
	isNull    :: a -> Bool
	isNotNull :: a -> Bool


data File = File String 

instance Nullable File where
	isNull    (File contents)    = contents == [] 
	isNotNull (File contents)    = contents /= [] 
