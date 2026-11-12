#import "notes.typ": *

#outline(depth: 1)
#counter(heading).update(1)

= Exponential Distribution
#definition(title: [Exponential Distribution])[
  A r.v. has an exponential distribution with rate $lambda > 0$ if it admits the following pdf
  $
    f(t) = cases(lambda e^(-lambda t) #h(1em) &t>=0, 0 #h(1em) &t<0)
  $
  We denote this as Exp$(lambda)$
]

#proposition()[
  Suppose $X~"Exp"(lambda)$, then
  $
    PP(X>t) = e^(-lambda t)
  $
]

#proposition()[
  Let $X~"Exp"(lambda)$, then the following holds
  - $EE(X) = lambda^(-1)$
  - If $mu>0$, then $mu^(-1) X ~ "Exp"(lambda mu)$
  - Let $s,t > 0$, then
  $
    PP(X>t + s | X>t) = PP(X>s)
  $
  - Let $lambda = lambda_1 + ... + lambda_n$, and $X_i ~ "Exp"(lambda_i)$ independent, then
  $
    min(X_1, ..., X_n)~"Exp"(lambda)
  $
]
Proof is almost immediate.

#theorem()[
  Let $tau_1, tau_2$ be independent exponential r.v., then
  $
    PP(tau_1 > tau_2 + s | tau_1 > tau_2) = PP(tau_1 > s)
  $
]
Proof is also almost immediate.

By tedious calculation, we have the following theorem-definition.
#definition(title: [Gamma Distribution])[
  Let $X_1,...,X_n$ be iid Exp($lambda$), then $G = sum X_i$ is called the Gamma distribution $Gamma(n, lambda)$. It has the pdf
  $
    f_G (t) = lambda e^(-lambda t) (lambda t)^(n-1) / (n-1)! #h(1em) t>=0
  $
  and $0$ elsewhere.
]

= Poisson Process
#definition(title: [Poisson Process])[
  A Poisson Process $N_t$ with intensity $lambda$ is a process defined my
  $
    N_t = max(n>=0 : T_n <= t)=sum_(j=1)^oo bb(1)_{T_n<=t},
  $
  where $T_n = tau_1+...+tau_n$, $tau_j ~ "Exp"(lambda)$ iid.
]
It is used to model the number of occurences of certain event before time $t$, assuming the time between occurences follows exponential distribution of $lambda$.

#definition(title: [Poisson Distribution])[
  A r.v. $X$ is said to be poisson with mean $lambda$ if
  $
    PP(X = n) = (e^(-lambda)lambda^n) / n!
  $
  It is denoted as $X~"Pois"(lambda)$
]

We now give several properties of Poisson distribution. They are easy to check.
#proposition()[
  If $X~"Pois"(lambda)$, then $EE[X(X-1)...(X-k-1)] = lambda^k$ for all $k>= 0$.

  In particular, $EE X = lambda= "Var"X$.
]

#proposition()[
  Let $X_i ~ "Pois"(lambda_i)$, $i = 1, ... , n$, $X_i$ independent, then
  $
    X_1 + ... + X_n ~ "Pois"(lambda_1 + ... + lambda_n)
  $
]

The following theorem gives the name for Poisson process.
#theorem()[
  If $N_t$ is Poisson of intensity $lambda$, then for $t>0$, we have $N_t ~ "Pois"(lambda t)$
]
#proof()[
  Consider the event ${N_t = n} = {max(m>=0 : T_m<= t) = n} = {T_n <= t} inter {T_(n+1) >t}$, hence
  $
    PP(T_n<=s inter T_(n+1) > s) &=PP(T_n <=s) - PP(T_(n+1) <= s)\
    &= integral_0^s lambda e^(-lambda t) ( (lambda t)^(n-1)/(n-1)! - (lambda t)^(n)/n! ) d t\
    &= integral_0^s lambda e^(-lambda t) (lambda t)^(n-1) ((n-lambda t)/n!) d t \
    &= integral_0^s [(lambda e^(-lambda t))/n! (lambda t)^(n-1) n - (lambda e^(-lambda t)) / n! (lambda t)^n ]d t\
    &= integral_0^s ((e^(-lambda t))/n! dot.c (lambda t)^n)^prime d t =(e^(-lambda s) (lambda s)^n) / n!
  $
]

