data Time = Time Int Int
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
