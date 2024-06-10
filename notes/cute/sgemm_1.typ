= examples/cute/tutorial/sgemm_1.cu

- Prerequisite
  - go through `../media/docs/cute/01_layout.md` (@media-docs:cute:01_layout)


#datetime(year:2024, month: 4, day:26).display()

= media/docs/cute/01_layout.md <media-docs:cute:01_layout>

Keywords: `layout`, `shape`, `stride`, `coordinate`

- layout = (shape, stride)
- coordinate:
  - `cute::idx2crd(idx, shape)` maps index/input coordinate to natural coordinate via `shape`
  - `cute::crd2idx(crd, shape, stride)` maps input coordinate/natural coordinate (an IntTuple) to index (an integer) via `shape` and `stride`
