#import "../my-typst/my-style.typ": apply-my-style
#show: apply-my-style

#let separator-s = {}
#let separator-m = {}

#let presentation-mode = false
// #set page(height: 19.05cm, width: 33.867cm)
#if presentation-mode {
  separator-s = {pagebreak()}
  separator-m = {pagebreak()}
} else {
  separator-s = {line(length: 60%, stroke: color.teal)}
  separator-m = {line(length: 100%, stroke: color.black)}
}

= Layout Algebra

Maths behind CuTe's APIs to do tiling, reshape, selection, permutation ...

== Coalsece

Simplify layout if possible.

== Composition

Layout can be considered as a mapping from coordinates to indices.

```txt
Functional composition, R := A o B
R(c) := (A o B)(c) := A(B(c))

Example

A = (6,2):(8,2)
B = (4,3):(3,1)

R( 0) = A(B( 0)) = A(B(0,0)) = A( 0) = A(0,0) =  0
R( 1) = A(B( 1)) = A(B(1,0)) = A( 3) = A(3,0) = 24
R( 2) = A(B( 2)) = A(B(2,0)) = A( 6) = A(0,1) =  2
R( 3) = A(B( 3)) = A(B(3,0)) = A( 9) = A(3,1) = 26
R( 4) = A(B( 4)) = A(B(0,1)) = A( 1) = A(1,0) =  8
R( 5) = A(B( 5)) = A(B(1,1)) = A( 4) = A(4,0) = 32
R( 6) = A(B( 6)) = A(B(2,1)) = A( 7) = A(1,1) = 10
R( 7) = A(B( 7)) = A(B(3,1)) = A(10) = A(4,1) = 34
R( 8) = A(B( 8)) = A(B(0,2)) = A( 2) = A(2,0) = 16
R( 9) = A(B( 9)) = A(B(1,2)) = A( 5) = A(5,0) = 40
R(10) = A(B(10)) = A(B(2,2)) = A( 8) = A(2,1) = 18
R(11) = A(B(11)) = A(B(3,2)) = A(11) = A(5,1) = 42

---

1D coord in B -> 2D coord in B -> index in B, 1D coord in A -> 2D coord in A -> index in A

A(B(11))      = A(B(3,2))      = A(11)                      = A(5,1)         = 42
```

=== Computing Composition

=== Composition Tilers

A `Tiler` is one of the following objects.
- A `Layout`.
- A tuple of `Tiler`s.
- A `Shape`, which will be interpreted as a tiler of `Layout`s with stride-1.

== Complement

#image("./figures/note-layout_alg_complement.svg", height: 4cm)

== Division (Tiling)

// $A #sym.slash B := A circle (B, B^*)$

`logical_divide(A, B)` splits a layout `A` into two modes
- in the first mode are all elements pointed to by `B` and
- in the second mode are all elements not pointed to by `B`, which is an iterator over each tile of `B`.

#image("../../media/images/cute/divide1.png", width: 50%)


== Product (Tiling)

`logical_product(A, B)` results in a two mode layout where
- the first mode is the layout `A` and - the second mode is the layout `B` but with each element replaced by a "unique replication" of layout `A`

#image("../../media/images/cute/product1.png", width: 50%)