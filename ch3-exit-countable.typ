// Typst copy of ch3-exit-countable/ch3-exit-countable.tex. Shared styles are in notes.typ.
#import "notes.typ": *
#show: notes.with(head-right: [Chapter 3: Lectures 8--9])

#title-block[Chapter 3: Exit problems and countable state spaces]


#outline(depth: 1)

#pagebreak()

#counter(heading).update(7)

= Lecture 8: Exit distributions and expected exit times

== Hitting a boundary, including time zero

#definition(title: [Time-zero hitting and exit times])[
Let $(X_n)_(n in bb(Z)_(gt.eq 0))$ be a Markov chain on a countable state space $S$. For each target set $A subset.eq S$ and state $y in S$, define
$ V_A = inf { n in bb(Z)_(gt.eq 0) : X_n in A } , #h(2em) V_y = V_({ y }) , #h(2em) inf nothing = oo . $
Thus $V_A$ is the first time the chain reaches $A$, including time zero; it is $oo$ if $A$ is never reached. Equivalently, $V_A$ is the #emph[exit time from $S without A$];, with $A$ called the boundary.
]

#remark(title: [Stopping-time property and the time-zero convention])[
For a countable-state chain $(X_n)_(n in bb(Z)_(gt.eq 0))$ on $S$, let $cal(F)_n = sigma (X_0 , dots.h , X_n)$ for each integer $n gt.eq 0$. For every $A subset.eq S$, $y in S$, and integer $n gt.eq 0$,
$ { V_A lt.eq n } = union.big_(j = 0)^n { X_j in A } in cal(F)_n , #h(2em) V_y = cases(delim: "{", 0 , & X_0 = y ,, T_y , & X_0 eq.not y .) $
Thus $V_A$ is a stopping time, whereas $T_y = inf { j in bb(Z)_(gt.eq 1) : X_j = y }$ counts only positive-time visits.
]

#notation(title: [Minimum and maximum])[
For $a , b in [- oo , oo]$,
$ a and b = min (a , b) , #h(2em) a or b = max (a , b) . $
]

#lemma(title: [Finite-state accessibility gives a geometric tail], label: <lem:boundary-tail>)[
Let $(X_n)_(n in bb(Z)_(gt.eq 0))$ be a Markov chain with transition matrix $P$ on a finite state space $S$, and let $nothing eq.not A subset.eq S$. Suppose $bb(P)_x (V_A < oo) > 0$ for every $x in S without A$. There exist an integer $L gt.eq 1$ and a number $delta in (0 , 1)$, depending only on $P , A$, such that for every $x in S$ and integer $k gt.eq 0$,
$ bb(P)_x (V_A > k L) lt.eq (1 - delta)^k , #h(2em) bb(E)_x V_A lt.eq L \/ delta < oo . $
In particular, the boundary is reached almost surely from every state.
]

#proof[
If $A = S$, take $L = 1$, $delta = 1 \/ 2$. Otherwise choose, for each $z in S without A$, a path to $A$ of integer length $ell_z gt.eq 1$ and probability $d_z in \( 0 , 1 \]$. Finiteness gives
$ L = max_(z in S without A) ell_z < oo , #h(2em) delta = min  {1 / 2 , min_(z in S without A) d_z} > 0 ,\
inf_(z in S without A) bb(P)_z (V_A lt.eq L) gt.eq delta . $
Fix $x in S$. For each integer $k gt.eq 0$, the Markov property at time $k L$ and induction give
$ bb(P)_x (V_A > (k + 1) L) & = bb(E)_x  [upright(bold(1))_({ V_A > k L }) bb(P)_(X_(k L)) (V_A > L)]\
 & lt.eq (1 - delta) bb(P)_x (V_A > k L) lt.eq (1 - delta)^(k + 1) . $
Hence
$ bb(E)_x V_A = sum_(n gt.eq 0) bb(P)_x (V_A > n) lt.eq L sum_(k gt.eq 0) (1 - delta)^k = L \/ delta . $
]

#remark(title: [Why both hypotheses matter])[
In Lemma~#thm-ref(<lem:boundary-tail>);, positive hitting probability is required from #emph[every]; $x in S without A$. On a countably infinite state space $S$, an integer $L gt.eq 1$ and a number $delta in (0 , 1)$ valid for all initial states $x in S$ need not exist; positive accessibility need not imply almost-sure hitting or finite mean.
]

== Exit probabilities and the boundary-value equations

#definition(title: [Exit probability])[
Let $(X_n)_(n in bb(Z)_(gt.eq 0))$ be a Markov chain on a countable state space $S$, and let $A , B subset.eq S$ be disjoint nonempty sets. Put $V_C = inf { n in bb(Z)_(gt.eq 0) : X_n in C }$ for $C in { A , B }$. The #emph[exit-probability function]; $h : S arrow.r [0 , 1]$ is defined, for each $x in S$, by
$ h (x) = bb(P)_x (V_A < V_B) , $
the probability of reaching $A$ before $B$, counting time zero.
]

#theorem(title: [Exit probabilities; Lecture 8, Section 1.9], label: <thm:exit-prob>)[
Let $P = (p (x , y))_(x , y in S)$ be the transition matrix of a Markov chain on a finite state space $S$. Fix disjoint nonempty sets $A , B subset.eq S$ and define $h : S arrow.r [0 , 1]$ by $h (x) = bb(P)_x (V_A < V_B)$ for every $x in S$. Then
$ h lr(|""_A = 1 , #h(2em) h|)_B = 0 , #h(2em) h (x) = sum_(y in S) p (x , y) h (y) quad (x in S without (A union B)) . $
If $bb(P)_x (V_(A union B) < oo) > 0$ for every $x in S without (A union B)$, these equations have a unique solution among functions $S arrow.r bb(R)$.
]

#proof[
#emph[Boundary values and recursion.]; Disjointness and first-step conditioning give
$ h lr(|""_A = 1 , #h(2em) h|)_B = 0 . $
For each $x in S without (A union B)$,
$ h (x) = sum_(y in S) bb(P)_x (X_1 = y) bb(P)_y (V_A < V_B) = sum_(y in S) p (x , y) h (y) . $
#emph[Uniqueness.]; Under the accessibility assumption, take any two solutions $h_1 , h_2 : S arrow.r bb(R)$ and put $u = h_1 - h_2$, $V = V_(A union B)$. Then $u \|_(A union B) = 0$. For every $x in S$ and integer $n gt.eq 0$, iteration of the harmonic equation yields
$ u (x) = bb(E)_x [u (X_n) upright(bold(1))_({ V > n })] , #h(2em) lr(|u (x)|) lt.eq max_(z in S) lr(|u (z)|) thin bb(P)_x (V > n) --> 0 $
by Lemma~#thm-ref(<lem:boundary-tail>);. Thus $u = 0$.
]

