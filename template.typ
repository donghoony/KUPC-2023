// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#import "emoji/lib.typ" : *

// 그래프를 그릴 수 있습니다.
#import "@preview/gviz:0.1.0": *

#let project(title: "", authors: (), logo: none, body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(numbering: "1", number-align: bottom + right, flipped: true, background: image("images/bg1.png"))
  set text(font: "Pretendard", lang: "ko")
  
  v(10fr)


  // Author information.
  grid(columns: (50%, 50%),  
  
    pad(
        top: 0.7em,
        right: 20%,
        grid(
          columns: (1fr,) * calc.min(3, authors.len()),
          gutter: 1em,
          ..authors.map(author => align(start, author)),
        ),
      ), 
  )
  v(2.4fr)

  pagebreak()
  set page(background: none)

  // Main body.
  set par(justify: true)
  show raw.where(lang: "render"): it => render-image(it.text)
  
  setup-emoji(body)
}