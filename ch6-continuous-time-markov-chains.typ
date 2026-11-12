#import "notes.typ": *

#outline(depth: 1)
#counter(heading).update(1)

= Basic Continuous Time
#definition(title: [CTMC])[
  We say $X_t$ with discrete state space $SS$ is a time homogenous CTMC if,
  for any $0<= s_0 < s_1 < dot.c < s_n < s$ and $t>=0$ we have
  $
    PP(X_(s+t) = j | X_s = i, X_(s_n)=i_n, ..., X_(s_0) = i_0) = PP(X_t = j | X_0 = i),
  $

]