#example(title: [Nonuniqueness with an inaccessible closed class])[
Let $S = { a , b , c }$ consist of three distinct absorbing states, so that $P = I_3$, and take $A = { a }$, $B = { b }$. The equations for a candidate function $h : S arrow.r bb(R)$ reduce to
$ h (a) = 1 , #h(2em) h (b) = 0 , #h(2em) h (c) = h (c) . $
The boundary-value equations allow any real $h (c)$, although $bb(P)_c (V_A < V_B) = 0$. A finite state space alone does not give uniqueness.
]

#corollary(title: [Matrix form of the exit problem], label: <cor:matrix-exit-prob>)[
Let $P = (p (x , y))_(x , y in S)$ be a Markov transition matrix on a finite state space $S$. For disjoint nonempty sets $A , B subset.eq S$, define $h (x) = bb(P)_x (V_A < V_B)$ for every $x in S$, and put
$ D = S without (A union B) , quad Q = (p (x , y))_(x , y in D) , quad b (x) = sum_(y in A) p (x , y) quad (x in D) . $
Let $h_D = (h (x))_(x in D)$ and $b = (b (x))_(x in D)$ be column vectors, and $I$ be the identity matrix on $D$. The boundary-value equations become
#numbered-eq("8.1")[$ (I - Q) h_D = b . $] <eq:exit-linear>
If $bb(P)_x (V_(A union B) < oo) > 0$ for every $x in D$, Lemma~#thm-ref(<lem:boundary-tail>); gives
$ Q^n limits(-->)_(n arrow.r oo) 0 , #h(2em) (I - Q)^(- 1) = sum_(n gt.eq 0) Q^n , #h(2em) h_D = (I - Q)^(- 1) b . $
Thus the exit probability is obtained from a finite linear system.
]

#proof[
#enum(numbering: "1.",
[
We first show $(I - Q) h_D = b$. By the previous theorem #thm-ref(<thm:exit-prob>);, we have $h$ is harmonic in $D$. Then we have
$ h_D (x) = sum_(y in S) p (x , y) h (y) = sum_(y in D) p (x , y) h (y) + sum_(y in A) p (x , y) h (y) + sum_(y in B) p (x , y) h (y) $
Since $h (y) = 1$ for $y in A$ and $h (y) = 0$ for $y in B$, we have
$ h_D (x) = sum_(y in D) p (x , y) h (y) + b (x) ==> (I - Q) h_D = b . $
],
[
Now we show $Q^n arrow.r 0$ as $n arrow.r oo$. Notice by $S$ is finite, every state reaches boundary almost surely. Let $x in D$, then
$ Q^n (x , y) = bb(P)_x (X_n = y , V_(A union B) > n) lt.eq bb(P)_x (V_(A union B) > n) arrow.r 0 . $
],
[
Now we show $(I - Q)^(- 1) = sum_(n gt.eq 0) Q^n$. Since $Q^n (x , y) lt.eq (1 - delta)^n$ for some $delta > 0$, we have that it is summable. In particular, we have
$ (I - Q) (I + Q + Q^2 + dots.h.c + Q^(n - 1)) = I - Q^n . $
As $n arrow.r oo$, we have $Q^n arrow.r 0$, so
$ (I - Q)^(- 1) = sum_(n gt.eq 0) Q^n . $
],
[
Lastly, we show $h_D = (I - Q)^(- 1) b$. This is trivial since we now know $(I - Q)$ is invertible.
]
)
]

== Mixtures over closed recurrent classes

#definition(title: [Class-entry probabilities])[
Let $(X_n)_(n in bb(Z)_(gt.eq 0))$ be a Markov chain with transition matrix $P$ on a finite state space $S$. 
Let all its closed irreducible classes as $R_1 , dots.h , R_k$, where $k gt.eq 1$ is their number. 

For each $i in { 1 , dots.h , k }$, let $pi_i : S arrow.r [0 , 1]$ be the stationary distribution on $R_i$, extended by zero on $S without R_i$, and put $V_(R_i) = inf { n in bb(Z)_(gt.eq 0) : X_n in R_i }$. Define $alpha_i : S arrow.r [0 , 1]$ by

$ alpha_i (x) = bb(P)_x (V_(R_i) < oo) #h(2em) (x in S , med i = 1 , dots.h , k) . $

This is the probability that a chain started at $x$ eventually enters class $R_i$ (and thereafter stays there).
]

#remark(title: [Computing the mixing weights])[
For a finite-state Markov chain on $S$ with transition matrix $P$, let $R_1 , dots.h , R_k$ be all its closed irreducible classes, and set $D = S without union.big_(i = 1)^k R_i$. The class-entry probabilities $alpha_i (x) = bb(P)_x (V_(R_i) < oo)$ satisfy
$ sum_(i = 1)^k alpha_i (x) & = 1 &  & (x in S) ,\
alpha_i \|_(R_j) & = upright(bold(1))_({ i = j }) &  & (i , j in { 1 , dots.h , k }) ,\
alpha_i (x) & = sum_(y in S) p (x , y) alpha_i (y) &  & (x in D , med i in { 1 , dots.h , k }) . $
For $k gt.eq 2$ and each $i in { 1 , dots.h , k }$, compute $alpha_i$ by #link(<eq:exit-linear>)[(8.1)]; with $A = R_i$ and $B = union.big_(j in { 1 , dots.h , k } without { i }) R_j$. If $k = 1$, then $alpha_1 (x) = 1$ for every $x in S$.
]

