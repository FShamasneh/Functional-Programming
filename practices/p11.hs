- Functional languages practice 11

-- data MaybeInt  = JustInt Int   | NoInt
-- data MaybeBool = JustBool Bool | NoBool

-- Parametric type:
-- data Maybe a = Just a | Nothing

-- Ex: write some example values.

anInt :: Maybe Int
anInt = undefined

aChar :: Maybe Char
aChar = undefined

-- Ex: write a total variant of head:
-- returns Just x for a non-empty list, Nothing for an empty list.

safeHead :: [a] -> Maybe a
safeHead = undefined

-- Ex: define a function that looks up an element with a given key

lookup :: Eq a => a -> [(a, b)] -> Maybe b
lookup = undefined

-- Define a type for files. A file is represented by its contents.

-- Define a type class Measurable. Instances of this class
-- have some notion of size.

-- Make file an instance of the Measureable type class. The size
-- should return the number of characters in the file.

-- Make list of 'a's an instance of the Measureable type class.

-- Make file an instance of the Show type class.

-- Make file an instance of the Eq type class.

-- Define a type class Nullable. Instances of this class
-- may not store any data.
-- It should have two methods: isNull and isNotNull

-- Make file an instance of the Nullable type class.

-- Make list of 'a's an instance of the Nullable type class.

-- Make Maybe an instance of the Nullable type class.

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