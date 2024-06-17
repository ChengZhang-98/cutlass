= examples/05_batched_gemm

Batched GEMM between two column major matrices.

```text
This example demonstrates how to use cutlass to compute a batched strided gemm in two different ways:
  1. By specifying pointers to the first matrices of the batch and the stride between the consecutive
     matrices of the batch (this is called a strided batched gemm).
  2. By copying pointers to all matrices of the batch to the device memory (this is called an array gemm).
In this example, both A and B matrix are non-transpose and column major matrix
batched_C = batched_A x batched_B

batched_A = [A_batch1 A_batch2]
batched_B = [[B_batch1], [B_batch2]]
batched_C = [C_batch1 C_batch2]
```

#datetime(year:2024, month: 6, day:10).display()