#proposition(title: [Limiting mixtures over closed classes], label: <prop:class-mixture>)[
Let $P$ be a Markov transition matrix on a finite state space $S$, with all its closed irreducible classes $R_1 , dots.h , R_k$. For each $i in { 1 , dots.h , k }$, let $pi_i$ be its stationary distribution extended by zero outside $R_i$, and set $alpha_i (x) = bb(P)_x (V_(R_i) < oo)$ for $x in S$. If every $R_i$ is aperiodic, then for every $x , y in S$,
$ lim_(n arrow.r oo) P^n (x , y) = sum_(i = 1)^k alpha_i (x) pi_i (y) . $
Without aperiodicity, for every $x , y in S$,
$ lim_(n arrow.r oo) 1 / n sum_(j = 1)^n P^j (x , y) = sum_(i = 1)^k alpha_i (x) pi_i (y) . $
Both limits are along integers $n gt.eq 1$.
]

#proof[
Fix $x , y in S$. Put $V = V_(union_(i = 1)^k R_i)$ and, for integers $t gt.eq 0$ and $z in union.big_(i = 1)^k R_i$, put $e (t , z) = bb(P)_x (V = t , X_V = z)$. Finite-state decomposition gives $bb(P)_x (V < oo) = 1$ and, for each $i in { 1 , dots.h , k }$,
$ alpha_i (x) = sum_(t gt.eq 0) sum_(z in R_i) e (t , z) . $
For integers $n gt.eq M gt.eq 0$, the strong Markov property gives
$ P^n (x , y) = sum_(i = 1)^k sum_(t = 0)^M sum_(z in R_i) e (t , z) P^(n - t) (z , y) + epsilon_(n , M) , #h(2em) 0 lt.eq epsilon_(n , M) lt.eq bb(P)_x (V > M) . $
In the aperiodic case, Theorem~6.7(1) gives $P^(n - t) (z , y) arrow.r pi_i (y)$ as $n arrow.r oo$ for each fixed $i in { 1 , dots.h , k }$, integer $t gt.eq 0$, and $z in R_i$. Therefore
$ limsup_(n arrow.r oo) lr(|P^n (x , y) - sum_(i = 1)^k alpha_i (x) pi_i (y)|) lt.eq 2 bb(P)_x (V > M) limits(-->)_(M arrow.r oo) 0 . $
For Cesàro averages, Theorem~6.7(5) gives, for each fixed $i in { 1 , dots.h , k }$, integer $t gt.eq 0$, and $z in R_i$,
$ 1 / n sum_(j = t)^n P^(j - t) (z , y) --> pi_i (y) quad (n arrow.r oo) . $
The first $M$ terms contribute at most $M \/ n$; the same truncation bound then proves the result without aperiodicity.
]

#example(title: [The six-state chain, including the alternate initial state])[
Let $S = { 1 , dots.h , 6 }$, with rows and columns in that order. The lecture's Markov chain on $S$ has transition matrix
$ P = mat(delim: "(", 1 \/ 4, 1 \/ 2, 1 \/ 4, 0, 0, 0; 1 \/ 4, 1 \/ 4, 1 \/ 4, 0, 1 \/ 4, 0; 0, 0, 3 \/ 10, 7 \/ 10, 0, 0; 0, 0, 2 \/ 10, 8 \/ 10, 0, 0; 0, 0, 0, 0, 3 \/ 5, 2 \/ 5; 0, 0, 0, 0, 1 \/ 2, 1 \/ 2) . $
The transient states are $1 , 2$. Two-state balance gives the closed classes and their stationary laws:
$ A = { 3 , 4 } , quad pi_A = (2 \/ 9 , 7 \/ 9) , #h(2em) B = { 5 , 6 } , quad pi_B = (5 \/ 9 , 4 \/ 9) . $
Both classes are aperiodic because they have self-loops. For $h (x) = bb(P)_x (V_A < V_B)$ defined for every $x in S$,
$ h (1) & = 1 / 4 h (1) + 1 / 2 h (2) + 1 / 4 , & h (2) & = 1 / 4 h (1) + 1 / 4 h (2) + 1 / 4 ,\
3 h (1) - 2 h (2) & = 1 , & - h (1) + 3 h (2) & = 1 ,\
h (1) & = 5 \/ 7 , & h (2) & = 4 \/ 7 . $
Hence
$ lim_(n arrow.r oo) P^n (1 , dot.op) & = (0 , 0 , 10 \/ 63 , 35 \/ 63 , 10 \/ 63 , 8 \/ 63) ,\
lim_(n arrow.r oo) P^n (2 , dot.op) & = (0 , 0 , 8 \/ 63 , 28 \/ 63 , 15 \/ 63 , 12 \/ 63) . $
Both rows sum to one; their masses on $B$ are $2 \/ 7$ and $3 \/ 7$ respectively. For every probability distribution $mu$ on $S$ and every $y in S$,
$ lim_(n arrow.r oo) (mu P^n) (y) = sum_(x in S) mu (x) [h (x) pi_A (y) + (1 - h (x)) pi_B (y)] , $
where $pi_A , pi_B$ are extended by zero outside their respective classes.
]

== Expected exit times and their linear system

#definition(title: [Expected exit time])[
Let $(X_n)_(n in bb(Z)_(gt.eq 0))$ be a Markov chain on a countable state space $S$, and let $nothing eq.not A subset.eq S$. Put $V_A = inf { n in bb(Z)_(gt.eq 0) : X_n in A }$. The #emph[expected exit-time function]; $g : S arrow.r [0 , oo]$ is
$ g (x) = bb(E)_x V_A in [0 , oo] #h(2em) (x in S) , $
the mean number of steps needed to reach $A$ when starting at $x$.
]

#theorem(title: [Expected exit time; Lecture 8, Section 1.10], label: <thm:exit-time>)[
Let $P = (p (x , y))_(x , y in S)$ be a Markov transition matrix on a finite state space $S$, and let $nothing eq.not A subset.eq S$. Define $g (x) = bb(E)_x V_A$ for every $x in S$. Then
$ g \|_A = 0 , #h(2em) g (x) = 1 + sum_(y in S) p (x , y) g (y) quad (x in S without A) . $

If $bb(P)_x (V_A < oo) > 0$ for every $x in S without A$, then $g (x) < oo$ for every $x in S$, and $g$ is the unique solution among functions $S arrow.r bb(R)$. 

Under this accessibility assumption, for $D = S without A$, set $Q = (p (x , y))_(x , y in D)$ and $g_D = (g (x))_(x in D)$ as a column vector. With $I$ the identity on $D$ and $bold(1)$ the column vector of ones,
#numbered-eq("8.2")[$ (I - Q) g_D = bold(1) , #h(2em) g_D = (I - Q)^(- 1) bold(1) = sum_(n gt.eq 0) Q^n bold(1) . $] <eq:exit-time-linear>
]

