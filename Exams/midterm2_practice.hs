import Control.DeepSeq
import Control.Exception
import System.IO.Unsafe
import Data.Char
import Data.Either
import Data.Function
import Data.List



data Measure
  = Land Int
  | Sea
  deriving (Show, Eq)


type Measures = [Measure]

testMeasures1 :: Measures
testMeasures1 = []

testMeasures2 :: Measures
testMeasures2 =
  [ Land 300, Land 200, Land 400, Sea, Sea, Land 300, Land 200, Land 150, Sea
  , Land 40, Land 80, Land 500, Land 650, Land 890, Land 300, Sea, Sea, Sea
  , Sea, Land 40 ]

testMeasures3 :: Measures
testMeasures3 =
  [ Sea, Sea, Sea, Land 50, Land 100, Land 10, Sea, Land 30, Land 80, Land 350
  , Land 700, Land 980, Land 600, Land 200, Land 40, Sea, Sea, Sea, Sea ]


isLand :: Measure -> Bool
isLand (Land x) 
                | x > 0      = True 
                | otherwise = False          
isLand (Sea ) = False

test_isLand = 
  [ isLand Sea       == False
  , isLand (Land 40) == True
  , isLand (Land 30) == True
  ]


hasSea :: Measures -> Bool
hasSea [] = False
hasSea (m1:ms) 
              | isLand m1 == True = hasSea ms
              | otherwise = True

test_hasSea =
  [ hasSea testMeasures1 == False
  , hasSea testMeasures2 == True
  , hasSea testMeasures3 == True
  ]

isEqualTwoMeasurements :: Measure -> Measure -> Bool
isEqualTwoMeasurements (Land _) (Land _) =True
isEqualTwoMeasurements (Sea) (Sea) = True
isEqualTwoMeasurements _ _ = False

splitSegments :: Measures -> [Measures]
splitSegments  = groupBy isEqualTwoMeasurements  

test_splitSegments =
  [ splitSegments testMeasures1 == ([] :: [Measures])
  , splitSegments testMeasures2 == [ [Land 300,Land 200,Land 400]
                                   , [Sea,Sea]
                                   , [Land 300,Land 200,Land 150]
                                   , [Sea]
                                   , [Land 40,Land 80,Land 500,Land 650,Land 890,Land 300]
                                   , [Sea,Sea,Sea,Sea]
                                   , [Land 40]
                                   ]
  , splitSegments testMeasures3 == [ [Sea,Sea,Sea]
                                   , [Land 50,Land 100,Land 10]
                                   , [Sea]
                                   , [Land 30,Land 80,Land 350,Land 700,Land 980,Land 600,Land 200,Land 40]
                                   , [Sea,Sea,Sea,Sea]
                                   ]
  ]


isLandMeasurements_firstElementCheck :: Measures -> Bool
isLandMeasurements_firstElementCheck ((Land _):ms) = True
isLandMeasurements_firstElementCheck ((Sea):ms)    = False
                         

islandCount :: Measures -> Int
islandCount ms = sum [ 1 | m <- (splitSegments ms), isLandMeasurements_firstElementCheck m]

-- Another way: 
-- islandCount :: Measures -> Int
-- islandCount ms = length $ concat $ map (filter isLandMeasurements_firstElementCheck) [(splitSegments ms)]
                   

test_islandCount =
  [ islandCount testMeasures1 == 0
  , islandCount testMeasures2 == 4
  , islandCount testMeasures3 == 2
  ] 


lengthOfIslands :: Measures -> [Int]
lengthOfIslands ms =  [ (length m) | m <- (splitSegments ms), isLandMeasurements_firstElementCheck m]

test_lengthOfIslands =
  [ lengthOfIslands testMeasures1 == ([] :: [Int])
  , lengthOfIslands testMeasures2 == [3,3,6,1]
  , lengthOfIslands testMeasures3 == [3,8]
  ]

isAllElementsDiffer :: [Int] -> Bool
isAllElementsDiffer [] = True
isAllElementsDiffer (x:xs) 
                          |  x `elem` xs = False
                          | otherwise = isAllElementsDiffer xs


-- hasIslandsOfSameLength :: Measures -> Bool
-- hasIslandsOfSameLength ms
--                         | isAllElementsDiffer (lengthOfIslands ms) = False
--                         | otherwise = True 
                         

getLandLength :: Measure -> Int 
getLandLength (Land l) = l

findOnlyIslands :: Measures -> [Int] 
findOnlyIslands [] = []
findOnlyIslands (m:ms) 
                   | isLand m = (getLandLength m):findOnlyIslands ms
                   | otherwise = findOnlyIslands ms

hasIslandsOfSameLength :: Measures -> Bool
hasIslandsOfSameLength ms
                       | isAllElementsDiffer (findOnlyIslands ms) = False
                       | otherwise = True

test_hasIslandsOfSameLength =
  [ hasIslandsOfSameLength testMeasures1 == False
  , hasIslandsOfSameLength testMeasures2 == True
  , hasIslandsOfSameLength testMeasures3 == False
  ]

findHowManyMax :: [Int] -> Int
findHowManyMax xs = sum [1 | x <- xs , x == maximum xs] 

-- highestIsland :: Measures -> Maybe Int
-- highestIsland ms 
--                  | findHowManyMax (lengthOfIslands ms) > 0 = Just $ findHowManyMax (lengthOfIslands ms)
--                  | otherwise = Nothing

highestIsland :: Measures -> Maybe Int
highestIsland ms 
                 | findHowManyMax (findOnlyIslands ms) > 0 = Just $ findHowManyMax (findOnlyIslands ms) 
                 | otherwise = Nothing

test_highestIsland = 
  [ highestIsland testMeasures1 == (Nothing :: Maybe Int)
  , highestIsland testMeasures2 == Just 2
  , highestIsland testMeasures3 == Just 1
  ]

hypotenuse :: Int -> Int -> Int
hypotenuse a b = round  $ sqrt $ (fromIntegral  (a^2)) + (fromIntegral  (b^2))

test_hypotenuse =
  [ hypotenuse 500 0   == 500
  , hypotenuse 500 30  == 501
  , hypotenuse 130 350 == 373
  ]

walkingDistance :: Int -> Measure -> Measure -> Int
walkingDistance d1 (Sea) (Sea) = d1
walkingDistance d1 (Land x1) (Land x2) = hypotenuse d1 (subtract x1 x2) 
walkingDistance d1 (Sea) (Land x1) = hypotenuse d1 (x1)
walkingDistance d1 (Land x1) (Sea) = hypotenuse d1 (x1)


test_walkingDistance =
  [ walkingDistance 500 Sea Sea               == 500
  , walkingDistance 500 Sea (Land 100)        == 510
  , walkingDistance 500 (Land 100) (Land 660) == 751
  ]

fullWalkingDistance :: Int -> Measures -> Int
fullWalkingDistance _ [x] = 0
fullWalkingDistance d (x:y:m) = walkingDistance d x y + fullWalkingDistance d (y:m)

test_fullWalkingDistance =
  [ fullWalkingDistance 500 testMeasures1 == 0
  , fullWalkingDistance 500 testMeasures2 == 10398
  , fullWalkingDistance 500 testMeasures3 == 9561
  ] 