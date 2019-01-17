Efficient Mendler Prime
=======================

A refactored version of the development accompanying the ITP'18 paper
[Efficient Mendler-Style Lambda-Encodings in Cedille](https://doi.org/10.1007/978-3-319-94821-8_14),
with the goal of minimizing the code size and bringing out the essence of the
work. For someone unfamiliar with the work already, studying this smaller code base may be easier.
For future developments based on the work, this can serve as a smaller dependency.

Refactoring mainly involved code cleanup and getting rid of incidental complexity in the original
development . The only technical difference is the introduction of [IdPlus](IdPlus.ced), which
captures the ITP work's concept of predicate lifting at a slightly different level of abstraction,
in order to keep the code size small.

See [FixIndM](FixIndM.ced) for the least fixpoint type and its induction principle.