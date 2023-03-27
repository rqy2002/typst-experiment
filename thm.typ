// theorem envioronment
#let theorem(name, counterFormat, seperator, titleFormat, bodyFormat, counter, title: none, body) = {
  set par(first-line-indent: 0pt)
  let result = parbreak() + [#name #counter.display(counterFormat)] + (if title != none [ (#titleFormat(title))]) + seperator + [  ] + bodyFormat(body)
  result
  counter.step()
}

#let newtheorem(id, name: none, counterFormat: "1", titleFormat: it => it, seperator: ".", bodyFormat: it => it) = {
  let counter = counter(id)
  theorem.with(if name == none {id} else {name}, counterFormat, seperator, titleFormat, bodyFormat, counter)
}
