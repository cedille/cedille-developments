Background files:

  cast.ced        -- the Cast · A · B type, for functions from A to B which equal λ x . x.
  recType.ced     -- derivation of recursive types for monotone type schemes
  functor.ced     -- Statements of identity and composition laws for (the morphism part of) a functor (type Fmap)
  functorThms.ced -- Proof that the identity law for a functor implies it is monotonic (in the sense of recType)

Main file:

  parigot.ced     -- generic derivation of the Parigot encoding for any functor

Positive example:

  natFunctor.ced  -- the standard functor for defining the natural numbers
  nat.ced         -- derivation of recursion and induction for Nat, by instantiating the parigot.ced module

Negative example:

  inftreeFunctor.ced -- we cannot derive the identity law for infinitary functors (for example for infinitely
                        branching trees).  It appears that for the Parigot encoding, doing so requires extensionality,
                        which Cedille currently lacks.


Summary:

The Parigot encoding represents data as their own *paramorphisms*, aka
primitive recursions.  You can define a function from the
Parigot-encoded inductive type C to some other type X by specifying,
for each constructor of C, how to compute the desired value of type X
when given:

  a. the values of type X for any subdata that are arguments to C
  b. the subdata themselves

It is point (b) that is a big step forward over the Church encoding,
as it means that you can compute, for example, the predecessor of a
natural number, tail of a list, and in general the subdata of any
data, in constant time (recall that with the Church encoding getting
the immediate subdata of a datum takes time linear in the size of the
datum).

In parigot.ced, I have defined an inductive datatype using the Parigot
encoding, for any functor F.  (Here, the notion of functor is the one
from category theory, and implemented very similarly to the way it is
done in Haskell, except that since we are in dependent type theory we
can state and prove the functor laws within the language.)  Also,
induction and recursion principles for C are derived.  The development
is short, and uses several tricks we developed at Iowa over the past
couple years.  The basic outline is:

1. first define type C which allows non-dependent eliminations (just
   function definition, no inductive proofs).  Since the definition of
   C must mention C itself recursively (since Parigot-encoded data
   contain subdata), we use the development of monotone recursive
   types in recType.ced to allow this definition.

2. next define a type D which is the dependent intersection of x : C
   and a proof that x is inductive.  Elements of type D support
   dependent elimination, but only for predicates on C (it is not
   possible to define this already for predicates on D, since that
   would make the definition non-monotonically recursive).

3. show that one can cast any element of type C to type D.  This
   requires baking in the property that the untyped conversion toDU
   (intended to go from C to D, but again, it is untyped for purposes
   of stating the property) is the identity function.  This is done
   in the definition of CF from which C is defined.

4. Derive induction by casting an element of type C to an element of
   type D and then using the C type's inherent induction on predicates
   on C.

