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


#set enum(numbering: "(i)")
#let cF = math.cal("F")
#let dplus = sym.plus.circle
#let dsum = sym.plus.circle.big
#let cong = sym.tilde.eqq
#let dlimit = math.lim
#let quad = math.space + math.space + math.space + math.space
#set math.lr(
  size: 0%
)

#let lemma = newtheorem("lemma", name: "引理")
#let thm = newtheorem("thm", name: [*定理*], bodyFormat: emph)

= 测试

#lemma([
  $op("Ext")^i(M(lambda), M(lambda)^(or)) = 0$.
])

#thm([
  若 $n$ 是大于 $2$ 的正整数, 则 $x^n + y^n = z^n$ 没有非平凡整数解.
], title: [Fermat])


如果我把中文和 English 混排, 会怎么样呢?

*设* $X$ 为 Noether 空间. _斜体qwq_ *粗体qwq*

+ 设 ${ cF_i }_(i in I)$ 是 $X$ 上的 Abel 群层, 则
  $ H^n(X, dsum_(i in I) cF_i) cong dsum_(i in I) H^n(X, cF_i) quad forall n. $
+ 设 $J$ 为有向集, $({ cF_i }, { phi_(i,j) })$ 为 $X$ 上 Abel 群层的有向系. 则
  $ H^n(X, dlimit_i cF_i) cong lim_i H^n(X, cF_i) quad forall n $
