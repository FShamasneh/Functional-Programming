-- HOF:
intersperse '.' "MONKEY"   -> "M.O.N.K.E.Y"
intercalate " " ["hey","there","guys"]  -> "hey there guys"  
 

4 `elemIndex` [1,2,3,4,5,6]  -> Just 3  
' ' `elemIndices` "Where are the spaces?" [5,9,13]  
findIndex (==4) [5,3,2,1,6,4] -> Just 5  
findIndices (`elem` ['A'..'Z']) "Where Are The Caps?"  -> [0,6,10,14]  \

delete 'h' "hey there ghang!" 
\\ --> [1..10] \\ [2,5,9]

splitAt 

insert 'g' $ ['a'..'f'] ++ ['h'..'z']  
-------------------------------------------------
-- More Important: 
and 
or 

any
all

takeWhile 
dropWhile 
span 

sort 
group 


inits 

isInfixOf
partition

words 
unwords
lines 
unlines 
nub 