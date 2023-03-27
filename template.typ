// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(title: "", authors: (), date: none, body) = {
  // Set the document's basic properties.
  set document(author: authors, title: title)
  set page(numbering: "1 / 1", number-align: start)
  let fonts = ("Iosevka", "Microsoft YaHei")
  set text(font: fonts, lang: "zh")
  set heading(numbering: "I.1. ")
  show heading: it => it.body + parbreak()

  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, title))
    #v(1em, weak: true)
    #date
  ]

  // Author information.
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center, emph(author))),
    ),
  )

  // Main body.
  set par(first-line-indent: 2em, justify: true)

  body
}
