Generic Zero-Cost Reuse for Dependent Types
===========================================

Cedille code accompanying the paper draft
([available on arXiv](https://arxiv.org/abs/1803.08150)) 
authored by Larry Diehl, Denis Firsov, and Aaron Stump.
The main repository for this development is
[here](https://github.com/larrytheliquid/generic-reuse).

This is the generic version of our
previous [manual reuse](https://github.com/larrytheliquid/zero-cost-coercions)
work, where identity functions are defined via definitional equality, 
rather than propositional equality.

We describe the directories containing our code below. As in the paper,
program reuse corresponds to non-dependent function type reuse,
proof reuse corresponds to dependent function type reuse,
and data reuse corresponds to fixpoint type reuse.

[GenericReuse](GenericReuse)
---------------------------------

This directory includes our primary contributions,
the generic zero-cost reuse combinators for the following types:
* [Functions (forgetful `allArr2arr` & `allPi2pi`)](GenericReuse/FogFun.ced)
* [Functions (enriching `arr2allArrP` & `pi2allPiP`)](GenericReuse/EnrFun.ced)
* [Fixpoints (forgetful `ifix2fix`)](GenericReuse/FogFix.ced)
* [Fixpoints (enriching `fix2ifix` & `fix2ifixP`)](GenericReuse/EnrFix.ced)

The [auxiliary combinators](GenericReuse/Util.ced) also appear here.

[Examples](Examples)
---------------------------------

This directory includes reuse examples via our combinators:
* [Program Reuse of append and Proof Reuse of associativity](Examples/AppendReuse.ced)
  * forgetful `appV2appL` & enriching `appL2appV`
  * forgetful `assocV2assocL` & enriching `assocL2assocV`
* Data Reuse of vectors and lists
  * [Forgetful `v2l`](Examples/VecListReuse.ced)
  * [Enriching `l2v`](Examples/ListVecReuse.ced)
* Data Reuse of unchecked/raw and checked/typed STLC terms
  * [Forgetful `t2r`](Examples/TermRawReuse.ced)
  * [Enriching `r2tP`](Examples/RawTermReuse.ced)
* [Program Reuse of STLC step function (enriching `stepR2stepT`)](Examples/StepReuse.ced)
* [Program Reuse of STLC substitution function (enriching `subR2subT`)](Examples/SubReuse.ced)

[Datatypes](Datatypes)
---------------------------

This directory includes the algebraic list and vector datatypes,
and their schemes, defined using generic Mendler-style fixpoints:
* [Lists Scheme (`ListF`)](Datatypes/ListF.ced)
* [Lists (`List`)](Datatypes/List.ced)
* [Vectors Scheme (`VecF`)](Datatypes/VecF.ced)
* [Vectors (`Vec`)](Datatypes/Vec.ced)
* [Raw Terms Scheme (`RawF`)](Datatypes/RawF.ced)
* [Raw Terms (`Raw`)](Datatypes/Raw.ced)
* [Typed Terms Scheme (`TermF`)](Datatypes/TermF.ced)
* [Typed Terms (`Term`)](Datatypes/Term.ced)

The derived definition of [`Nat`](Datatypes/Nat.ced)
(in terms of the scheme [`NatF`](Datatypes/NatF.ced))
also appears here, as well the types [`Tp`](Datatypes/Tp.ced)
of STLC (and their scheme [`TpF`](Datatypes/TpF.ced)).

[IndexedMendlerInduction](IndexedMendlerInduction)
-------------------------------------------------------

This directory imports the generic datatype development
(via efficient Mendler-style fixpoints) by
[Firsov et al.](https://arxiv.org/abs/1803.02473):
* [Non-Indexed Fixpoints (`FixIndM`)](IndexedMendlerInduction/FixIndM.ced)
* [Indexed Fixpoints (`IFixIndM`)](IndexedMendlerInduction/IFixIndM.ced)
* [Identity Mappings (`IIdMapping`)](IndexedMendlerInduction/IIdMapping.ced)

It also includes the generic derivation of [induction (`iindFixIndM`)](IndexedMendlerInduction/IInductionM.ced),
as well as other technical devices.

[Base](Base)
-----------------

This directory includes base or "prelude" definitions,
like the [`Unit`](Base/Unit.ced) and [`Sigma`](Base/Sigma.ced) types.
It also includes [`IdDep`](Base/Id.ced),
the type of dependent identity functions.

