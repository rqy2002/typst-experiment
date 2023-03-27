// 中文排版的字体使用.

#let setCJKmainfont(font : none,
                    boldFont : none,
                    italicFont : none,
                    latinFont: none,
                    body) = {
    let withLatin(f) = { if latinFont == none { f } else { (latinFont, f) } }
    set text(font: withLatin(font)) if font != none
    show strong: set text(font: withLatin(boldFont), style: "normal") if boldFont != none
    show emph: set text(font: withLatin(italicFont), style: "normal") if italicFont != none
    body
}