#proof[
#emph[Recursion.]; For each $x in S without A$, first-step conditioning gives
$ bb(E)_x V_A = 1 + sum_(y in S) bb(P)_x (X_1 = y) bb(E)_y V_A = 1 + sum_(y in S) p (x , y) g (y) . $
Nonnegativity permits infinite values. On $A$, $V_A = 0$.

#emph[Finiteness and uniqueness.]; Under accessibility, Lemma~#thm-ref(<lem:boundary-tail>); gives constants $L in bb(Z)_(gt.eq 1)$ and $delta in (0 , 1)$ such that, for every $x in S$,
$ g (x) lt.eq L \/ delta < oo . $
For any two solutions $g_1 , g_2 : S arrow.r bb(R)$, their difference $u = g_1 - g_2$ satisfies $u \|_A = 0$ and $u (x) = (P u) (x)$ for every $x in S without A$, so $u$ is harmonic. Hence by maximum principle, $u equiv 0$ on $S without A$.

#emph[Matrix formula.]; For every $x in D$ and integer $n gt.eq 0$,
$ (Q^n bold(1)) (x) = bb(P)_x (V_A > n) , #h(2em) g_D = sum_(n gt.eq 0) Q^n bold(1) = (I - Q)^(- 1) bold(1) . $
]

#definition(title: [Fundamental matrix for a stopped chain; supplement])[
Let $(X_n)_(n in bb(Z)_(gt.eq 0))$ be a Markov chain with transition matrix $P = (p (x , y))_(x , y in S)$ on a finite state space $S$. Fix $nothing eq.not A subset.eq S$ and assume $bb(P)_x (V_A < oo) > 0$ for every $x in S without A$, where $V_A = inf { n in bb(Z)_(gt.eq 0) : X_n in A }$. Put
$ D = S without A , #h(2em) Q = (p (x , y))_(x , y in D) , $
and let $I$ be the identity matrix indexed by $D$. The #emph[fundamental matrix]; of the chain stopped on reaching $A$ is
$ F = (I - Q)^(- 1) = sum_(n gt.eq 0) Q^n . $
For $x , y in D$, the entry $F (x , y)$ is the expected number of visits to $y$ from initial state $x$, before hitting $A$ and including time zero:
$ F (x , y) = bb(E)_x [sum_(n = 0)^(V_A - 1) upright(bold(1))_({ X_n = y })] . $
]

== Gambler's ruin: fair and biased walks

#definition(title: [Gambler's ruin chain and its exit quantities])[
Fix an integer $N gt.eq 1$, a win probability $p in [0 , 1]$, and put $q = 1 - p$. For each integer $n gt.eq 0$, let $X_n in S = { 0 , dots.h , N }$ denote the gambler's capital after $n$ bets. The process is a Markov chain with transition matrix $P = (p (x , y))_(x , y in S)$: states $0 , N$ are absorbing, and
$ p (x , x + 1) = p , #h(2em) p (x , x - 1) = q #h(2em) (x in { 1 , dots.h , N - 1 }) . $
In addition to $p (0 , 0) = p (N , N) = 1$, these are the only possibly nonzero entries. Here $p (x , y)$ is a transition entry, whereas the scalar $p$ is the probability of gaining one unit. For each $a in S$, put $V_a = inf { n in bb(Z)_(gt.eq 0) : X_n = a }$. Define, for every initial capital $x in S$,
$ underbrace(V = V_0 and V_N, upright("absorption time")) , #h(2em) underbrace(h (x) = bb(P)_x (V_N < V_0), upright("success probability")) , #h(2em) underbrace(g (x) = bb(E)_x V, upright("expected duration")) . $
]

#remark(title: [Boundary equations and absorption])[
For the gambler's ruin chain with integer $N gt.eq 1$, $p in (0 , 1)$, and $q = 1 - p$, put $V = V_0 and V_N$, $h (x) = bb(P)_x (V_N < V_0)$, and $g (x) = bb(E)_x V$ for $x in S = { 0 , dots.h , N }$. Each $x in { 1 , dots.h , N - 1 }$ has a positive-probability path to ${ 0 , N }$. Lemma~#thm-ref(<lem:boundary-tail>); gives $bb(P)_x (V < oo) = 1$ and $g (x) < oo$ for every $x in S$. For every $x in { 1 , dots.h , N - 1 }$, the boundary values and recursions are
$ h (0) & = 0 , quad h (N) = 1 , & h (x) & = p h (x + 1) + q h (x - 1) ,\
g (0) & = g (N) = 0 , & g (x) & = 1 + p g (x + 1) + q g (x - 1) . $
Absorption also gives $h (x) = bb(P)_x (V_N < oo)$ for every $x in S$.
]

#proposition(title: [Fair bets], label: <prop:fair-ruin>)[
For the gambler's ruin chain with integer $N gt.eq 1$ and $p = q = 1 \/ 2$, the success probability $h (x) = bb(P)_x (V_N < V_0)$ and mean duration $g (x) = bb(E)_x (V_0 and V_N)$ satisfy, for every $x in { 0 , dots.h , N }$,
$ h (x) = x / N , #h(2em) g (x) = x (N - x) . $
]

#proof[
#emph[Success probability.]; Put $c = h (1) - h (0)$. The harmonic equation at each $x in { 1 , dots.h , N - 1 }$ gives constant first differences:
$ h (x) - h (x - 1) = c quad (x in { 1 , dots.h , N }) , #h(2em) 1 = h (N) - h (0) = N c . $
Thus $h (x) = x c = x \/ N$ for every $x in { 0 , dots.h , N }$.

#emph[Expected duration.]; Define $v : S arrow.r bb(R)$ by $v (x) = x (N - x)$ for $x in S = { 0 , dots.h , N }$. Then
$ v (0) = v (N) = 0 , #h(2em) v (x + 1) - 2 v (x) + v (x - 1) = - 2 quad (x in { 1 , dots.h , N - 1 }) . $
Equivalently, $v (x) = 1 + 1 / 2 v (x + 1) + 1 / 2 v (x - 1)$ at each interior state. Uniqueness in Theorem~#thm-ref(<thm:exit-time>); gives $g = v$.
]

