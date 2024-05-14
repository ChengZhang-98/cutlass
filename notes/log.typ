#import "my-typst/my-style.typ": apply-my-style
#show: apply-my-style

#set heading(numbering: "1.")

= Log

== Env

- Commit: `5c447dd84f8ae0e1d48ff9a2eae26ce8c4958101`
- Docker: `docker.io/nvidia/cuda:12.0.1-devel-ubuntu22.04`
  - install `cmake`, `python` and `git` manually
  - `export CUDACXX=$(which nvcc)`

== examples/00_basic_gemm

=== Build

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

== examples/cute/tutorial/sgemm_1.cu

- Prerequisite
  - go through `../media/docs/cute/01_layout.md` (@media-docs:cute:01_layout)


#datetime(year:2024, month: 4, day:26).display()


== media/docs/cute/01_layout.md <media-docs:cute:01_layout>

Keywords: `layout`, `shape`, `stride`, `coordinate`

- layout = (shape, stride)
- coordinate:
  - `cute::idx2crd(idx, shape)` maps index/input coordinate to natural coordinate via `shape`
  - `cute::crd2idx(crd, shape, stride)` maps input coordinate/natural coordinate (an IntTuple) to index (an integer) via `shape` and `stride`
