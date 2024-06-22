#import "my-typst/my-style.typ": apply-my-style
#show: apply-my-style

#set heading(numbering: "1.")

#align(center, text(17pt)[
  *Log*
])

#outline(indent: 2em)
#pagebreak()


= Env

- Commit: `5c447dd84f8ae0e1d48ff9a2eae26ce8c4958101`
- Docker: `docker.io/nvidia/cuda:12.0.1-devel-ubuntu22.04`
  - install `cmake`, `python` and `git` manually
  - `export CUDACXX=$(which nvcc)`

#include "./examples/00_basic_gemm.typ"
#include "./examples/01_cutlass_utilities.typ"
#include "./examples/02_dump_reg_shmem.typ"
#include "./examples/05_batched_gemm.typ"
#include "./examples/06_splitK_gemm.typ"


#include "./cute/01_layout.typ"
#include "./cute/02_layout_algebra.typ"
#include "./cute/03_tensor.typ"
#include "./cute/sgemm_1.typ"