#example(title: [Fair game with $N = 3$])[
For the gambler's ruin chain on $S = { 0 , 1 , 2 , 3 }$ with $p = q = 1 \/ 2$, let $h (x) = bb(P)_x (V_3 < V_0)$ and $g (x) = bb(E)_x (V_0 and V_3)$ for $x in S$. Then
$ h (1) = 1 / 3 , #h(2em) h (2) = 2 / 3 , #h(2em) g (1) = g (2) = 2 . $
The time equations can also be solved directly:
$ g (1) = 1 + 1 / 2 g (2) , #h(2em) g (2) = 1 + 1 / 2 g (1) quad ==> quad g (1) = g (2) = 2 . $
]

#proposition(title: [Biased bets])[
For the gambler's ruin chain with integer $N gt.eq 1$ and $p in (0 , 1) without { 1 \/ 2 }$, put $q = 1 - p$ and $r = q \/ p$. The success probability $h (x) = bb(P)_x (V_N < V_0)$ and mean duration $g (x) = bb(E)_x (V_0 and V_N)$ satisfy, for every $x in { 0 , dots.h , N }$,
#numbered-eq("8.3")[$ h (x) = frac(1 - r^x, 1 - r^N) , #h(2em) g (x) = frac(x - N h (x), q - p) . $] <eq:ruin-biased>
]

#proof[
#emph[Success probability.]; For $x in { 1 , dots.h , N }$, put $Delta_x = h (x) - h (x - 1)$. The recursion for $x in { 1 , dots.h , N - 1 }$ gives
$ p Delta_(x + 1) & = q Delta_x &  & (x in { 1 , dots.h , N - 1 }) ,\
Delta_x & = r^(x - 1) Delta_1 &  & (x in { 1 , dots.h , N }) . $
Consequently,
$ 1 = h (N) - h (0) & = Delta_1 sum_(j = 0)^(N - 1) r^j &  & ==> quad Delta_1 = frac(1 - r, 1 - r^N) ,\
h (x) & = Delta_1 sum_(j = 0)^(x - 1) r^j &  & = frac(1 - r^x, 1 - r^N) . $
The last identity holds for every $x in { 0 , dots.h , N }$, including $x = 0$ by the empty-sum convention.

#emph[Expected duration.]; Define $ell , v : S arrow.r bb(R)$ on $S = { 0 , dots.h , N }$ by $ell (x) = x$ and $v (x) = [x - N h (x)] \/ (q - p)$. For functions $f : S arrow.r bb(R)$, write $(P f) (x) = sum_(y in S) p (x , y) f (y)$ and $(I f) (x) = f (x)$ for $x in S$. For each $x in { 1 , dots.h , N - 1 }$,
$ (I - P) ell (x) & = x - p (x + 1) - q (x - 1) = q - p , & (I - P) h (x) & = 0 ,\
(I - P) v (x) & = frac((q - p) - N dot.op 0, q - p) = 1 , & v (0) = v (N) & = 0 . $
Uniqueness in Theorem~#thm-ref(<thm:exit-time>); gives $g = v$, completing the omitted derivation.
]

#remark(title: [Degenerate bets and endpoint values])[
For the gambler's ruin chain with integer $N gt.eq 1$, let $h (x) = bb(P)_x (V_N < V_0)$ and $g (x) = bb(E)_x (V_0 and V_N)$ for $x in S = { 0 , dots.h , N }$. For every $x in { 1 , dots.h , N - 1 }$,
$ mat(delim: #none, augment: #(hline: (1,), vline: (1,)), "" , h (x) , g (x) ; p = 0 , 0 , x ; p = 1 , 1 , N - x) . $
For every $p in [0 , 1]$, retain $h (0) = 0$, $h (N) = 1$, and $g (0) = g (N) = 0$. Thus #link(<eq:ruin-biased>)[(8.3)]; need not be evaluated at degenerate parameters; when $N = 1$, the endpoint values cover the entire state space.
]

== Limits, the casino example, and practice

#proposition(title: [Limits of gambler's ruin probabilities and durations], label: <prop:ruin-limits>)[
For each integer $N gt.eq 1$ and $p in (0 , 1)$, let $h_(N , p) (x)$ and $g_(N , p) (x)$ denote the success probability and mean duration for the gambler's ruin chain on ${ 0 , dots.h , N }$, at initial state $x in { 0 , dots.h , N }$, with win probability $p$ and loss probability $q = 1 - p$. For every fixed integer $N gt.eq 2$ and $x in { 1 , dots.h , N - 1 }$,
$ p arrow.b 0 quad ==> quad h_(N , p) (x) --> 0 , #h(2em) g_(N , p) (x) --> x . $
For every fixed integer $x gt.eq 1$ and fixed $p in (0 , 1)$, as the integer $N > x$ tends to infinity,
$ mat(delim: #none, augment: #(hline: (1,), vline: (1,)), "" , #[$display(lim_(N arrow.r oo) h_(N , p) (x))$] , #[$display(lim_(N arrow.r oo) g_(N , p) (x))$] ; p > q , 1 - (q \/ p)^x , oo ; p = q , 0 , oo ; p < q , 0 , x \/ (q - p)) . $
]

#proof[
Fix an integer $N gt.eq 2$ and $x in { 1 , dots.h , N - 1 }$. Writing $q = 1 - p$ and $r = q \/ p$, as $p arrow.b 0$,
$ r = q \/ p --> oo , #h(2em) h_(N , p) (x) = frac(r^x - 1, r^N - 1) --> 0 ,\
g_(N , p) (x) = frac(x - N h_(N , p) (x), q - p) --> x . $
Next fix an integer $x gt.eq 1$ and $p in (0 , 1)$, and let integers $N > x$ tend to infinity. If $p = 1 \/ 2$, use $h_(N , p) (x) = x \/ N$ and $g_(N , p) (x) = x (N - x)$. In the biased cases,
$ p < q : quad & r > 1 , #h(2em) h_(N , p) (x) = frac(r^x - 1, r^N - 1) --> 0 , #h(2em) N h_(N , p) (x) --> 0 ,\
 & g_(N , p) (x) = frac(x - N h_(N , p) (x), q - p) --> frac(x, q - p) ;\
