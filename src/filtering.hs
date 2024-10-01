import           Data.List
import           Data.Monoid
import           Data.Functor.Contravariant (Predicate(..))

{-
Defined in Data.Functor.Contravariant

newtype Predicate a = Predicate	(a -> Bool)

getPredicate :: Predicate a -> (a -> Bool)

instance Semigroup (Predicate a) where
  Predicate p <> Predicate q = Predicate $ \a -> p a && q a

instance Monoid (Predicate a) where
  mempty = Predicate (\_ -> True)
-}

data Person = Person {
  name :: String,
  yob :: Int,
  weight :: Int
} deriving Show


-- replace with students
ps :: [Person]
ps = [Person "Daniel" 1980 80, Person "Mike" 1995 75, Person "Peter" 1960 90]

old :: Predicate Person
old = Predicate (\p -> yob p < 1990)

heavy :: Predicate Person
heavy = Predicate (\p -> weight p > 80)

predicate :: Predicate Person
predicate = old <> heavy

result :: [Person]
result = filter (getPredicate (old <> heavy)) ps
