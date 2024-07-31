#import "../my-typst/my-style.typ": apply-my-style
#show: apply-my-style

#let  separator-s = {line(length: 60%, stroke: color.teal)}

= 0x GEMM Tutorial

#table(align: center, columns: 5, rows: 5,
  [BLAS], [A Majorness], [A Layout], [B Majorness], [B Layout],
  [NT], [M-major], [(M,K):(1,ldA)], [N-major], [(N,K):(1,ldA)],
  [TN], [K-major], [(M,K):(ldA,1)], [K-major], [(N,K):(ldB,1)],
  [NN], [M-major], [(M,K):(1,ldA)], [K-major], [(N,K):(ldB,1)],
  [TT], [K-major], [(M,K):(ldA,1)], [N-major], [(N,K):(1,ldA)]
)
