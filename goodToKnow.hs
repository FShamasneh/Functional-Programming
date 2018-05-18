-- Count occurrences of an element in a list
numTimesFound x xs = (length . filter (== x)) xs
