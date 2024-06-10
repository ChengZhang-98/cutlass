= examples/00_basic_gemm

== Build

The example is at `examples/00_basic_gemm`.

```sh
# entry point is the root of the repository
mkdir build && cd build
# -DCUTLASS_LIBRARY_KERNELS=basic_gemm where `basic_gemm` is the name of the file (basic_gemm.cu)
cmake .. -DCUTLASS_NVCC_ARCHS=80 -DCUTLASS_LIBRARY_KERNELS=basic_gemm
cd examples/00_basic_gemm
# build the 00_basic_gemm excutable
make
```

#datetime(year:2024, month: 4, day:26).display()