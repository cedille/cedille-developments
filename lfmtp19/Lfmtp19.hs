{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE RankNTypes #-}
module Lfmtp19 where

type Trmga alg x = alg x -> x

newtype Alg x =
  MkAlg { unfoldAlg :: forall (alga :: * -> *) .
                        (forall (y :: *) . (x -> y) -> y -> Trmga alga y) ->
                        (forall (z :: *) . Alg z -> alga z) ->
                        alga x ->
                        x}

newtype Trm = MkTrm { unfoldTrm :: forall (x :: *) . Alg x -> x}

lamAlg :: Alg Trm
lamAlg = MkAlg (\ f embed talg -> MkTrm (\ alg -> unfoldAlg alg (\ mx -> f (\ t -> mx (unfoldTrm t alg))) embed (embed alg)))

fold :: Alg a -> Trm -> a
fold alg t = unfoldTrm t alg

lam :: forall (x :: *) .
       (forall (y :: *) . (x -> y) -> y -> Trmga Alg y) -> Trmga Alg x
lam = \ f alg -> unfoldAlg alg f (\ x -> x) alg

place :: forall (x :: *) . x -> Trmga Alg x
place = \ x -> \ alg -> x

test :: Trm
test = MkTrm (lam (\ mo x ->
               lam (\ mx y -> place (mx x))))

body2 :: forall (x :: *) (y :: *) . (x -> y) -> y -> Trmga Alg y
body2 = (\ mx y -> lam (\ my z -> place (my y)))

test2 :: Trm
test2 = MkTrm (lam (\ mo x ->
               lam body2))

test3 :: Trm
test3 = MkTrm (lam (\ mo x ->
               lam (\ mx y -> place y)))

sizeAlg :: Num a => Alg a
sizeAlg = MkAlg (\ f embed alg -> 1 + f id 1 alg)

data Dbtrm = Lam Dbtrm | Var Int deriving Show

toDebruijnAlg :: Alg (Int -> Dbtrm)
toDebruijnAlg = MkAlg (\ f embed alg -> \ v ->
                   let v' = v + 1 in Lam (f id (\ n -> Var (n - v')) alg v'))

subst :: (forall (y :: *) . (Trm -> y) -> y -> Trmga Alg y) -> Trm -> Trm
subst = \ f t -> f id t lamAlg

vars :: Int -> [String]
vars n = ("x" ++ show n) : vars (n + 1)

printTrmHAlg :: Alg ([String] -> String)
printTrmHAlg = MkAlg (\ f embed alg vars ->
                        let x = head vars in
                          "\\ " ++ x ++ ". " ++ f id (\ vars -> x) alg (tail vars))

printTrm :: Trm -> String
printTrm t = fold printTrmHAlg t (vars 1)
