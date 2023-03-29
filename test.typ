#import "template.typ": *
#import "chn.typ": setCJKmainfont
#import "thm.typ": *

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.
#show: project.with(
  title: "Test",
  authors: (
    "rqy",
  ),
)

#show: setCJKmainfont.with( font: "FZFangSong-Z02"
                          , boldFont: "FZHei-B01"
                          , italicFont: "FZKai-Z03"
                          , latinFont: "Iosevka")

#let max(x, y) = if x < y { y } else { x }

#let extarrow(left: $-$, mid: $-$, right: $arrow$,
  width) = box(width: width, {
    style(styles => {
      let m1 = measure(left, styles)
      let m2 = measure(mid, styles)
      let m3 = measure(right, styles)
      place(box(width: width - m2.width / 2,
        repeat($-$ + h(-m2.width / 2))))
      left
      h(width - m1.width - m3.width)
      right
  })
})

#let dlimit = math.limits(style(styles =>
  math.attach(math.limits(math.lim),
  bottom: move(dy: -0.3 * measure($arrow$, styles).height,
    text(bottom-edge: "descender",
    extarrow(measure(math.lim, styles).width))))
))

#let xrightarrow(top: none, bottom: none) = style(styles => {
  let l1 = measure(top, styles).width
  let l2 = measure(bottom, styles).width
  let l = measure($arrow$, styles).width
  math.attach(
    math.limits(extarrow(max(l, max(l1, l2)))),
    top: top, bottom: bottom
  )
})

#let xleftarrow(top: none, bottom: none) = style(styles => {
  let l1 = measure(top, styles).width
  let l2 = measure(bottom, styles).width
  let l = measure($arrow$, styles).width
  math.attach(
    math.limits(
      extarrow(left: $arrow.l$, right: $-$, max(l, max(l1, l2)))),
    top: top, bottom: bottom
  )
})

$ scripts(lim)_(lim_(dlimit_n)) $

$ dlimit_n (ZZ \/ ZZ_n) tilde.eqq product_p ZZ_p $

$ x arrow xrightarrow(top: pi, bottom: phi) y xrightarrow(top: f + g, bottom: tilde.eqq) pi $

#let quad = math.space + math.space + math.space + math.space
#set math.lr(
  size: 0%
)

如果我把中文和 English 混排, 会怎么样呢?

#set text(bottom-edge: "baseline")
#set rect(inset: 0pt)
#{rect(fill: aqua, math.lim)}
#{rect(fill: aqua, math.upright([lim]))}
#{rect(fill: aqua, sym.arrow.long)}
#{rect(fill: aqua, [lim])}

limit $dlimit$ lim

#let lemma = newtheorem("lemma", name: "引理")
#let thm = newtheorem("thm", name: [*定理*], bodyFormat: emph)

#lemma([
  $op("Ext")^i(M(lambda), M(lambda)^(or)) = 0$.
])

#thm([
  若 $n$ 是大于 $2$ 的正整数, 则 $x^n + y^n = z^n$ 没有非平凡整数解.
], title: [Fermat])