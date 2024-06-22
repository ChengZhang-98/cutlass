#import "../my-typst/my-style.typ": apply-my-style
#show: apply-my-style

#let  separator-s = {line(length: 60%, stroke: color.teal)}
#let  separator-m = {line(length: 100%, stroke: color.black)}

= Cute Tensors

The `Tensor` presents the same shape and access operators as the `Layout` and uses the result of the `Layout` computation to offset and dereference a random-access iterator held by the `Engine`.

== Tensor Engines

=== Tagged Iterators

- `make_gmem_ptr(g)`
- `make_smem_ptr(g)`

== Tensor Creation

=== Non-owning Tensors

`make_tensor(ptr, layout)`

=== Owning Tensors

- `make_tensor<T>(layout)`: The layout must be static
- `make_tensor_like(tensor)`

== Accessing a Tensor

- `operator()`/`operator[]` accepts 1D, R-D, or h-D coordinate and accesses the corresponding element.

== Tiling a Tensor

layout division functions also support tensors as input args, but product functions do not support tensors.

== Slicing a Tensor

Note that the underscore character `_` is used to select all elements in that mode (Not the `...` in `IntTuple.get<I...>`)

== Partitioning a Tensor

=== Inner and outer partitioning

- `inner_partition(Tensor, Tiler, Coord)`/`local_tile(Tensor, Tiler, Coord)`: is often applied at the threadgroup level to partition tensors into tiles across thread groups.

- `outer_partition(Tensor, Tiler, Coord)`, `local_partition(Tensor, Layout, Idx)`

=== Thread-Value parittioning

