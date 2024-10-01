{-# LANGUAGE OverloadedStrings #-}
import Data.String

data Expr
    = Val Integer
    | Add Expr Expr
    | Sub Expr Expr
    | Mul Expr Expr
    | Neg Expr
    | Abs Expr
    | Sig Expr
    | Var String
    deriving (Show, Eq)

instance Num Expr where
  (+), (-), (*) :: Expr -> Expr -> Expr
  (+) = Add
  (-) = Sub
  (*) = Mul
  negate, abs, signum :: Expr -> Expr
  negate = Neg
  abs = Abs
  signum = Sig
  fromInteger :: Integer -> Expr
  fromInteger = Val


s :: Expr
s = 3 * 4 + Var "x"

-- ^ as repeated multiplication.
e :: Expr
e = Var "y" ^ 4 + 8 * Var "x" + 2

main :: IO ()
main = print e

-- Use OverloadedString for variables.
nice :: Expr
nice = "y" ^ 4 + 8 * "x" + 2

instance IsString Expr where
    fromString = Var














x :: Expr
x = 3 + 5 * 7