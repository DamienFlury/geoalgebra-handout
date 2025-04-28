
#import "@preview/cetz:0.3.4": canvas, draw, angle

#set page(numbering: "1")
#set par(justify: true)

#align(center)[#text(size: 30pt, weight: "bold")[Geometrische Algebra] \
Damien Flury \
28. April 2025]

= Einführung

Die geometrische Algebra bietet eine einheitliche Sprache für Vektorrechnung. Sie hat Konzepte wie Bivektoren, Trivektoren und n-Vektoren und ermöglicht eine konsistente Algebra für Vektoren beliebigen Grades.

Ausserdem bietet die geometrische Algebra einen sehr einfachen Weg für Reflexionen und Rotationen und ist besonders für Computergrafik sehr geeignet und effizient. 


= Wedge-Produkt
Für das Verständnis der geometrischen Algebra ist es wichtig, dass wir nicht nur normale Vektoren betrachten, es gibt auch Bivektoren, Trivektoren und n-Vektoren. Einen Bivektor kann man sich als Parallelogramm vorstellen, einen Trivektor als
shiefes Parallelepiped.

Das Wedge-Produkt wird als $a and b$ geschrieben.
Für Vektoren $a$ und $b$ ist das Wedge-Produkt ein Bivektor. Der Ausdruck $a and b and c$ für beliebige Vektoren $a$, $b$ und $c$ ist ein Trivektor. Dies ist für alle Grade möglich, ein Trivektor und ein Vektor ergeben zusammen einen 4-Vektor, usw.

Mit der geometrischen Algebra können wir irgendwelche n-Vektoren kombinieren.

== Axiome des Wedge-Produkts
- $e_i and e_i = 0$
- $e_i and e_j = -e_j and e_i$

== Herleitung
$
arrow(u) and arrow(v) &= (u_1 e_1 + u_2 e_2) and (v_1 e_1 + v_2 e_2) \
&= u_1 e_1 and (v_1 e_1 + v_2 e_2) + u_2 e_2 and (v_1 e_1 + v_2 e_2) \
&= u_1 e_1 and v_1 e_1 + u_1 e_1 and v_2 e_2 + u_2 e_2 and v_1 e_1 + u_2 e_2 and v_2 e_2
$

  $
  arrow(u) and arrow(v) &= u_1 v_1 e_1 and e_1 + u_1 v_2 e_1 and e_2 + u_2 v_1 e_2 and e_1 + u_2 v_2 e_2 and e_2 \
  &= (u_1 v_2 - u_2 v_1) e_1 and e_2 \
  $
Das Wedge-Produkts zwischen zwei normalen Vektoren ergibt einen Bivektor und kann im 2D-Raum auch als Determinante geschrieben werden:
  $
    mat(delim: "|",
      u_1, v_1;
      u_2, v_2
    ) e_1 and e_2
  $

Wenn Dimension und Grad des Wedge-Produkts übereinstimmen, kann das Wedge-Produkt immer auch als Determinante geschrieben werden.

== Visualisierung eines Bivektors

  #grid(columns: 2, gutter: 2cm,
  [
  #canvas({
  import draw: *
  set-style(
  stroke: 1pt,
  grid: (
    stroke: gray + 0.2pt,
    step: 0.5
  )
)
merge-path(fill: aqua.lighten(60%), {
  line((0, 0), (4, 2.5), mark: (end: ">"), name: "a")
  line((), (5.5, 6.5), mark: (end: ">"))
  line((), (1.5, 4), mark: (end: ">"))
  line((), (0, 0), mark: (end: ">"), name: "b")
})
angle.angle((2.5, 3), (2, 4), (2.1, 4), radius: 0.7, mark: (end: ">"))
content("a", anchor: "north", $a$)
content("b", anchor: "east", padding: .2, $b$)
  // grid((0, 0), (10.5, 10.5), step: 0.5)
})
$a and b$
  ],
  [
#canvas({
  import draw: *
  set-style(
  stroke: 1pt,
  grid: (
    stroke: gray + 0.2pt,
    step: 0.5
  )
)
merge-path(fill: green.lighten(60%), {
  line((0, 0), (1.5, 4), mark: (end: ">"), name: "a")
  line((), (5.5, 6.5), mark: (end: ">"))
  line((), (4, 2.5), mark: (end: ">"))
  line((), (0, 0), mark: (end: ">"), name: "b")
})
angle.angle((2.5, 3), (2.1, 4), (2, 4.001), radius: 0.7, mark: (end: ">"), direction: "cw")
content("a", anchor: "east", padding: .2, $b$)
content("b", anchor: "north", padding: .2, $a$)
  // grid((0, 0), (10.5, 10.5), step: 0.5)
})
$b and a$
  ]
)