p > q : quad & 0 < r < 1 , #h(2em) h_(N , p) (x) --> 1 - r^x > 0 ,\
 & g_(N , p) (x) = frac(N h_(N , p) (x) - x, p - q) --> oo . $
]

#remark(title: [Meaning of the half-line limit])[
Fix an integer $x gt.eq 1$ and $p in (0 , 1)$, and put $q = 1 - p$. Consider the Markov chain $(X_n)_(n in bb(Z)_(gt.eq 0))$ on $bb(Z)_(gt.eq 0)$, started at $x$, with $0$ absorbing and transition probabilities $p (z , z + 1) = p$, $p (z , z - 1) = q$ for every integer $z gt.eq 1$. Let $V_a = inf { n in bb(Z)_(gt.eq 0) : X_n = a }$ for every $a in bb(Z)_(gt.eq 0)$. The events $H_N = { V_N < V_0 }$, indexed by integers $N > x$, decrease as $N$ increases. A walk avoiding zero has probability zero of staying forever in any fixed finite interval (Lemma~#thm-ref(<lem:boundary-tail>); at its endpoints). Thus
$ inter.big_(N in bb(Z) , thin N > x) H_N = { V_0 = oo } quad upright("up to a ") bb(P)_x upright("-null event") ,\
lim_(N arrow.r oo) h_(N , p) (x) = bb(P)_x (V_0 = oo) , $
where $h_(N , p) (x) = bb(P)_x (H_N)$ agrees with the finite-interval success probability. For $p > q$, $1 - (q \/ p)^x$ is the probability of never reaching zero; there is no actual state at infinity to hit.
]

#example(title: [The lecture's casino calculation])[
Take the gambler's ruin chain on $S = { 0 , dots.h , 100 }$, started at $x = 99$ and stopped on reaching $0$ or $100$. For each $z in S$, let $h (z) = bb(P)_z (V_100 < V_0)$ and $g (z) = bb(E)_z (V_0 and V_100)$. In a fair game ($p = q = 1 \/ 2$),
$ h (99) = 99 / 100 , #h(2em) g (99) = 99 (100 - 99) = 99 upright(" bets") . $
With a one-unit win probability $p = 18 \/ 38$ and loss probability $q = 20 \/ 38$,
$ h (99) = frac(1 - (20 \/ 18)^99, 1 - (20 \/ 18)^100) approx 0.899997 . $
A target gain of one unit therefore entails about a ten-percent chance of losing the entire initial capital in this model.
]

#remark(title: [Suggested practice from Lecture 8])[
Durrett, third edition: Exercises 1.45, 1.49, 1.57, 1.62, and 1.67\. The slides list these as not for submission; their statements are not included in the supplied archive.
]

= Lecture 9: Countable state spaces and positive recurrence

== What carries over from finite state spaces

#remark(title: [Same definitions, fewer tools])[
Irreducibility, recurrence, transience, period, stationarity, and exit times are defined on a countably infinite state space exactly as on a finite one; one often takes $S = bb(Z)_(gt.eq 0)$. What is lost are the finite-state #emph[methods];: Theorem~3.10, Theorem~4.3, and the linear systems of Lecture~8 all use finiteness.
]

#theorem(title: [Solidarity in an irreducible chain; Lecture 9, p.~2], label: <thm:solidarity>)[
Let $P$ be an irreducible transition matrix on a finite or countable state space $S$. Then either every state is transient or every state is recurrent, and all states have the same period. If $S$ is finite, every state is recurrent.
]

#proof[
If some $x in S$ is recurrent, then $x arrow.r y$ for every $y in S$, so Lemma~3.8 makes every $y$ recurrent. Every pair of states communicates, so Lemma~6.4 gives a common period. If $S$ is finite, it is a finite closed irreducible set, and Theorem~3.10 applies.
]

#remark(title: [What fails on infinite spaces])[
Theorem~#thm-ref(<thm:reflecting>); below shows that, when $S$ is countably infinite,

#list(
[
a closed irreducible set need not contain a recurrent state: all states may be transient;
],
[
irreducibility does not imply the existence of a stationary distribution, even for a recurrent chain.
]
)
]

#proposition(title: [Mean return time and recurrence; Lecture 9, p.~15], label: <prop:mean-return>)[
Let $P$ be a transition matrix on a finite or countable state space $S$, and let $T_y = inf { n gt.eq 1 : X_n = y }$ for $y in S$. For every $y in S$,
$ y upright(" transient") med ==> med bb(E)_y T_y = oo , #h(2em) bb(E)_y T_y < oo med ==> med y upright(" recurrent") . $
The converse of the second implication fails in general (Theorem~#thm-ref(<thm:reflecting>);(b)).
]

#proof[
If $y$ is transient, then $bb(E)_y T_y gt.eq oo dot.op bb(P)_y (T_y = oo) = oo$, since $bb(P)_y (T_y = oo) = 1 - rho_(y y) > 0$. The second implication is the contrapositive.
]

#remark(title: [Three types of states])[
By Proposition~#thm-ref(<prop:mean-return>); and Definition~6.8, every state is exactly one of
$ upright("transient") med (rho_(y y) < 1) , quad upright("null recurrent") med (rho_(y y) = 1 , med bb(E)_y T_y = oo) , quad upright("positive recurrent") med (bb(E)_y T_y < oo) . $
Null recurrence is the borderline case: the chain returns with probability one, but the mean waiting time is infinite.
]

== The reflecting random walk on the half-line

#definition(title: [Reflecting random walk])[
Fix $p in (0 , 1)$ and put $q = 1 - p$. The #emph[reflecting random walk]; on $S = bb(Z)_(gt.eq 0)$ has transition probabilities
$ p (i , i + 1) = p quad (i gt.eq 0) , #h(2em) p (i , i - 1) = q quad (i gt.eq 1) , #h(2em) p (0 , 0) = q , $
and all other entries zero: it moves up or down by one, and stays at $0$ when it tries to go below $0$. As in Lecture~8, $p (x , y)$ is a transition entry, while the scalar $p$ is the upward probability.
]

#remark(title: [Structure and the detailed-balance candidate])[
The walk is irreducible, and aperiodic because $p (0 , 0) > 0$. Detailed balance reads $pi (i) p = pi (i + 1) q$ for $i gt.eq 0$, so
$ pi (i) = pi (0) (p / q)^i #h(2em) (i gt.eq 0) . $
This is normalizable iff $p < q$. For $p gt.eq q$ it only shows that no distribution satisfies detailed balance; whether some stationary distribution exists must be decided by other means.
]

