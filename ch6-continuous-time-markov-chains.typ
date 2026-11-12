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
    p_t (i,j) = PP(X_t = j|X_0 = i)
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

#theorem()[
  Assume a Markov chain admits jump rate $q(i,j)$, then given process starts from $i$, we have time of first jump $~"Exp"(lambda_i)$, where $lambda_i = sum_(j!=i) q(i,j)$.

  $lambda=0$ means constant chain at $i$.

  if $lambda_i != 0$, the probability that its first jump from $i$ lands in $j$ is $q(i,j)/lambda_i$
]

#example()[
  With Poisson process with intensity $lambda$, the jump rate
  $
    q(n,n+1)=lambda
  $
  Note the first jump time of Poisson is $"Exp"(lambda)$, hence $lambda = sum_(j!=i)q(i,j)=q(n,n+1)$.
]

#example()[
  Suppose member of population dies at rate $mu$ to give birth and $lambda$ to die.

  Let $X_t$ be the population at $t>0$, hence $q(n,n-1) = n mu, q(n,n+1)=n lambda$. This is due to the time of first birth (or death) from state $n$ is given by $"Exp"(sum_0^n lambda)="Exp"(n lambda)$ (or $mu$).

  For time of first jump, it is $"Exp"(n(lambda + mu))$. Let $tau_1~"Exp"(n lambda)$, similar with $tau_2$. Then
  $
    PP(tau_1 = min(tau_1, tau_2)) = lambda/(lambda+mu)
  $
]

#remark()[
  Rule of thumb: if there are several ind processes with given intensity which cause $X$ to jump, time of first jump is just sum of intensities.
]

#example()[
  Customers arrive in a bank according to Poisson with rate $lambda$. Bank has $s$ sellers. Each service time is iid $"Exp"(mu)$. $X_t$ is number of customer in bank at time $t$.

  Note $q(n,n+1)=lambda$, and $q(n,n-1)=min(n,s) mu$.
]


#theorem()[
  Given $q(i,j)$. Let $lambda_i = sum_(j!=i) q(i,j)$, $r(i,j) = q(i,j) \/ lambda_i$, then set $Z_n$ be a discrete markov chain with $r(i,j)$ transition, and $tau_n ~ "Exp"(lambda_(Z_n))$, then $X_t = Z_(M_t)$, where $M_t = sum_(k=0) bb(1)_{tau_0+...+tau_k <= t}$, where $X_t$ has the rate $q(i,j)$

  $Z_n$ is known as the embedded Markov chain.
]

#theorem(title: [Uniformization])[
    Let $sup_i lambda_i <= Lambda < oo$
]

#definition(title: [Regular Markov Chain])[
  A continuous time Markov Chain is regular if it is a.e. right continuous and it is bounded on any finite time interval.
]

#theorem()[
  If $X_t$ is regular Markov chain, then it admits $q(i,j)$ and $sum_(j!=i) q(i,j)< oo$
]

= Generators, Kolmogorov Equations







