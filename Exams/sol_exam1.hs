

type Position = (Int, Int)

type Dir = Position -> Position
type Snake = (Dir, [Position], Int)

west, east, north, south :: Dir
west  (x,y) = (x-1,y)
east  (x,y) = (x+1,y)
north (x,y) = (x,y+1)
south (x,y) = (x,y-1)

testDirs :: [Bool]
testDirs = [ south (0,0) == (0,-1)
           , east  (3,3) == (4,3)
           , north (3,2) == (3,3)
           , west  (2,2) == (1,2)
           , east (west (0,0)) == (0,0)
           , north (west (0,0)) == (-1,1)
           ]
             
isWest, isEast, isNorth, isSouth :: Dir -> Bool
isWest  d = d (0,0) == (-1, 0)
isEast  d = d (0,0) == ( 1, 0)
isNorth d = d (0,0) == ( 0, 1)
isSouth d = d (0,0) == ( 0,-1)

testIsDirs :: [Bool]
testIsDirs = [ isWest  west
             , isEast  east
             , isNorth north
             , isSouth south
             , not (isWest south)
             , not (isNorth west)
             , not (isEast west)
             , not (isSouth east)
             , not (isSouth west)
             , not (isSouth north)
             ]
            
eqDir :: Dir -> Dir -> Bool
eqDir d d' = d (0,0) == d' (0,0)

testEqDir :: [Bool]
testEqDir = [ west  `eqDir` west
            , east  `eqDir` east
            , north `eqDir` north
            , south `eqDir` south
            , not (west  `eqDir` east)
            , not (west  `eqDir` north)
            , not (west  `eqDir` south)
            , not (east  `eqDir` west)
            , not (east  `eqDir` north)
            , not (east  `eqDir` south)
            , not (north `eqDir` west)
            , not (north `eqDir` east)
            , not (north `eqDir` south)
            , not (south `eqDir` east)
            , not (south `eqDir` west)
            , not (south `eqDir` north)
            ]
             
turnRight :: Dir -> Dir
turnRight d | isWest  d = north
            | isEast  d = south
            | isNorth d = east
            | isSouth d = west

testTurnRight :: [Bool]
testTurnRight = [ turnRight west  `eqDir` north
                , turnRight east  `eqDir` south
                , turnRight north `eqDir` east
                , turnRight south `eqDir` west
                ]
                          
oppositeDir :: Dir -> Dir -> Bool
oppositeDir d d' = d `eqDir` turnRight (turnRight d')

testOppositeDir :: [Bool]
testOppositeDir = [ oppositeDir west east
                  , oppositeDir east west
                  , oppositeDir north south
                  , oppositeDir south north
                  , not (oppositeDir south west)
                  , not (oppositeDir south east)
                  , not (oppositeDir south south)
                  , not (oppositeDir east north)
                  , not (oppositeDir east east)
                  ]
                   
turnTo :: Dir -> Snake -> Snake
turnTo d (d', s, l) | oppositeDir d d' = (d', s, l)
                    | otherwise        = (d,  s, l)

aSnake :: Snake
aSnake = (east, [(0,0)], 4)

snakeBody :: Snake -> [Position]
snakeBody (d, ps, l) = ps

snakeDir :: Snake -> Dir
snakeDir (d, ps, l) = d
                  
snakeLength :: Snake -> Int
snakeLength (d, ps, l) = l
                  
testTurnTo :: [Bool]
testTurnTo = [ -- turnTo does not change the position of the snake
               snakeBody (turnTo west aSnake) == snakeBody aSnake
             , snakeBody (turnTo north aSnake) == snakeBody aSnake

               -- turnTo does not change the length of the snake
             , snakeLength (turnTo north aSnake) == snakeLength aSnake

               -- turning to opposite direction is not allowed, it does not change the direction
             , snakeDir (turnTo west aSnake) `eqDir` snakeDir aSnake

               -- turning to north from east is allowed
             , snakeDir (turnTo north aSnake) `eqDir` north
             ]
                                         
step :: Snake -> Snake
step (d, (p:ps), l) | d p `elem` (p:ps) = (d, (p:ps), l)
                    | otherwise         = (d, take l (d p : p : ps), l)

testStep :: [Bool]
testStep = [ snakeBody (step aSnake) == [(1,0),(0,0)]
           , snakeBody (step (step aSnake)) == [(2,0),(1,0),(0,0)]
           , snakeBody (step (step (step (step (step aSnake))))) == [(5,0),(4,0),(3,0),(2,0)]
           , snakeBody (step (step (step (step (step (step aSnake)))))) == [(6,0),(5,0),(4,0),(3,0)]
           , snakeBody (step (turnTo north (step aSnake))) == [(1,1),(1,0),(0,0)]
           , snakeDir (step aSnake) `eqDir` snakeDir aSnake
           , length (snakeBody (step (step (step (step (step (step aSnake))))))) == snakeLength aSnake
           , snakeLength aSnake == snakeLength (step (step aSnake))
           ]
            
tests :: Bool
tests = and (testDirs
            ++ testIsDirs
            ++ testEqDir
            ++ testTurnRight
            ++ testOppositeDir
            ++ testTurnTo
            ++ testStep
            )

