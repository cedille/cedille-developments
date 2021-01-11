# File listings

- `encoding.ced` 
  The generic encoding of Mendler-style inductive types by Firsov et al. (2018).
  The file renames and re-exports definitions to match the interface used in the
  paper

- `reuse.ced`
  Exports the implementaiton of the results used from Diehl et al. (2018) used in the paper:

- `reuse/signature-subtyping.ced`
    Signature containment ("identity algebra" of Diehl et al.)

  - `reuse/fix2fix.ced`
    Non-indexed version of `ifix2fix` from Diehl et al.

- `extensible-signature.ced`
  Exports definitions from:

  - `extensible-signatures/sig.ced`
    The generic signature `Sig` that over-approximates the scheme of encoding proposed
    in the paper

  - `extensible-signature/sub.ced` 
    The sufficient condition for zero-cost reuse for inductive types defined using `Sig`
    
- `examples/`

  - `nat-sig.ced`, `nat-ext.ced`, `nat.ced`
    Signature for natural numbers, extensible constructors and addition, and the inductive type Nat itself
    
  - `int-sig.ced`, `int-reuse-nat.ced`, `int.ced`
    Signature for integers, proof of inclusion of Nat signature into Int
    signature and generic reuse for Nat functions, the inductive type Int with
    `izero`, `isucc`, and addition reused from Nat.
