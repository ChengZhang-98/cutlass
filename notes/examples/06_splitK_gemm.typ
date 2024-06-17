= examples/06_splitK_gemm #emoji.lightbulb

This example is *well-documented*.

- Naming Convention of GEMM template types: `D = alpha * A * B + beta * C`
  - `ElementComputeEpilogue`: epilogue operations
  - `ElementInputA`: `A`
  - `ElementInputB`: `B`
  - `ElementAccumulator`
  - `ElementOutput`: `D`

- `MxNxK`: numbers like 128x128x32 refer to the tile size (`MxNxK`) of threadblock, warp, or mma-op.
- Get and check device property: `cudaGetDeviceProperties`
- `cutlass::gemm::device::GemmSplitKParallel`