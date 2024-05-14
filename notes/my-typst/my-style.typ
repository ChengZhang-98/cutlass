#let apply-my-style(doc) = [
  #set page(margin: (inside: 2cm, outside: 1cm, y: 1.75cm))
  #set text(size: 10pt)
  #show raw.where(block: false): box.with(
  fill: luma(240),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)
  #show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 10pt,
  radius: 4pt,
  )
  #doc
]