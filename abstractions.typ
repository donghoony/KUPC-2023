#import "colors.typ" : *

#let cell = rect.with(
  height: 25pt,
  inset: 12pt,
  width: 130%,
  stroke: none,
)

#let column_width = (5%, 5%, 35%, 15%, 25%)

#let row_header_content(_text, size:1.3em) = {
  cell(
    fill: none,
    text(weight: "semibold", size:size, fill: black)[#_text],
  )
}

#let pick_color(tier: "") = {
  let c = black
  if (tier == "b") {c = AC_BRONZE}
  if (tier == "s") {c = AC_SILVER}
  if (tier == "g") {c = AC_GOLD}
  if (tier == "p") {c = AC_PLATINUM}
  if (tier == "d") {c = AC_DIAMOND}
  if (tier == "r") {c = AC_RUBY}
  return c
}
  
#let row_content(_text, tier: "", mono: false) = {
  let c = pick_color(tier: tier)
  let w = "regular"
  if (tier != "") {w = "bold"}
  cell(
    if (mono == true) {text(font: "Pretendard", size: 15pt, fill: c)[#_text]}
    else {text(weight: w, size: 15pt, fill: c)[#_text]}
  )
}  

#let row_header(args) = {
  align(center)[
    #grid(
      columns: column_width,
      row_header_content("🦆", size:2.5em),
      row_header_content("🪿", size:2.5em), 
      row_header_content("문제"), 
      row_header_content("의도한 난이도"), 
      row_header_content("출제자")
    )
  ]
  line(length: 100%)
  v(1em)
}

#let row_contents(problem) = {
  align(center)[
    #grid(
      columns: column_width,
      row_content(problem.d2),
      row_content(problem.d1),
      align(left)[#row_content(problem.title)],
      align(left)[#row_content(problem.difftext, tier: problem.diff)],
      align(left)[#row_content(h(2em) + problem.setter.map(setter => {
        setter.at(0)
      }).join(", "), mono: true)],
      
    )
  ]
}
  
#let abstract_page(problems: ()) = {
  align(horizon)[
    #grid(
      columns: (100%),
      row_header(("🪿", "🦆", "문제", "의도한 난이도", "출제자")),
      ..problems.map(problem => {
        row_contents(problem)
      })
    )
  ]
  pagebreak(weak: true)
}
