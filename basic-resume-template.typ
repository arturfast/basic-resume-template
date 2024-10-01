// Basic Resume Template Artur Fast 2024


// Run this function first to format the whole document
// Include it like this: #show: format.with()
#let format(body) = {

  set page(margin: (y: 1cm, x: 1cm))
  
  set text(
    font: "Ubuntu",
    size: 11pt
  )
  
  show heading: set text(weight: "regular")
  
  show heading: heading => [
    #pad(top: 0pt, bottom: -15pt, [
  	#underline(smallcaps(heading.body))
    ])
  
    #line(length: 100%, stroke: (thickness: 0pt))
  ]

body
}

#let exp(timeframe: "", job: "", location: "") = {
  pad(left: 2%, right: 2%, [
      #grid(columns: (50%, 45%), column-gutter: 5%, [#grid(rows: 2, row-gutter: 5pt, [*#job*], [#text(fill: rgb("#999999"), weight: "regular", [#location])])], grid.cell(align: horizon, [#timeframe]))
  ])
}

#let edu(timeframe: "", school: "", location: "", degree: "") = {
  pad(left: 2%, right: 2%, [
    #if degree == "" [
      #grid(columns: (50%, 45%), column-gutter: 5%, [#grid(rows: 2, row-gutter: 5pt, [#school], [#text(fill: rgb("#999999"), weight: "regular", [#location])])], grid.cell(align: horizon, [#timeframe]))
    ] else [
      #grid(columns: (50%, 45%), column-gutter: 5%, [#grid(rows: 3, row-gutter: 5pt, [#school], [#text(fill: rgb("#999999"), weight: "regular", [#location])], [*#degree*])], grid.cell(align: horizon, [#timeframe]))
    ]
  ])
}

#let maketitle(name: "", email: "", phone: "", url: "") = {
  pad(y: 20pt)[
    #set align(center)
    #set text(font: "New Computer Modern")
    #grid(columns: 3, rows: 2, row-gutter: 18pt, column-gutter: 15pt, grid.cell(colspan: 3, align: center, [#text(size: 30pt, [#smallcaps(name)])]), [#email], [#phone], [#url])
  ]
}

// Everything has to be wrapped up in this
#let page_layout(left: "", right: "") = {
  grid(columns: (60%, 40%), [#left], [#right])
}

#let point(head: "", tail: "") = {
  grid(rows: 2, [#text(fill: rgb("#999999"), weight: "regular", [#head])], [#tail], gutter: 5pt)
}
