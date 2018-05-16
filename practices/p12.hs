import Data.Maybe

-- Functional languages practice 11

-- Type class instances

-- Define Time and UKTime types. Then
--   1) make them instances of the Show type class
--   2) make them instances of the Eq type class
--   3) make them instances of the Ord type class

-- Nullable type class

-- Define a type for files. A file is represented by its contents.

-- Define a type class Nullable. Instances of this class
-- may not store any data.
-- It should have two methods: isNull and isNotNull

-- Make file an instance of the Nullable type class.

-- Make list of 'a's an instance of the Nullable type class.

-- Make Maybe an instance of the Nullable type class.

-- Measurable type class

-- Define a type class Measurable. Instances of this class
-- have some notion of size.

-- Make file an instance of the Measureable type class. The size
-- should return the number of characters in the file.

-- Make list of 'a's an instance of the Measureable type class.

-- Make file an instance of the Show type class.

-- Make file an instance of the Eq type class.

-- Parametric types

-- Define 'update' that updates ith element of a list.
-- The result of update n f xs depends on f.
-- If f returns Just x, then the nth element is replaced by x.
-- If f returns Nothing, then the nth element is removed from the
-- list.
-- You can use function 'maybe' from Data.Maybe.

update :: Int -> (a -> Maybe a) -> [a] -> [a]
update = undefined

test_update = [
   update 1 (\n -> Just (n + 1)) [2,3,4] == [2,4,4]
 , update 1 (\_ -> Nothing)      [2,3,4] == [2,4]
 , update 3 (\_ -> Nothing)      "HELP"  == "HEL"
 , update 2 (\_ -> Just 'P')     "MAT"   == "MAP"
 ]

-- Advanced exercises

-- Define a parametric type for password-protected contents.
-- The type parameter is the type that holds the contents.

-- Define a function that password-protects a file.
-- Then make it more general, so that it works for anything, not
-- just for files.

-- Define a function that removes password-protection on a file if
-- the correct password is given.
-- The result should be a Maybe.
-- Then make it more general, so that it works for anything, not
-- just for files.

-- Define a parametric type for zip files. A zip file is just a list
-- of path and contents pairs.

-- Create a sample zip files of password-unprotected and
-- password-protected files.

-- Define a function that adds a file to a zip file.

-- Define a function that unzips a file from a zip file using
-- path.
-- Use lookup above.
-- This function simply retrieves the file from the list of
-- contents of the zip file.