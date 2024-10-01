-- Illustrates type class as records of functions.

data Eq_ a = MkEq { same :: a -> a -> Bool }

-- Contains using type classes
contains :: Eq a => a -> [a] -> Bool
contains _ [] = False
contains e (a:as) = e == a || contains a as

e3 = contains 'c' "abc"

-- Contains using record of functions
contains_ :: Eq_ a -> a -> [a] -> Bool
contains_ eq _ [] = False
contains_ eq e (a:as) = (same eq) e a || contains_ eq a as

eq_Int :: Eq_ Int
eq_Int = MkEq (==)



e :: Bool
e = contains_ eq_Int 1 [1,2,3]












data Ord_ a = MkOrd { eq :: Eq_ a, lt :: a -> a -> Bool }

-- Problem of incoherent type classes:
data Set a 
    = Empty
    | Branch (Set a) a (Set a)
    deriving (Show)

insert :: Ord_ a -> a -> Set a -> Set a
insert _   e Empty = Branch Empty e Empty
insert ord e (Branch l a g) 
  | same (eq ord) e a = Branch l a g
  | (lt ord) e a      = insert ord e l 
  | otherwise         = insert ord e g

elem_ :: Ord_ a -> a -> Set a -> Bool
elem_ _   e Empty = False
elem_ ord e (Branch l a g) 
  | same (eq ord) e a = True
  | (lt ord) e a      = elem_ ord e l 
  | otherwise         = elem_ ord e g



-- ascending order
ord_Int :: Ord_ Int
ord_Int = MkOrd eq_Int (<)

-- descending order
ord_Int' :: Ord_ Int
ord_Int' = MkOrd eq_Int (>)

{-
    2
   / \
  1   .
 / \
.   . 
-}
s :: Set Int
s = insert ord_Int 1 (insert ord_Int 2 Empty)


-- Finds elem because same ordering is used
c1 :: Bool
c1 = elem_ ord_Int 1 s

-- Does not find elem because order for insert and elem was different.
c2 :: Bool
c2 = elem_ ord_Int' 1 s
