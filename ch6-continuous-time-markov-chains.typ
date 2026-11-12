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
  outside of null sets.
]

#definition(title: [Transition Probability])[
  $forall i,j in SS$, and all $t>= 0$,
  $
    p_t(i,j) = PP(X_t = j|X_0 = i)
  $
  is the transition probability.
]

#definition(title: [Jump Rates])[
  Let $p_t(i,j)$ determine some CTMC, the jump rate $q(i,j)$ is
  $
    q(i,j) = lim_(h -> 0) (p_h (i,j)-p_0 (i,j))/(h)
  $
  provided that it exists.
]

We will only consider Markov chains with $sum_(j!=i) q(i,j)<oo$



