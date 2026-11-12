// Shared styles for the Typst copy of the MATH 526 notes (counterpart of ../preamble.tex).
// Each chapter file starts with
//   #import "notes.typ": *
//   #show: notes.with(head-right: [Chapter N: ...])

// Colour scheme: each kind of block is a box with a coloured left rule.
//   brown = theorem, proposition, lemma, corollary (and their proofs)
//   blue  = example        green = definition        grey = remark, notation
#let thmbar = rgb(150, 65, 8)
#let thmhead = rgb(122, 71, 37)
#let thmbg = rgb(249, 242, 236)
#let proofbg = rgb(254, 252, 251)
#let exbar = rgb(0, 111, 184)
#let exhead = rgb(67, 107, 153)
#let exbg = rgb(241, 244, 251)
#let exproofbg = rgb(251, 252, 254)
#let defbar = rgb(46, 125, 50)
#let defhead = rgb(40, 96, 48)
#let defbg = rgb(240, 247, 241)
#let rembar = rgb(150, 150, 150)
#let remhead = rgb(85, 85, 85)
#let rembg = rgb(247, 247, 247)

#let sans-font = "Latin Modern Sans"
// Theorems, propositions, lemmas, corollaries, definitions and examples share
// one counter, reset at every section: Theorem 2.7 = 7th numbered block of section 2.
#let thm-counter = counter("thm")
#let thm-number(loc) = (
  str(counter(heading).at(loc).first()) + "." + str(thm-counter.at(loc).first())
)

// Heading of a block, e.g. "Theorem 2.7 (Strong Markov property)."
// With numbered: true the block takes the next number automatically.
#let box-head(color, name, numbered: false, title: none) = {
  if numbered { thm-counter.step() }
  text(font: sans-font, fill: color, {
    strong({
      name
      if numbered { [ ] + context thm-number(here()) }
    })
    if title != none { [ (#title)] }
    strong[.]
  })
}

// References that compute their number: @-style links to a numbered block or
// to a section heading. (Equation numbers are written out by hand.)
#let thm-ref(lab) = link(lab, context thm-number(locate(lab)))
#let heading-ref(lab) = link(lab, context numbering("1.1", ..counter(heading).at(locate(lab))))

// A coloured block. A proof placed directly after a result or an example is
// attached to it: same left rule, no gap (below: 0pt / above: 0pt).
#let notes-box(bar: thmbar, head: thmhead, bg: thmbg, breakable: true,
               above: 10pt, below: 8pt, body) = block(
  width: 100%, fill: bg, stroke: (left: 2.5pt + bar),
  inset: (left: 9pt, right: 9pt, top: 6pt, bottom: 6pt),
  breakable: breakable, above: above, below: below, body)

// End-of-proof mark.
#let qed(color) = [#h(1fr)#text(fill: color)[$square$]]

// ---------------------------------------------------------------------------
// LaTeX-style environments. Use them like
//   #theorem(title: [Strong Markov property], label: <thm:smp>)[ ... ]
//   #proof[ ... ]                       // or #proof(title: [Proof of ...])[ ... ]
// Numbering, colours and the attachment of a proof to the result above it
// are automatic. Refer to a labelled block with #thm-ref(<thm:smp>).

#let result-style = (bar: thmbar, head: thmhead, bg: thmbg, proofbg: proofbg)
#let example-style = (bar: exbar, head: exhead, bg: exbg, proofbg: exproofbg)
#let definition-style = (bar: defbar, head: defhead, bg: defbg, proofbg: none)
#let remark-style = (bar: rembar, head: remhead, bg: rembg, proofbg: none)

// Style of the block a following proof should attach to (none = start fresh).
#let attach-to = state("notes-attach", none)

#let notes-env(name, style, numbered: true, breakable: true) = (title: none, label: none, body) => {
  attach-to.update(none)
  notes-box(bar: style.bar, head: style.head, bg: style.bg, breakable: breakable, {
    block(above: 0pt, below: 0.56em, box-head(style.head, name, numbered: numbered, title: title))
    if label != none [#metadata(none)#label]
    body
  })
  if style.proofbg != none { attach-to.update(style) }
}

#let theorem = notes-env([Theorem], result-style)
#let proposition = notes-env([Proposition], result-style)
#let lemma = notes-env([Lemma], result-style)
#let corollary = notes-env([Corollary], result-style)
#let example = notes-env([Example], example-style)
#let definition = notes-env([Definition], definition-style, breakable: false)
#let remark = notes-env([Remark], remark-style, numbered: false)
#let notation = notes-env([Notation], remark-style, numbered: false)

#let proof(title: [Proof], body) = {
  context {
    let st = attach-to.get()
    let attached = st != none
    let s = if attached { st } else { result-style }
    if attached { v(-8pt) }  // cancel the gap below the block it attaches to
    notes-box(bar: s.bar, head: s.head, bg: s.proofbg, above: if attached { 0pt } else { 10pt }, {
      block(above: 0pt, below: 0.56em, box-head(s.head, title))
      body
      qed(s.head)
    })
  }
  attach-to.update(none)
}

// Display equation with a number such as (3.1) at the right margin.
#let numbered-eq(num, eq) = block(width: 100%, breakable: false)[
  #eq#place(right + horizon)[(#num)]
]

#let title-block(subtitle) = align(center)[
  #v(4.2em)
  #text(size: 17.28pt)[Random Processes] \
  #text(size: 12pt, subtitle)
  #v(1em)
  #text(size: 12pt)[University of Michigan]
  #v(1.2em)
]

#let notes(head-right: [], body) = {
  set document(title: "MATH 526: Markov Chains")
  set page(
    paper: "us-letter",
    margin: 1in,
    header: context {
      if here().page() > 1 {
        set text(size: 10pt)
        [MATH 526: Markov Chains #h(1fr) #head-right]
        v(-0.7em)
        line(length: 100%, stroke: 0.4pt)
      }
    },
    footer: context align(center, counter(page).display()),
  )
  set text(font: "Latin Modern Roman", size: 10.95pt)
  show math.equation: set text(font: "Latin Modern Math")
  show raw: set text(font: "Latin Modern Mono", size: 10.95pt)
  set par(justify: true, leading: 0.56em, spacing: 0.56em + 4pt)
  set heading(numbering: "1.1")
  // LaTeX-style gap between the section number and its title.
  show heading: it => {
    if it.numbering == none { it } else {
      block(counter(heading).display(it.numbering) + h(0.9em) + it.body)
    }
    if it.level == 1 { thm-counter.update(0) }
  }
  show heading.where(level: 1): set text(size: 14.4pt)
  show heading.where(level: 1): set block(above: 1.8em, below: 1.1em)
  show heading.where(level: 2): set text(size: 12pt)
  show heading.where(level: 2): set block(above: 1.5em, below: 0.9em)
  // Table of contents as in LaTeX: bold section entries, no dot leaders.
  set outline.entry(fill: none)
  show outline.entry.where(level: 1): set text(weight: "bold")
  show outline.entry.where(level: 1): set block(above: 1.3em)
  set enum(spacing: 0.56em + 2pt)
  set list(spacing: 0.56em + 2pt)
  body
}
