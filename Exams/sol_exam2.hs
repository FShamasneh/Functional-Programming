import Data.Char (toUpper, toLower)
import Data.List (sort)

type ABC = [Char]

abc :: ABC
abc = ['A'..'Z']

type Riddle       = String
type RightGuesses = [Char]
type WrongGuesses = [Char]
type State        = (Riddle, RightGuesses, WrongGuesses)

isValidLetter :: Char -> ABC -> Bool
isValidLetter c l = elem (toUpper c) l || elem (toLower c) l

test_isValidLetter =
  [ isValidLetter 'a' abc        == True
  , isValidLetter 'X' abc        == True
  , isValidLetter ' ' abc        == False
  , isValidLetter '$' "*]-$><"   == True
  , isValidLetter 'E' ['a'..'z'] == True
  ]

startState :: ABC -> String -> State
startState abc str = if null [c | c <- str, not (c == ' ' || isValidLetter c abc)]
                     then ([toUpper c | c <- str], [], [])
                     else undefined

test_startState =
  [ startState abc ""                == ("","","")
  , startState abc "SOS"             == ("SOS","","")
  , startState abc "Save Our Souls"  == ("SAVE OUR SOULS","","")
  ]

guessLetter :: ABC -> Char -> State -> State
guessLetter abc c (r, rg, wg)
  | c' `elem` rg || c' `elem` wg = (r, rg, wg)
  | c' `elem` r                  = (r, c':rg, wg)
  | isValidLetter c abc          = (r, rg, c':wg)
  | otherwise                    = undefined
  where
    c' = toUpper c

test_guessLetter =
  [ guessLetter abc 'a' (startState abc "Save Our Souls") == ("SAVE OUR SOULS","A","")
  , guessLetter abc 'A' (startState abc "Save Our Souls") == ("SAVE OUR SOULS","A","")
  , guessLetter abc 'k' (startState abc "Save Our Souls") == ("SAVE OUR SOULS","","K")
  , guessLetter abc 'a' (guessLetter abc 'a' (startState abc "Save Our Souls")) == ("SAVE OUR SOULS","A","")
  , guessLetter abc 'K' (guessLetter abc 'k' (startState abc "Save Our Souls")) == ("SAVE OUR SOULS","","K")
  , guessLetter abc 'v' ("SAVE OUR SOULS", "A", [])       == ("SAVE OUR SOULS","VA","")
  , guessLetter abc 'k' ("SAVE OUR SOULS", "VA", [])      == ("SAVE OUR SOULS","VA","K")
  ]

showRiddle :: State -> String
showRiddle (r, rg, _) = [ if c `elem` rg || c == ' ' then c else '_' | c <- r ]

test_showRiddle =
  [ showRiddle ("SAVE OUR SOULS", [], [])     == "____ ___ _____"
  , showRiddle ("SAVE OUR SOULS", "AL", [])   == "_A__ ___ ___L_"
  , showRiddle ("SAVE OUR SOULS", "SAL", [])  == "SA__ ___ S__LS"
  , showRiddle ("SAVE OUR SOULS", "SALO", []) == "SA__ O__ SO_LS"
  , showRiddle ("SOS", "SO", "AL")            == "SOS"
  ]

showState :: State -> State
showState (r, rg, wg) = (showRiddle (r, rg, wg), rg, wg)

test_showState =
  [ showState ("SAVE OUR SOULS", [], [])     == ("____ ___ _____", "", "")
  , showState ("SAVE OUR SOULS", "SAL", [])  == ("SA__ ___ S__LS", "SAL", "")
  , showState ("SAVE OUR SOULS", "SALO", []) == ("SA__ O__ SO_LS", "SALO", "")
  ]

isRiddleComplete :: State -> Bool
isRiddleComplete s = null [ 1 | '_' <- showRiddle s ]

test_isRiddleComplete =
  [ isRiddleComplete ("SOS", [], [])                        == False
  , isRiddleComplete ("SOS", "SALO", [])                    == True
  , isRiddleComplete ("SOS", "ALO", [])                     == False
  , isRiddleComplete ("SOS", [], "LKHJIG")                  == False
  , isRiddleComplete ("SAVE OUR SOULS", "SAVEOURL", "KZTW") == True
  ]

isGameOver :: State -> Bool
isGameOver (r, rg, wg) = length wg > 5 || isRiddleComplete (r, rg, wg)

test_isGameOver =
  [ isGameOver ("SOS", [], [])                          == False
  , isGameOver ("SOS", [], "LKHJIG")                    == True
  , isGameOver ("SAVE OUR SOULS", "SAVEOURL", "KZTW")   == True
  , isGameOver ("SAVE OUR SOULS", "SAVEOURL", "KZTWM")  == True
  , isGameOver ("SAVE OUR SOULS", "SAVEOURL", "KZTWMB") == True
  ]

getAvailableLetters :: ABC -> State -> [Char]
getAvailableLetters abc (_, rg, wg) = [l | l <- abc, not (l `elem` (rg ++ wg))]

test_getAvailableLetters =
  [ sort (getAvailableLetters abc ("SAVE OUR SOULS", "SAVEOURL", "KZTW")) == "BCDFGHIJMNPQXY"
  , sort (getAvailableLetters abc ("SOS", [], "LKHJIG"))                  == "ABCDEFMNOPQRSTUVWXYZ"
  , sort (getAvailableLetters abc ("SOS", [], []))                        == "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  ]

allTests = (and (concatMap snd tests), tests)

tests =
  [ ("test_isValidLetter", test_isValidLetter)
  , ("test_startState", test_startState)
  , ("test_guessLetter", test_guessLetter)
  , ("test_showRiddle", test_showRiddle)
  , ("test_showState", test_showState)
  , ("test_isRiddleComplete", test_isRiddleComplete)
  , ("test_isGameOver", test_isGameOver)
  , ("test_getAvailableLetters", test_getAvailableLetters)
  ]