== Fläche eines Parallelogrammes
Es gilt
$
  |u| |v| sin phi = |u_1v_2 - u_2v_1| 
$
Somit ist $|u_1v_2 - u_2v_1|$ die Fläche des Parallelogrammes.

Der Term
  $
    u_1v_2 - u_2v_1
  $
  ist also die vorzeichenbehaftete Fläche des aufgespannten Parallelogrammes.

= Rechenbeispiel
$
  a = vec(3, 1) = 3e_1 + e_2 \
  b = vec(1, 2) = e_1 + 2e_2 \
$

  $
    a and b &= (3e_1 + e_2) and (e_1 + 2e_2) \
    &= 3e_1 and e_1 + 6e_1 and e_2 + e_2 and e_1 + 2e_2 and e_2 \
    &= 6e_1 and e_2 + e_2 and e_1 \
    &= 5e_1 and e_2
  $
  $
    = 5e_1 and e_2
  $
  Die Fläche des Parallelogramms ist 5

  $=>$ Gegenuhrzeigersinn
  $
    b and a = -5e_1 and e_2
  $
  Fläche ist -5 $=>$ Uhrzeigersinn

= In 3D
$
  a and b = (a_1b_2 - a_2b_1)e_1 and e_2 + (a_2b_3 - a_3b_2)e_2 and e_3 + (a_3b_1 - a_1b_3) e_3 and e_1
$

#canvas({
  import draw: *
  ortho({
  line((0, 0), (x: 10), mark: (end: ">"), name: "x-axis")
  line((0,0), (y: 10), mark: (end: ">"), name: "y-axis")
  line((0,0), (z: -10), mark: (end: ">"), name: "z-axis")
  let a = (0, 0, 0)
  let b = (4, 2, -1)
  let c = (6, 6, -2)
  let d = (c.at(0) - b.at(0), c.at(1) - b.at(1), c.at(2) - b.at(2))
  merge-path(fill: aqua.transparentize(20%), {
    line(a, b)
    line((), c)
    line((), d)
    line((), a)
  })


  merge-path(fill: gray.transparentize(60%), {
    line(a, (b.at(0), 0, b.at(2)))
    line((), (c.at(0), 0, c.at(2)))
    line((), (d.at(0), 0, d.at(2)))
    line((), a)
  })

  merge-path(fill: gray.transparentize(60%), {
    line(a, (0, b.at(1), b.at(2)))
    line((), (0, c.at(1), c.at(2)))
    line((), (0, d.at(1), d.at(2)))
    line((), a)
  })

  merge-path(fill: gray.transparentize(60%), {
    line(a, (b.at(0), b.at(1), 0))
    line((), (c.at(0), c.at(1), 0))
    line((), (d.at(0), d.at(1), 0))
    line((), a)
  })


  set-style(stroke: (dash: "dashed"))
  line(b, (b.at(0), 0, b.at(2)))
  line(b, (0, b.at(1), b.at(2)))
  line(b, (b.at(0), b.at(1), 0))

  line(c, (c.at(0), 0, c.at(2)))
  line(c, (0, c.at(1), c.at(2)))
  line(c, (c.at(0), c.at(1), 0))

  line(d, (d.at(0), 0, d.at(2)))
  line(d, (0, d.at(1), d.at(2)))
  line(d, (d.at(0), d.at(1), 0))


  content("x-axis.end", anchor: "north", $x$)
  content("y-axis.end", anchor: "east", padding: .2, $y$)
  content("z-axis.end", anchor: "west", padding: .2, $z$)
  })
})

$
  a and b = underbrace((a_1b_2 - a_2b_1), "Projektion auf" e_1 and e_2)e_1 and e_2 + underbrace((a_2b_3 - a_3b_2), "Projektion auf" e_2 and e_3)e_2 and e_3 + underbrace((a_3b_1 - a_1b_3), "Projektion auf" e_3 and e_1) e_3 and e_1
$
bedeutet:
- $A_12 = a_1b_2-a_2b_1$: Fläche der Projektion auf $e_1 and e_2$
- $A_23 = a_2b_3-a_3b_2$: Fläche der Projektion auf $e_2 and e_3$
- $A_31 = a_3b_1-a_1b_3$: Fläche der Projektion auf $e_3 and e_1$

Und:
$
|a and b|^2 &= A_12^2 + A_23^2 + A_31^2 \
|a and b| &= sqrt(A_12^2 + A_23^2 + A_31^2)
$
Also analog zum Betrag eines Vektors.

