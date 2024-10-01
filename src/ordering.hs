import Data.List (sortBy)
import Data.Monoid
import Data.Ord (comparing)

{-
-- Defined in Data.Ord
data Ordering = LT | EQ | GT

-- class Ord
compare :: Ord a => a -> a -> Ordering
compare a b | a < b  = LT
            | a == b = EQ
            | a > b  = GT

comparing :: (Ord a) => (b -> a) -> b -> b -> Ordering
comparing p x y = compare (p x) (p y)

instance Semigroup b => Semigroup (a -> b) where
        f <> g = \x -> f x <> g x

instance Monoid b => Monoid (a -> b) where
        mempty = \_ -> mempty

instance Semigroup Ordering where
    LT <> _ = LT
    EQ <> y = y
    GT <> _ = GT

instance Monoid Ordering where
    mempy = EQ
-}

--  Example
data Person = Person
  { firstName :: String,
    lastName :: String,
    yob :: Int
  }
  deriving (Show)

ps :: [Person]
ps = [Person "Daniel" "Kroeni" 1980, Person "Daniel" "AKroeni" 1981, Person "Daniel" "Thommen" 1960]

byFirstName :: Person -> Person -> Ordering
byFirstName = comparing firstName

byLastName :: Person -> Person -> Ordering
byLastName = comparing lastName

criteria :: Person -> Person -> Ordering
criteria = byFirstName <> byLastName

sorted :: [Person]
sorted = sortBy criteria ps
