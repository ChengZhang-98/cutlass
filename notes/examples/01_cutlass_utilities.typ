= examples/01_cutlass_utilities

This example uses cutlass utils to create a random GPU GEMM operation and compare the results with the CPU reference implementation.

Several utils in this example

- `cutlass::half_t`
- `cutlass::HostTensor<>`
- `cutlass::reference::device::TensorFillRandomGaussian()`
- `cutlass::reference::host::Gemm<>`
- `cutlass::reference::host::TensorEquals()`

#datetime(year:2024, month: 6, day:10).display()