== Implementation eines Bivektors (in Rust)
$a and b = (a_1b_2 - a_2b_1)e_1 and e_2 + (a_2b_3 - a_3b_2)e_2 and e_3 + (a_3b_1 - a_1b_3) e_3  $
```rs
struct Bivector3d {
  xy: f32,
  yz: f32,
  zx: f32,
}

fn wedge_product((a_1, a_2, a_3), (b_1, b_2, b_3)) -> Bivector3d {
  return Bivector3d {
    xy: a_1 * b_2 - a_2 * b_1,
    yz: a_2 * b_3 - a_3 * b_2,
    zx: a_3 * b_1 - a_1 * b_3,
  }
}
```
In 3D entsprechen die Komponenten eines Bivektors denen des Vektorprodukts $a times b$. Das Vektorprodukt ist eigentlich auch ein Pseudovektor,
die korrekte Bezeichnung ist Bivektor. Das Kreuzprodukt wird insbesondere in Frankreich und Italien oft auch als Wedge-Produkt $a and b$ geschrieben.

Der Vorteil des Wedge-Produkts ist, dass es in beliebigen Dimensionen funktioniert. Das Vektorprodukt ist nur in 3D definiert.

== In beliebigen Dimensionen
In der Dimension $N$ erhalten wir beim Wedge-Produkt von $k$ Vektoren 
$
binom(N, k)
$
Komponenten.
=== Beispiel
- In 3D: $a and b$ resultiert in $lambda_1 e_1 and e_2 + lambda_2 e_2 and e_3 + lambda_3 e_3 and e_1$
- In 4D: $a and b$ resultiert in $lambda_1 e_1 and e_2 + lambda_2 e_1 and e_3 + lambda_3 e_1 and e_4 + lambda_4 e_2 and e_3 + lambda_5 e_2 and e_4 + lambda_6 e_3 and e_4$

= Das geometrische Produkt
== Definition
$
  a b = a dot b + a and b
$
$
  a b = underbrace(a dot b, "Skalar (0-Vektor)") + underbrace(a and b, "Bivektor (2-Vektor)")
$
== Axiome
$
  e_i^2 &= 1 \
  a^2 &= a dot a + a and a \
  a^2 &= |a|^2
$

=== Beispiel
$
  a &= vec(a_1, a_2, a_3) \
  a dot a &= a_1^2 + a_2^2 + a_3^2 \
  |a|^2 &= sqrt(a_1^2 + a_2^2 + a_3^2)^2 = a_1^2 + a_2^2 + a_3^2