#lemma(title: [Truncation; Lecture 9, pp.~8--9], label: <lem:truncation>)[
For the reflecting random walk, let $V_a = inf { n gt.eq 0 : X_n = a }$ for $a in S$, and let $h_(N , p)$ and $g_(N , p)$ be the gambler's ruin success probability and mean duration on ${ 0 , dots.h , N }$ (Proposition~#thm-ref(<prop:ruin-limits>);).

#enum(numbering: "(i)",
[
For integers $N gt.eq 2$ and $x in { 1 , dots.h , N - 1 }$,
$ bb(P)_x (V_0 < V_N) = 1 - h_(N , p) (x) , #h(2em) bb(E)_x (V_0 and V_N) = g_(N , p) (x) . $
],
[
For every $x gt.eq 1$, as $N arrow.r oo$ through integers $N > x$,
$ rho_(x 0) = bb(P)_x (V_0 < oo) = lim_(N arrow.r oo) bb(P)_x (V_0 lt.eq V_N) = cases(delim: "{", 1 , & p lt.eq q ,, (q \/ p)^x , & p > q .) $
]
)
]

#proof[
#strong[(i) Same law up to the exit time.]; Put $D = { 1 , dots.h , N - 1 }$. The reflecting walk and the gambler's ruin chain on ${ 0 , dots.h , N }$ have the same transition probabilities out of every state of $D$. For $n gt.eq 1$ and $z in { 0 , N }$, the probability $bb(P)_x (V_0 and V_N = n , med X_n = z)$ is a sum, over paths $x = x_0 , x_1 , dots.h , x_(n - 1) in D$, $x_n = z$, of products of transitions out of $D$, so it is the same for both chains. The gambler's ruin chain exits $D$ almost surely (Lemma~#thm-ref(<lem:boundary-tail>);); summing over $n$ and $z$ gives the claims.

#strong[(ii) Continuity of probability.]; For $x gt.eq 1$, $T_0 = V_0$ under $bb(P)_x$, so $rho_(x 0) = bb(P)_x (V_0 < oo)$. Fix $N > x$.

#list(
[
By (i), $bb(P)_x (V_0 = V_N = oo) = 0$, so ${ V_0 lt.eq V_N } = { V_0 < V_N }$ up to a null event.
],
[
Upward steps have size one, so the walk visits $N$ before $N + 1$: $V_N lt.eq V_(N + 1)$. Hence the events ${ V_0 < V_N }$ increase in $N$.
],
[
Reaching $N$ from $x$ takes at least $N - x$ steps. If $V_0 < oo$, any $N > x + V_0$ gives $V_N gt.eq N - x > V_0$. Therefore $union.big_(N > x) { V_0 < V_N } = { V_0 < oo }$.
]
)

Continuity from below and (i) give $rho_(x 0) = lim_N (1 - h_(N , p) (x))$. If $p = q$, then $1 - x \/ N arrow.r 1$. If $p eq.not q$, put $r = q \/ p$:
$ 1 - h_(N , p) (x) = frac(r^x - r^N, 1 - r^N) --> cases(delim: "{", r^x , & r < 1 med (p > q) ,, 1 , & r > 1 med (p < q) .) $
]

#theorem(title: [Classification of the reflecting walk; Lecture 9, pp.~3--14], label: <thm:reflecting>)[
The reflecting random walk with $p in (0 , 1)$, $q = 1 - p$, is irreducible and aperiodic, and:

#enum(numbering: "(a)",
[
#strong[$p < q$: positive recurrent.]; The unique stationary distribution is
$ pi (i) = (1 - p / q) (p / q)^i quad (i gt.eq 0) , #h(2em) bb(E)_i T_i = frac(1, pi (i)) < oo , $
and every part of Theorem~6.7 applies.
],
[
#strong[$p = q$: null recurrent.]; Every state is recurrent with $bb(E)_x T_x = oo$. There is no stationary distribution and no limiting distribution, yet $N_y (n) \/ n arrow.r 0$ almost surely for every $y$.
],
[
#strong[$p > q$: transient.]; There is no stationary distribution, and $X_n arrow.r oo$ almost surely from every initial state.
]
)
]

#proof[
#strong[(a)]; Since $p \/ q < 1$, $pi$ is a probability distribution, and it satisfies detailed balance, hence is stationary. Irreducibility and Theorem~6.7(3) give $pi (i) = 1 \/ bb(E)_i T_i > 0$, so every state is positive recurrent and $pi$ is unique. Aperiodicity gives part (1) of that theorem as well.

#strong[(c)]; By Lemma~#thm-ref(<lem:truncation>);(ii), $rho_10 = q \/ p < 1$, while $0 arrow.r 1$ because $p (0 , 1) = p > 0$. Lemma~3.7 (with $x = 0$, $y = 1$) makes $0$ transient, and Theorem~#thm-ref(<thm:solidarity>); makes every state transient. A stationary distribution would make every state recurrent (Lemma~6.9), so none exists. Finally, for each $M gt.eq 0$ and $x in S$, Proposition~3.3 gives
$ sum_(y = 0)^M N_y < oo quad bb(P)_x upright("-a.s.") , $
so $X_n > M$ for all large $n$. Intersecting over $M in bb(Z)_(gt.eq 0)$ gives $X_n arrow.r oo$, $bb(P)_x$-almost surely.

#strong[(b) Recurrence.]; By Lemma~#thm-ref(<lem:truncation>);(ii), $rho_10 = 1$. Conditioning on $X_1$,
$ rho_00 = p (0 , 0) dot.op 1 + p (0 , 1) thin rho_10 = q + p = 1 . $
Theorem~#thm-ref(<thm:solidarity>); makes every state recurrent.

