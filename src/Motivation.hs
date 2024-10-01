-- Type Class motivation

containsBool :: Bool -> [Bool] -> Bool
containsBool _ []     = False
containsBool x (y:ys) = sameBool x y || containsBool x ys

sameBool :: Bool -> Bool -> Bool
sameBool True  True  = True
sameBool False False = True
sameBool _     _     = False

data Color = Red | Green | Blue


containsColor :: Color -> [Color] -> Bool
containsColor _ []     = False
containsColor x (y:ys) = sameColor x y || containsColor x ys

sameColor :: Color -> Color-> Bool
sameColor Red   Red   = True
sameColor Green Green = True
sameColor Blue  Blue  = True
sameColor _     _     = False


containsGen :: (a -> a -> Bool) -> a -> [a] -> Bool
containsGen _ _ []     = False
containsGen f x (y:ys) = f x y || containsGen f x ys

genTest :: Bool
genTest = containsGen sameBool True [False, False, False, True] 

class Compare a where
  same :: a -> a -> Bool

instance Compare Bool where
  same :: Bool -> Bool -> Bool
  same True True   = True
  same False False = True
  same _     _     = False


instance Compare Color where
  same :: Color -> Color -> Bool
  same Red   Red   = True
  same Green Green = True
  same Blue  Blue  = True
  same _     _     = False
  


contains :: Compare a => a -> [a] -> Bool
contains _ []     = False
contains x (y:ys) = same x y || contains x ys

boolTest :: Bool
boolTest = contains True [False, True, False]

-- colorTest = contains Red [Green, Blue, Blue]

-- funTest = contains length [sum, product]
