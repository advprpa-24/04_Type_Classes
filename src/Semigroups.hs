import Data.List.NonEmpty hiding (map)
import Data.Semigroup hiding (Sum, Prod)

newtype Sum = Sum Int deriving Show
newtype Prod = Prod Int deriving Show

instance Semigroup Sum where
    (<>) :: Sum -> Sum -> Sum
    Sum a <> Sum b = Sum (a+b)

instance Semigroup Prod where
    (<>) :: Prod -> Prod -> Prod
    Prod a <> Prod b = Prod (a*b)

concatAll :: Semigroup a => [a] -> a
concatAll (a:as) = go a as
    where go acc (c:cs) = acc <> go c cs 
          go acc []     = acc 

e1 = concatAll (map Sum [1,2,3])

e2 = concatAll (map Sum [])