#strong[(b) Infinite mean return times.]; For $N gt.eq 2$, Lemma~#thm-ref(<lem:truncation>);(i) and Proposition~#thm-ref(<prop:fair-ruin>); give
$ bb(E)_1 V_0 gt.eq bb(E)_1 (V_0 and V_N) = 1 dot.op (N - 1) quad ==> quad bb(E)_1 V_0 = oo . $
For $x gt.eq 0$, the walk from $x + 1$ until it first hits $x$ uses only transitions out of states $gt.eq 1$, which are translation invariant; so $bb(E)_(x + 1) V_x = bb(E)_1 V_0 = oo$. The Markov property at time $1$ gives
$ bb(E)_x T_x gt.eq bb(E)_x [T_x upright(bold(1))_({ X_1 = x + 1 })] = p (1 + bb(E)_(x + 1) V_x) = oo #h(2em) (x gt.eq 0) . $

#strong[(b) Consequences.]; A stationary distribution would satisfy $pi (x) = 1 \/ bb(E)_x T_x = 0$ for every $x$ (Theorem~6.7(3)), which is impossible; a limiting distribution would be stationary (Proposition~6.2). Theorem~6.7(2) needs only irreducibility and recurrence, and gives $N_y (n) \/ n arrow.r 1 \/ bb(E)_y T_y = 0$ almost surely.
]

#remark(title: [Reading the three cases])[
$ mat(delim: #none, augment: #(hline: (1,), vline: (1, 2, 3,)), align: #left, "" , upright("type") , upright("stationary distribution") , upright("long run") ; p < q , upright("positive recurrent") , #[$upright("exists, geometric")$] , #[$P^n (x , dot.op) arrow.r pi$] ; p = q , upright("null recurrent") , upright("none") , #[$upright("returns a.s., visit frequencies") arrow.r 0$] ; p > q , upright("transient") , upright("none") , X_n arrow.r oo med upright("a.s.")) $
In case (b) the convergence and ergodic theorems have nothing to converge to, and $bb(E)_x T_x$ cannot be used to compute a stationary distribution. In case (c), $1 - (q \/ p)^x$ is the probability of never reaching $0$, matching the Lecture~8 half-line limit.
]

== Positive recurrence and stationary distributions

#theorem(title: [Positive recurrence; Lecture 9, p.~16], label: <thm:pos-rec>)[
For an irreducible Markov chain on a finite or countable state space $S$, the following are equivalent:

#enum(numbering: "(1)",
[
at least one state is positive recurrent;
],
[
all states are positive recurrent;
],
[
the chain has a stationary distribution.
]
)
]

#proof[
#strong[(2)$arrow.r.double$(1)]; is immediate.

#strong[(3)$arrow.r.double$(2).]; Theorem~6.7(3) gives $pi (y) = 1 \/ bb(E)_y T_y > 0$, so $bb(E)_y T_y < oo$ for every $y in S$.

#strong[(1)$arrow.r.double$(3): the cycle measure.]; Let $a$ be positive recurrent, $T = T_a$, and $m = bb(E)_a T < oo$. For $z in S$, let $u (z)$ be the expected number of visits to $z$ during one excursion from $a$:
$ u (z) = bb(E)_a sum_(j = 0)^(T - 1) upright(bold(1))_({ X_j = z }) , #h(2em) sum_(z in S) u (z) = bb(E)_a T = m , #h(2em) u (a) = 1 . $
Since ${ j < T } in cal(F)_j$, the Markov property and Tonelli give, for every $z in S$,
$ (u P) (z) & = sum_(j gt.eq 0) bb(E)_a [upright(bold(1))_({ j < T }) p (X_j , z)] = sum_(j gt.eq 0) bb(E)_a [upright(bold(1))_({ j < T }) upright(bold(1))_({ X_(j + 1) = z })]\
 & = bb(E)_a sum_(j = 1)^T upright(bold(1))_({ X_j = z }) = u (z) , $
where the last step uses $T < oo$ and $X_T = X_0 = a$, $bb(P)_a$-almost surely. Hence $pi = u \/ m$ is a stationary distribution. This step does not use irreducibility.
]

#corollary(title: [Trichotomy for irreducible chains], label: <cor:trichotomy>)[
Let $P$ be irreducible on a finite or countable state space $S$. Then exactly one of the following holds: all states are transient; all states are null recurrent; all states are positive recurrent. A stationary distribution exists if and only if the chain is positive recurrent, and it is then unique, with $pi (y) = 1 \/ bb(E)_y T_y$. Every irreducible chain on a finite state space is positive recurrent.
]

#proof[
Theorem~#thm-ref(<thm:solidarity>); separates the transient case from the recurrent one. In the recurrent case, one positive recurrent state makes all of them positive recurrent (Theorem~#thm-ref(<thm:pos-rec>);); otherwise all are null recurrent. The stationary-distribution statement is Theorem~#thm-ref(<thm:pos-rec>); together with Theorem~6.7(3). For finite $S$, Theorem~4.3 supplies a stationary distribution.
]

#remark(title: [Suggested practice from Lecture 9])[
Durrett, third edition: Exercises 1.70, 1.74, and 1.75 (not for submission).
]

#pagebreak()

#heading(level: 1, numbering: none)[Source map and clarifications]

The source is Asaf Cohen, #emph[MATH 526, Fall 2026];. Lecture 8 is taken from the lecture PDFs in #raw("Lecture_Notes_export (2).zip");, and Lecture 9 from #raw("raw_ppt/Canvas 09.pdf");. The section-to-source map is:

#align(center, table(columns: 3, stroke: none, align: left, inset: (x: 6pt, y: 3pt),
  table.hline(stroke: 0.08em),
  [Lecture], [Source pages], [Material retained],
  table.hline(stroke: 0.05em),
  [8], [2--19], [Exit probabilities, times, and worked examples],
  [9], [2--16], [Countable state spaces; positive and null recurrence],
  table.hline(stroke: 0.08em)
))

#strong[Definitions.]; Exit times retain Lecture 8's convention $n gt.eq 0$ (pp. 2--3), and exit probabilities retain its boundary-set extension (pp. 6--9). The fundamental matrix is supplementary notation, not a definition from the slides. In Lecture 9, the truncation lemma left as an exercise (p.~8) is proved, the infinite mean return times at every state for $p = 1 \/ 2$ (“along the same lines”, p.~13) are derived, and the equivalence theorem on p.~16, stated without proof, is proved via the cycle measure.

Proofs have been written out independently. New clarifications include the finite-state hypothesis behind exit-time uniqueness and aperiodicity for limits over recurrent classes. Standard probability tools used in the added proofs are the strong Markov property, continuity of probability, and the monotone convergence theorem.
