= examples/02_dump_reg_shmem

- Dump a matrix

  ```cpp
  int main() {
    // Initialize a 64x32 column major matrix with sequential data (1,2,3...).
    using Element = cutlass::half_t;
    using Layout = cutlass::layout::ColumnMajor;

    cutlass::HostTensor<Element, Layout> matrix(
        {EXAMPLE_MATRIX_ROW, EXAMPLE_MATRIX_COL});
    cutlass::reference::host::BlockFillSequential(matrix.host_data(),
                                                  matrix.capacity());

    // Dump the matrix.
    std::cout << "Matrix:\n" << matrix.host_view() << "\n";
    // ...
  }
  ```
  - Template `cutlass::reference::host::BlockFillSequential` is similar to `np.arange(NUM_ELEMENTS)` in Python.

- TODO: dump SMEM