The next theorem gives the Markov property of the Poisson process
#lemma(title: [Markov property at a fixed time], label: <lem:poisson-fixed>)[
  Let $N_t$ be a Poisson process with intensity $lambda$ and let $s >= 0$.
  Then $(N_(s+t) - N_s)_(t>=0)$ is a Poisson process with intensity $lambda$ and
  is independent of $cal(F)_s$.
]
#proof()[
  We first note that
  $
    N_(s+t) - N_s & = sum_(n>0) bb(1)_{T_n <= s+t} - sum_(n>0) bb(1)_{T_n <= s} \
                  & = sum_(n>0) bb(1)_{s < T_n <= s+t} \
                  & = sum_(n>N_s)bb(1)_{T_n <=s+t} = sum_(j>0) bb(1)_{T_(N_s+j)-s <= t}
  $
  Therefore we need to show $(T_(N_s + j) - s)$ is a sum of iid exponential independent of $cal(F)_s$ with intensity $lambda$.

  We argue the following construction works. Let $E_1 = T_(N_s + 1) - s$, and
  $E_j = T_(N_s + j) - T_(N_s + j - 1)$ for $j>=2$. Note
  $
    T_(N_s + j) - s = sum_(m=1)^j E_m.
  $
  We claim
  $
    PP(A inter {E_1>x_1,...,E_n>x_n}) = PP(A) product_(j=1)^n e^(-lambda x_j),
  $
  for all $A in cal(F)_s$.

  Notice first that for all $u<s$, given $N_s = k$, we have
  $
    N_u = sum_(m=0)^k bb(1)_({T_m<=u}).
  $
  Hence we can always find $B_k$ Borel such that
  $
    & {N_u=m} inter {N_s = k} = {(T_1,...,T_k) in B_k} inter {N_s = k},
  $
  so for all $A in cal(F)_s$, $A inter {N_s = k} = {(T_1,...,T_k) in B_k} inter {N_s = k}$.
  Let $cal(G)_k := sigma(T_1, ..., T_k)$.

  Consider
  $
    & PP(A inter {N_s = k} inter {E_1>x_1,..., E_n>x_n})\
    =& PP({(T_1,...,T_k) in B_k} inter {N_s = k}inter {N_s = k} inter {E_1>x_1,..., E_n>x_n})\
    =& EE(bb(1)_{(T_1,...,T_k) in B_k} bb(1)_{N_s = k} PP(tau_(k+1)>x_1+s-T_k, tau_(k+2)>x_2, ..., tau_(k+n)>x_n | cal(G)_k))\
    =& EE(bb(1)_{(T_1,...,T_k) in B_k}bb(1)_{N_s = k}PP(tau_(k+1)>x_1+s-T_k | cal(G)_k))product_(j=2)^n e^(-lambda x_j)\
    =& PP({(T_1,...,T_k) in B_k} inter {N_s = k}) product_(j=1)^n e^(-lambda x_j)\
  $
  Sum over $k$, we have $sum_k PP((T_1,...,T_k) in B_k inter {N_s= k})=sum_k PP(A inter {N_s = k})= PP(A)$.
  Hence our claim is true. Take $A= Omega$ yields $E_j$ is Poisson.
  Also, by Dynkin d-p lemma, $E_j$ is independent from $cal(F)_s$.
]

#theorem(title: [Poisson is Markovian])[
  Let $N_t$ be a Poisson process with intensity $lambda$ and natural filtration $cal(F)_t$, and let $S$
  be a stopping time with $S < oo$ a.s.
  Define $tilde(N)_t = N_(S+t)-N_S$. Then $(tilde(N)_t)_(t>=0)$ is a Poisson process with
  intensity $lambda$
  and is independent of $cal(F)_S$.
]
We shall handwave the proof by claiming it comes from standard machinery.

We then have some corollary:
#corollary()[
  Let $N_t$ be Poisson with rate $lambda$, then
  $
    N_t - N_s ~ "Pois"((t-s) lambda),
  $
  for all $0 <= s < t < oo$
]

#corollary()[
  A Poisson process has independent increments, i.e. $N_(t_i) - N_(t_j)$
  are independent.
]

#theorem()[
  A stochastic process $N_t$ is a Poisson process of parameter $lambda$ iff
  - $N_0=0$
  - $N_(t+s)-N_s ~ "Pois"(lambda t)$ for all $t,s >= 0$
  - $N_t$ has independent increments.
]

Poisson Process can also be identified by
#theorem()[
  A stochasti process $N_t$ is Poisson of parameter $lambda$ iff
  - Almost surely each path $N_t$ starts with zero and right continuous.
  - For all $s,t>0$, for all $u < s$, $N_(t+s) - N_s$ independent of $N_u$
  - Distribution of $N_(t+s)-N_s$ independent of $s$
]

#theorem()[
  If $N_t$ is Poisson process with intensity $lambda$, then
  $
    (PP(N_(t+h) - N_t >=1)) / (h) -> lambda "as" h -> 0
  $
]

#definition(title: [Non-Homo Poisson Process])[
  A stochastic process $N_t$ is called a non-homogenous Poisson process with rate function $lambda:RR_(>= 0) -> RR_(>=0)$ if
  - $N_0 = 0$
  - $(N_t)$ has independent increments
  - $N_t - N_s ~ "Pois"(integral^t_s lambda(u) d u)$
]

#definition(title: [Compound Poisson Process])[
  $S_t$ is a compound Poisson process if
  $
    S_t = sum_j^N_t Y_j
  $
  where each $S_t$ is a Poisson process.
]


