#import "../my-typst/my-style.typ": apply-my-style
#show: apply-my-style

#let separator-s = {
  line(length: 60%, stroke: color.teal)
}

#let separator-m = {
  line(length: 100%, stroke: color.black)
}

= Concepts in CUTLASS.CuTe

== Basics

#v(1em)

=== `IntTuple`
- `rank(IntTuple)`/`tuple_size`: number of elements
- `get<I>(IntTuple)`
- `depth(IntTuple)`
- `size(InputTuple)`: product of all elements of the IntTuple

#separator-s

=== `Layout=(Shape, Stride)`
- Layout can be considered as a mapping from coordinates to indices

Special cases:
- vector: any layout with rank = 1
- matrix: any layout with rank = 2

#separator-s

=== `Tensor`
- Tensor mainly consists of a layout and a data pointer

#separator-m

== Layout Concepts

=== Layout Compatibility

layout A is *compatible* with layout B if the shape of A is compatible with the shape of B.

Shape A is compatible with shape B if
- the size of A is equal to the size of B and
- all coordinates within A are valid coordinates within B.

Compatible is a weak partial order on Shapes as it is *reflexive, antisymmetric, and transitive*.

#separator-s

=== Layout Coordinates #emoji.lightbulb

Every `Layout` accepts coordinates for any `Shape` that is compatible with it.

- 1-D coordinate space
- R-D coordinate space, where R is the rank of the layout
- h-D (natural) coordinate space, where h is "hierarchical"

#separator-s

Layouts provide two fundamental mappings:

- the map from an input coordinate to the corresponding natural coordinate via the `Shape`, and
- the map from a natural coordinate to the index via the `Stride`.

==== Input Coordinate #sym.arrow.r Natural Coordinate

Example:

Shape `(3,(2,3))` has three coordinate sets, 1D, 2D, and Natural:

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto),
  align: center,
  [1-D],[ 2-D    ],[ Natural    ],[], [ 1-D  ], [2-D    ], [Natural    ],
  [`0`],[ `(0,0)`],[ `(0,(0,0))`],[], [ `9`  ], [`(0,3)`], [`(0,(1,1))`],
  [`1`],[ `(1,0)`],[ `(1,(0,0))`],[], [ `10` ], [`(1,3)`], [`(1,(1,1))`],
  [`2`],[ `(2,0)`],[ `(2,(0,0))`],[], [ `11` ], [`(2,3)`], [`(2,(1,1))`],
  [`3`],[ `(0,1)`],[ `(0,(1,0))`],[], [ `12` ], [`(0,4)`], [`(0,(0,2))`],
  [`4`],[ `(1,1)`],[ `(1,(1,0))`],[], [ `13` ], [`(1,4)`], [`(1,(0,2))`],
  [`5`],[ `(2,1)`],[ `(2,(1,0))`],[], [ `14` ], [`(2,4)`], [`(2,(0,2))`],
  [`6`],[ `(0,2)`],[ `(0,(0,1))`],[], [ `15` ], [`(0,5)`], [`(0,(1,2))`],
  [`7`],[ `(1,2)`],[ `(1,(0,1))`],[], [ `16` ], [`(1,5)`], [`(1,(1,2))`],
  [`8`],[ `(2,2)`],[ `(2,(0,1))`],[], [ `17` ], [`(2,5)`], [`(2,(1,2))`],
)

- For this shape, 1D coordinates goes from `0` to `size(Shape)-1=3x2x3-1=17`
- How to translate 1D coordinate to 2D/Natural coordinates?

  #quote()[The map from an input coordinate to a natural coordinate is the application of a colexicographical order (reading right to left, instead of "lexicographical," which reads left to right) within the `Shape`.]

  #quote()[generalized-column-major order]

  #let tmp_shape_0 = {text(red)[3]}
  #let tmp_shape_1 = {text(orange)[2]}
  #let tmp_shape_2 = {text(blue)[3]}

  - Shape (#tmp_shape_0, (#tmp_shape_1, #tmp_shape_2)), 1D coordinate 16 #sym.arrow.r 2D coordinate (#text(color.purple)[1], #text(green)[5]) #sym.arrow.r Naturla (3D) coordinate (#text(color.purple)[1], (#text(color.aqua)[1], 2))

    16 div #tmp_shape_0 = #text(green)[5] #sym.dots.c #text(color.purple)[1], 2D coordinate is (#text(color.purple)[1], #text(green)[5]),

    #text(green)[5] div #tmp_shape_1 = 2 #sym.dots.c #text(color.aqua)[1], 3D coordinate is (#text(color.purple)[1], (#text(color.aqua)[1], 2))

- API: `cute::idx2crd(idx, shape)`

#separator-s

==== Natural Coordinate #sym.arrow.r Index

The map from a natural coordinate to an index is performed by taking the inner product of the natural coordinate with the `Layout`'s `Stride`.

- Layout = (Shape, Stride) = `((3,(2,3), (3, (12, 1))))`, natural coordinate `(i, (j, k))` #sym.arrow.r index `i*3 + j*12 + k*1`

- Example:

```txt
       0     1     2     3     4     5     <== 1-D col coord
     (0,0) (1,0) (0,1) (1,1) (0,2) (1,2)   <== 2-D col coord (j,k)
    +-----+-----+-----+-----+-----+-----+
 0  |  0  |  12 |  1  |  13 |  2  |  14 |
    +-----+-----+-----+-----+-----+-----+
 1  |  3  |  15 |  4  |  16 |  5  |  17 |
    +-----+-----+-----+-----+-----+-----+
 2  |  6  |  18 |  7  |  19 |  8  |  20 |
    +-----+-----+-----+-----+-----+-----+
```

- API: `cute::crd2idx(coord, shape, stride)`


#separator-m
== Layout Manipulation

- sublayout
- concat
- grouping and flattening
- slicing
