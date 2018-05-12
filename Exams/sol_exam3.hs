equals :: String -> String
equals [] = []
equals s  = takeWhile (== head s) s

test_equals =
  [ equals "aaaaabbbbcc" == "aaaaa"
  , equals "ddddddddddddddd" == "ddddddddddddddd"
  , equals "aa" == "aa"
  , equals "abc" == "a"
  , equals "" == ""
  ]

run :: String -> String
run s = take 9 (equals s)

test_run =
  [ run "aaaaabbbbcc" == "aaaaa"
  , run "ddddddddddddddd" == "ddddddddd"
  , run "aa" == "aa"
  , run "abc" == "a"
  , run "" == ""
  ]

runs :: String -> [String]
runs [] = []
runs s  = r : runs (drop (length r) s)
  where
    r = run s

test_runs =
  [ runs "aaaaabbbbcc" == ["aaaaa", "bbbb", "cc"]
  , runs "ddddddddddddddd" == ["ddddddddd", "dddddd"]
  , runs "aa" == ["aa"]
  , runs "abc" == ["a", "b", "c"]
  , runs "" == []
  ]

encode :: String -> [(Char,Int)]
encode s = [(head r, length r) | r <- runs s]

test_encode =
  [ encode "aaaaabbbbcc" == [('a', 5), ('b', 4), ('c', 2)]
  , encode "ddddddddddddddd" == [('d', 9), ('d', 6)]
  , encode "aa" == [('a', 2)]
  , encode "abc" == [('a', 1), ('b', 1), ('c', 1)]
  , encode "" == []
  ]

compress :: String -> String
compress s = concat [c : show i | (c, i) <- encode s]

test_compress =
  [ compress "aaaaabbbbcc" == "a5b4c2"
  , compress "ddddddddddddddd" == "d9d6"
  , compress "aa" == "a2"
  , compress "abc" == "a1b1c1"
  , compress "" == ""
  ]

decode :: [(Char,Int)] -> String
decode xs = concat [replicate i c | (c, i) <- xs]

test_decode =
  [ decode [('a', 5), ('b', 4), ('c', 2)] == "aaaaabbbbcc"
  , decode [('d', 9), ('d', 6)] == "ddddddddddddddd"
  , decode [('a', 2)] == "aa"
  , decode [('a', 1), ('b', 1), ('c', 1)] == "abc"
  , decode [] == ""
  ]

unruns :: String -> [(Char, Int)]
unruns []       = []
unruns (c:i:xs) = (c, read (i:[])) : unruns xs

test_unruns = 
  [ unruns "a5b4c2" == [('a', 5), ('b', 4), ('c', 2)]
  , unruns "d9d6" == [('d', 9), ('d', 6)]
  , unruns "a2" == [('a', 2)]
  , unruns "a1b1c1" == [('a', 1), ('b', 1), ('c', 1)]
  , unruns "" == []
  ]

decompress :: String -> String
decompress s = decode (unruns s)

test_decompress =
  [ decompress "a5b4c2" == "aaaaabbbbcc"
  , decompress "d9d6" == "ddddddddddddddd"
  , decompress "a2" == "aa"
  , decompress "a1b1c1" == "abc"
  , decompress "" == ""
  ]

allTests = (and bs, bs)
  where
    bs = map and
      [ test_equals
      , test_run
      , test_runs
      , test_encode
      , test_compress
      , test_decode
      , test_unruns
      , test_decompress
      ]