$
und $a and a = 0$ (Axiom).
Somit ist $a^2 = a dot a + cancel(a and a) = |a|^2$.
#let colMath(x, color) = text(fill: color)[$#x$]
== Verhalten bei parallelen Vektoren
Bei parallelen Vektoren ist das Wedge-Produkt 0.
Somit ist das geometrische Produkt $a b = a dot b$ und kommutativ.
#grid(columns: 2, gutter: 2cm)[
#canvas({
  import draw: *
  line((0, 0), (6, 0), mark: (end: ">"), stroke: blue, name: "b")
  line((0, 0), (4, 0), mark: (end: ">"), stroke: red, name: "a")
  content("a",anchor: "north",  $colMath(a, #red)$)
  content("b",anchor: "north", $colMath(b, #blue)$)
})
][
  $colMath(a, #red) colMath(b, #blue) = colMath(b, #blue) colMath(a, #red)$ (Kommutativ)

  $
    a b = a dot b + cancel(a and b)
  $
]

== Verhalten bei orthogonalen Vektoren
Bei orthogonalen Vektoren ist das innere Produkt 0.
Somit ist das geometrische Produkt $a b = a and b$ und antikommutativ.
#grid(columns: 2, gutter: 2cm)[
#canvas({
  import draw: *
  line((0, 0), (6, 0), mark: (end: ">"), stroke: red, name: "a")
  line((), (6, 3), mark: (end: ">"), stroke: blue, name: "b")
  line((0, 0), (6, 3), mark: (end: ">"))
  angle.right-angle("a.end", "a.start", "b.end", radius: .5)
  content("a",anchor: "north", $colMath(a, #red)$)
  content("b",anchor: "west", $colMath(b, #blue)$)
})
][
  $colMath(a, #red) colMath(b, #blue) = -colMath(b, #blue) colMath(a, #red)$ (Antikommutativ)

  $
    a b = cancel(a dot b) + a and b
  $
]


= Reflexionen & Rotationen
== Reflexion
#grid(columns: 2, gutter: 2cm)[
#canvas({
  import draw: *
  line((0, 0), (0, 10), name: "m", mark: (end: ">"))
  line((0, 0), ((8, 8)), mark: (end: ">"), name: "x", stroke: blue)
  line((0, 0), ((-8, 8)), mark: (end: ">"), name: "x'", stroke: blue.lighten(60%))
  line((0, 0), (0, 8), mark: (end: ">"), name: "x||", stroke: red)
  line((0, 0), (-8, 0), name: "x_", mark: (end: ">"), stroke: green)
  content("x.end", anchor: "north", padding: .4, $colMath(x, #blue)$)
  content("x'.end", anchor: "north", padding: .4, $colMath(x', #blue.lighten(60%))$)
  content("x_.end", anchor: "north", padding: .2,$colMath(x_bot, #green)$)
  content("m.end", anchor: "east", padding: .2, $m$)
  content("x||.end", anchor: "east", padding: .2, $colMath(x_parallel, #red)$)
  angle.angle("x.start", "x.end", "m.end", radius: 1.5, label: $colMath(phi, #blue)$, stroke: blue)
  angle.angle("m.start", "m.end", "x'.end", radius: 1.5, label: $colMath(phi, #blue.lighten(60%))$, stroke: blue.lighten(60%))
})
][
- $x_parallel = (m dot x)m$
- $x_bot = (m and x)m$
$
x' &= x_parallel + x_bot \
&=(m dot x)m + (m and x)m \
&= (m dot x + m and x) m \
&= x' = m x m
$
]

== Reflexion an orthogonalem Vektor
#grid(columns: 2, gutter: 2cm)[
#canvas(length: 0.5cm, {
  import draw: *
  line((0, 0), (0, 10), name: "m", mark: (end: ">"))
  line((0, 0), ((8, 8)), mark: (end: ">"), name: "x", stroke: blue)
  line((0, 0), ((8, -8)), mark: (end: ">"), name: "x'", stroke: blue.lighten(60%))
  line((0, 0), (0, 8), mark: (end: ">"), name: "x||", stroke: red)
  // line((0, 0), (-8, 0), name: "x_", mark: (end: ">"), stroke: green)
  line((0, 0), (10, 0), name: "m_", mark: (end: ">"))
  line((8, 0), (8, -8), name: "-x||", mark: (end: ">"), stroke: red)
  content("x.end", anchor: "north", padding: .4, $colMath(x, #blue)$)
  content("x'.end", anchor: "north", padding: .4, $colMath(x', #blue.lighten(60%))$)
  content("m_.end", anchor: "north", padding: .2,$m_bot$)
  content("m.end", anchor: "east", padding: .2, $m$)
  content("x||.end", anchor: "east", padding: .2, $colMath(x_parallel, #red)$)
  content("-x||.end", anchor: "west", padding: .2, $colMath(-x_parallel, #red)$)
  angle.angle("m_.start", "m_.end", "x.end", radius: 1.8, label: $colMath(phi, #blue)$, stroke: blue)
  angle.angle("m_.start", "m_.end", "x'.end", radius: 1.8, label: $colMath(phi, #blue.lighten(60%))$, stroke: blue.lighten(60%), direction: "cw")
})
][
- $x_parallel = (m dot x)m$
- $x_bot = -(m and x)m$
$
x' &= -x_parallel x_bot \
&=-(m dot x)m - (m and x)m \
&= x' = -m x m
$
]
Nach dem gleichen System lassen sich Vektoren, Bivektoren, Trivektoren an Ebenen spiegeln.

== Rotationen
Rotationen sind nichts anderes als zwei aufeinanderfolgende Reflexionen.
#grid(columns: 2, gutter: 2cm)[
#canvas({
  import draw: *
  line((0, -5), (0, 5), name: "m", mark: (end: ">"))
  line((-5, 0), (5, 0), name: "n", mark: (end: ">"))
  line((0, 0), (-4, 4), name: "x", stroke: blue, mark: (end: ">"))
  line((0, 0), (4, 4), name: "x*", stroke: blue.lighten(60%), mark: (end: ">"))
  line((0, 0), (4, -4), name: "x'", stroke: blue, mark: (end: ">"))

  content("x.end", anchor: "north", padding: .4, $colMath(x, #blue)$)
  content("x'.end", anchor: "north", padding: .4, $colMath(x', #blue)$)
  content("m.end", anchor: "east", padding: .2, $m$)
  content("n.end", anchor: "west", padding: .2, $n$)
  content("x*.end", anchor: "north", padding: .4, $colMath(x^*, #blue.lighten(60%))$)
})
][
  $
  x^* &= m x m \
  x' &= n x^* n \
  &= n m x m n
  $
]