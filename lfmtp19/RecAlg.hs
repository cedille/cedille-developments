{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE ExplicitForAll #-}
{-# LANGUAGE RankNTypes #-}
module RecAlg where

newtype Ca alg = MkC { unfoldC :: forall (x :: *) . alg x -> x}

newtype Alg (f :: * -> *) x =
  MkAlg { unfoldAlg :: forall (alga :: * -> *) .
                        (f (Ca alga)) ->
                        (forall (z :: *) . Alg f z -> alga z) ->
                        alga x ->
                        x}

type C f = Ca (Alg f)

initAlg :: Functor f => Alg f (C f)
initAlg =
  MkAlg (\ fd embedAlg _ ->
           MkC (\ a' -> unfoldAlg a' fd embedAlg (embedAlg a')))

