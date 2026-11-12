// Typst copy of ch1-foundations/ch1-foundations.tex. Shared styles are in notes.typ.
#import "notes.typ": *
#show: notes.with(head-right: [Chapter 1: Lectures 2--5])

#title-block[Chapter 1: Foundations (Lectures 2--5)]

#strong[Scope.]; Lectures 2--5: multistep transitions and stopping times, recurrence and transience, the finite-state decomposition, and stationary distributions, with completed proofs and derivations. Lecture 1 and purely numerical examples are omitted. Numbering is local; original theorem numbers and source pages are recorded where useful.

#include "front.typ"

#outline(depth: 1)

#pagebreak()

#counter(heading).update(1)

= Lecture 2: Multistep transitions and stopping times

== Paths, matrix powers, and Chapman--Kolmogorov

#definition(title: [Time-homogeneous Markov property])[
Let $(X_n)_(n gt.eq 0)$ be $S$-valued random variables on one probability space, and let $P = (p (x , y))_(x , y in S)$ be a transition matrix. The process is a #emph[time-homogeneous Markov chain with transition matrix $P$]; if
$ bb(P) (X_(n + 1) = y divides cal(F)_n) = p (X_n , y) quad upright("almost surely") #h(2em) (n gt.eq 0 , med y in S) , $
where $cal(F)_n = sigma (X_0 , dots.h , X_n)$. Thus $p (x , y)$ specifies the probability of the next state $y$ when the current state is $x$; it does not depend on $n$ or the earlier history.
]

#remark(title: [Path probabilities])[
Repeated conditioning gives, for every prescribed finite path,
#numbered-eq("2.1")[$ bb(P)_x (X_1 = x_1 , dots.h , X_m = x_m) = p (x , x_1) p (x_1 , x_2) dots.h.c p (x_(m - 1) , x_m) . $] <eq:path>
]

#proposition(title: [Multistep Markov property; original Theorem 1.1])[
For every $n , m gt.eq 0$ and $y in S$,
$ bb(P) (X_(n + m) = y divides cal(F)_n) = P^m (X_n , y) . $
Thus the $m$-step transition probabilities depend only on the current state, not on the starting time or the earlier history.
]

#proof[
Induct on $m$. The cases $m = 0 , 1$ follow from the identity matrix and the Markov property. For the induction step, the tower property gives
$ bb(P) (X_(n + m + 1) = y divides cal(F)_n) & = bb(E) [p (X_(n + m) , y) divides cal(F)_n]\
 & = sum_(z in S) P^m (X_n , z) p (z , y) = P^(m + 1) (X_n , y) . $
Equivalently, sum #link(<eq:path>)[(2.1)]; over all intermediate states.
]

#corollary(title: [Chapman--Kolmogorov])[
For $m , n gt.eq 0$,
$ P^(m + n) (x , y) = sum_(z in S) P^m (x , z) P^n (z , y) , #h(2em) P^(m + n) = P^m P^n . $
]

#proof[
Condition on $X_m$ and apply the multistep Markov property:
$ bb(P)_x (X_(m + n) = y) & = sum_(z in S) bb(P)_x (X_m = z) bb(P)_z (X_n = y)\
 & = sum_(z in S) P^m (x , z) P^n (z , y) . $
]

#remark(title: [Matrix powers])[
$P^m (x , y)$ is an entry of the matrix power $P^m$, not the scalar power $p (x , y)^m$.
]

== Hitting times and the strong Markov property

#definition(title: [Stopping time])[
Relative to the history $cal(F)_n = sigma (X_0 , dots.h , X_n)$, a random variable $T$ taking values in ${ 0 , 1 , dots.h } union { oo }$ is a #emph[stopping time]; if
$ { T = n } in cal(F)_n quad upright("for every ") n gt.eq 0 . $
Equivalently, ${ T lt.eq n } in cal(F)_n$ for every $n gt.eq 0$: by time $n$, the observed history determines whether stopping has occurred.
]

#definition(title: [Positive-time hitting and successive visits])[
For a chain $(X_n)$ on $S$, let $x in S$ be the initial state and $y in S$ the target state. Define
$ T_y & = inf { n gt.eq 1 : X_n = y } , & rho_(x y) & = bb(P)_x (T_y < oo) ,\
T_y^((1)) & = T_y , & T_y^((k)) & = inf { n > T_y^((k - 1)) : X_n = y } quad (k gt.eq 2) . $
Here $T_y$ is the #emph[positive-time hitting time];, $rho_(x y)$ the probability of ever hitting $y$ after time zero from $x$, and $T_y^((k))$ the time of the $k$th such visit. If a visit never occurs, its time is $oo$; when $x = y$, $T_y$ is the first #emph[return]; time.
]

#proposition(title: [Visit times are stopping times])[
Each $T_y^((k))$, $k gt.eq 1$, is a stopping time.
]

#proof[
For every $n gt.eq 1$,
$ { T_y = n } & = { X_1 eq.not y , dots.h , X_(n - 1) eq.not y , X_n = y } in cal(F)_n ,\
{ T_y^((k)) lt.eq n } & = {sum_(j = 1)^n upright(bold(1))_({ X_j = y }) gt.eq k} in cal(F)_n . $
]

#notation(title: [Information at a stopping time])[
For a stopping time $T$ relative to $(cal(F)_n)_(n gt.eq 0)$, the information $cal(F)_T$ consists of events $A$ satisfying
$ A inter { T = n } in cal(F)_n #h(2em) (n = 0 , 1 , dots.h) . $
Thus, on ${ T = n }$, whether $A$ occurred is determined by the history through time $n$.
]

#theorem(title: [Strong Markov property], label: <thm:smp>)[
Let $T$ be a stopping time. On ${ T < oo }$, conditional on $X_T$, the process $(X_(T + j))_(j gt.eq 0)$ has the law of a fresh chain started at $X_T$, independently of the information available at $T$.
]

#proof(title: [Proof of the strong Markov property])[
Fix $A in cal(F)_T$ and $y , z_1 , dots.h , z_m in S$. Since $A inter { T = n } in cal(F)_n$, the ordinary Markov property gives
$  & bb(P) (A , T < oo , X_T = y , X_(T + 1) = z_1 , dots.h , X_(T + m) = z_m)\
 & quad = sum_(n = 0)^oo bb(P) (A , T = n , X_n = y) p (y , z_1) product_(j = 1)^(m - 1) p (z_j , z_(j + 1))\
 & quad = bb(P) (A , T < oo , X_T = y) p (y , z_1) product_(j = 1)^(m - 1) p (z_j , z_(j + 1)) . $
This factorization proves the claim for finite future paths; the monotone class theorem extends it to events determined by the entire future.
]

#remark(title: [Infinite stopping times])[
The strong Markov property above makes no assertion about $X_T$ on ${ T = oo }$.
]

#proposition(title: [Repeated visits], label: <prop:visits>)[
For $k gt.eq 1$,
$ bb(P)_x (T_y^((k)) < oo) = rho_(x y) rho_(y y)^(thin k - 1) , #h(2em) bb(P)_y (T_y^((k)) < oo) = rho_(y y)^(thin k) . $
]

#proof[
Set $a_k = bb(P)_x (T_y^((k)) < oo)$. The strong Markov property at $T_y^((k))$ yields
$ a_1 = rho_(x y) , #h(2em) a_(k + 1) = bb(E)_x #h(-1em) [upright(bold(1))_({ T_y^((k)) < oo }) rho_(y y)] = a_k rho_(y y) . $
Hence $a_k = rho_(x y) rho_(y y)^(k - 1)$; take $x = y$ for the second identity. No division by a possibly zero probability is used.
]

= Lecture 3: Recurrence, transience, and finite-state structure

== Counting visits and recurrence criteria

#definition(title: [Visit count])[
For a target state $y in S$, the #emph[total visit count]; after time zero is the random variable
$ N_y = sum_(n = 1)^oo upright(bold(1))_({ X_n = y }) = sum_(k = 1)^oo upright(bold(1))_({ T_y^((k)) < oo }) in { 0 , 1 , dots.h , oo } . $
Each indicator counts one visit; $T_y^((k))$ is the $k$th positive-time visit to $y$.
]

#definition(title: [Recurrence and transience])[
For a state $y in S$, let $T_y = inf { n gt.eq 1 : X_n = y }$ and $rho_(y y) = bb(P)_y (T_y < oo)$, its return probability when starting at $y$. The state is
$ cases(delim: "{", upright("transient") , & rho_(y y) < 1 ,, upright("recurrent") , & rho_(y y) = 1 .) $
]

#proposition(title: [Visit-count criteria; original Lemma 1.11 and Theorems 1.13a--b], label: <prop:visit-criteria>)[
For any states $x , y$,
#numbered-eq("3.1")[$ bb(E)_x N_y = sum_(n = 1)^oo P^n (x , y) = sum_(k = 1)^oo rho_(x y) rho_(y y)^(thin k - 1) . $] <eq:visits>
If $y$ is transient, then
$ bb(E)_x N_y = frac(rho_(x y), 1 - rho_(y y)) < oo , #h(2em) bb(P)_x (N_y < oo) = 1 . $
Moreover,
$ y upright(" recurrent") <==> bb(E)_y N_y = oo <==> sum_(n = 1)^oo P^n (y , y) = oo . $
For recurrent $y$, $bb(P)_y (N_y = oo) = 1$.
]

#proof[
Tonelli's theorem and Proposition~#thm-ref(<prop:visits>); give
$ bb(E)_x N_y & = sum_(n gt.eq 1) bb(P)_x (X_n = y) = sum_(n gt.eq 1) P^n (x , y) ,\
bb(E)_x N_y & = sum_(k gt.eq 1) bb(P)_x (T_y^((k)) < oo) = sum_(k gt.eq 1) rho_(x y) rho_(y y)^(k - 1) . $
Thus
$ rho_(y y) < 1 med ==> med bb(E)_x N_y = frac(rho_(x y), 1 - rho_(y y)) < oo med ==> med N_y < oo quad bb(P)_x upright("-a.s.") $
If $rho_(y y) = 1$, continuity from above gives
$ bb(P)_y (N_y = oo) = lim_(k arrow.r oo) bb(P)_y (T_y^((k)) < oo) = lim_(k arrow.r oo) rho_(y y)^(thin k) = 1 . $
Together with #link(<eq:visits>)[(3.1)];, these establish all equivalences.
]

#remark(title: [Scope of the geometric formula])[
The quotient $rho_(x y) \/ (1 - rho_(y y))$ applies only when $rho_(y y) < 1$. For an inaccessible recurrent state, use the series in #link(<eq:visits>)[(3.1)];, not the undefined expression $0 \/ 0$.
]

#definition(title: [Absorbing state])[
A state $y in S$ is #emph[absorbing]; if $p (y , y) = 1$: once the chain is at $y$, it stays there forever with probability one. In particular, $rho_(y y) = bb(P)_y (T_y < oo) = 1$, so every absorbing state is recurrent.
]

== Accessibility and propagation of recurrence

#definition(title: [Accessibility and communication])[
For states $x , y in S$, write $rho_(x y) = bb(P)_x (T_y < oo)$ for the positive-time hitting probability. Define
$ x arrow.r y & <==> rho_(x y) > 0 &  & upright("(") y upright(" is accessible from ") x upright(")") ,\
x arrow.l.r y & <==> x = y med upright("or") med (x arrow.r y upright(" and ") y arrow.r x) &  & upright("(") x upright(" and ") y upright(" communicate)") . $
A #emph[communicating class]; is an equivalence class of states under $arrow.l.r$.
]

#remark(title: [Reflexivity convention])[
The clause $x = y$ makes communication reflexive even when $x$ has no positive-time return.
]

#lemma(title: [Accessibility; original Lemma 1.4])[
$x arrow.r y$ if and only if $P^m (x , y) > 0$ for some $m gt.eq 1$. Accessibility is transitive.
]

#proof[
$ rho_(x y) > 0 & ==> sum_(m gt.eq 1) bb(P)_x (T_y = m) > 0\
 & ==> exists m gt.eq 1 : P^m (x , y) gt.eq bb(P)_x (T_y = m) > 0 ,\
P^m (x , y) > 0 & ==> rho_(x y) gt.eq bb(P)_x (T_y lt.eq m) gt.eq bb(P)_x (X_m = y) > 0 . $
For transitivity, choose $m , n gt.eq 1$ with $P^m (x , y) , P^n (y , z) > 0$. Chapman--Kolmogorov gives
$ P^(m + n) (x , z) gt.eq P^m (x , y) P^n (y , z) > 0 quad ==> quad x arrow.r z . $
]

#lemma(title: [Escape criterion; original Theorem 1.5], label: <lem:escape>)[
If $x arrow.r y$ and $rho_(y x) < 1$, then $x$ is transient. Consequently, if $x$ is recurrent and $x arrow.r y$, then $rho_(y x) = 1$.
]

#proof[
For $x = y$, the hypothesis already says $rho_(x x) < 1$. For $x eq.not y$, choose a shortest positive-probability path
$ x = x_0 , x_1 , dots.h , x_m = y , #h(2em) a = product_(j = 0)^(m - 1) p (x_j , x_(j + 1)) > 0 . $
Minimality implies $x_j eq.not x$ for $1 lt.eq j lt.eq m$; otherwise delete the loop. Follow this path and then never hit $x$. The Markov property gives
$ bb(P)_x (T_x = oo) gt.eq a (1 - rho_(y x)) > 0 quad ==> quad rho_(x x) < 1 . $
The final assertion is the contrapositive.
]

#lemma(title: [Recurrence propagates; original Lemma 1.9], label: <lem:propagate>)[
If $x$ is recurrent and $x arrow.r y$, then $y$ is recurrent, and $rho_(x y) = rho_(y x) = 1$.
]

#proof[
Lemma~#thm-ref(<lem:escape>); gives $rho_(y x) = 1$. Choose $a , b gt.eq 1$ with $P^a (y , x) > 0$ and $P^b (x , y) > 0$, and put $c = P^a (y , x) P^b (x , y) > 0$. Then
$ P^(a + n + b) (y , y) & gt.eq c P^n (x , x) ,\
sum_(m gt.eq 1) P^m (y , y) & gt.eq c sum_(n gt.eq 1) P^n (x , x) = oo . $
Thus $y$ is recurrent. Apply Lemma~#thm-ref(<lem:escape>); with $x , y$ interchanged to obtain $rho_(x y) = 1$.
]

#definition(title: [Closed sets and irreducibility])[
A set $C subset.eq S$ is

#list(
[
#emph[closed]; if $p (x , y) = 0$ for all $x in C$, $y in.not C$;
],
[
#emph[irreducible]; if every pair of states in $C$ communicates.
]
)

The chain is #emph[irreducible]; if $S$ is one communicating class.
]

== The finite-state decomposition

#theorem(title: [Recurrence in finite closed sets; original Lemma 1.10 and Theorem 1.7], label: <thm:finite-closed>)[
Every nonempty finite closed set contains a recurrent state. Every state of a finite closed irreducible set is recurrent.
]

#proof[
If every $y in C$ were transient, then, for $x in C$,
$ oo > sum_(y in C) bb(E)_x N_y = sum_(n = 1)^oo sum_(y in C) P^n (x , y) = sum_(n = 1)^oo 1 = oo , $
a contradiction. If $C$ is also irreducible, Lemma~#thm-ref(<lem:propagate>); propagates recurrence from one state to all of $C$.
]

#theorem(title: [Finite-state decomposition; original Theorem 1.8])[
For finite $S$, there is a disjoint decomposition
$ S = cal(T) thin dot(union) thin R_1 thin dot(union) dots.h.c dot(union) thin R_k , $
where $cal(T)$ consists of all transient states and the $R_i$ are exactly the closed communicating classes. Every state in an $R_i$ is recurrent. Starting anywhere, the chain eventually enters one of these classes and stays there almost surely.
]

#proof[
#enum(numbering: n => strong[#n.],
[
#strong[Classify the classes.]; Collapse each communicating class to one vertex in the finite transition graph. A directed cycle would merge its vertices into one class, so the resulting graph is acyclic. Every vertex reaches a sink, and
$ upright("sink class") <==> upright("closed class") quad ==> quad upright("all its states are recurrent") . $
The implication uses the preceding theorem.
],
[
#strong[Identify the transient states.]; For a nonsink class and any state $x$ in it, some downstream state $y$ satisfies
$ x arrow.r y , #h(2em) y ↛ x quad ==> quad rho_(y x) = 0 quad ==> quad x upright(" transient") , $
by Lemma~#thm-ref(<lem:escape>);. Since classes partition $S$, the claimed decomposition follows.
],
[
#strong[Eventual entry.]; From every initial state,
$ N_y < oo med upright("a.s.") med (y in cal(T)) , #h(2em) lr(|cal(T)|) < oo quad ==> quad sum_(y in cal(T)) N_y < oo med upright("a.s.") $
After the last visit to $cal(T)$, the chain lies in some $R_i$; closedness prevents departure.
]
)
]

#remark(title: [Why finiteness matters])[
An infinite irreducible chain need not be recurrent. A chain on an infinite state space need not eventually enter a recurrent class.
]

= Lecture 4: Stationary distributions

== Evolution of a distribution and equilibrium

#proposition(title: [Evolution of the distribution])[
If $X_0$ has distribution $q$, then
$ bb(P)_q (X_n = y) = sum_x q (x) P^n (x , y) , #h(2em) cal(L)_q (X_n) = q P^n . $
]

#proof[
Condition on $X_0$:
$ bb(P)_q (X_n = y) = sum_x bb(P)_q (X_0 = x) bb(P)_x (X_n = y) = sum_x q (x) P^n (x , y) . $
]

#definition(title: [Stationary distribution])[
For a chain on $S$ with transition matrix $P$, a #emph[stationary distribution]; is a row vector $pi = (pi (x))_(x in S)$ of state probabilities satisfying
$ pi (x) gt.eq 0 , #h(2em) sum_(x in S) pi (x) = 1 , #h(2em) pi P = pi . $
Equivalently, $sum_(x in S) pi (x) p (x , y) = pi (y)$ for every $y in S$.
]

#remark(title: [Equilibrium concerns distributions])[
Stationarity implies
$ pi P^n = pi quad (n gt.eq 0) , #h(2em) X_0 tilde.op pi med ==> med X_n tilde.op pi quad (n gt.eq 0) . $
Individual sample paths still move between states.
]

#remark(title: [Computing a stationary distribution on finite $S$])[
Solve
$ (P^(sans(T)) - I) pi^(sans(T)) = 0 , #h(2em) sum_x pi (x) = 1 , #h(2em) pi (x) gt.eq 0 . $
The stationarity equations sum to zero, so replace any one by normalization. Check nonnegativity; irreducibility guarantees a unique normalized solution (Theorem~#thm-ref(<thm:finite-stationary>);).
]

#remark(title: [Total flow balance])[
The coordinate equation $(pi P) (y) = pi (y)$ is equivalent to
$ underbrace(sum_(x eq.not y) pi (x) p (x , y), upright("inflow to ") y) = underbrace(pi (y) (1 - p (y , y)), upright("outflow from ") y) . $
Stationarity balances total flow at each state; it need not balance each pair of states separately.
]

== Existence, positivity, and uniqueness on finite spaces

#theorem(title: [Finite irreducible stationary distribution], label: <thm:finite-stationary>)[
A finite irreducible chain has a unique stationary distribution, and every entry of it is strictly positive. In fact, the equations $v P = v$ and $sum_x v (x) = 1$ have a unique real solution.
]

#proof[
Write $k = lr(|S|)$; $k = 1$ is immediate. Assume $k gt.eq 2$.

#enum(numbering: n => strong[#n.],
[
#strong[An invariant vector.];
$ (P - I) bold(1) = 0 med ==> med det (P - I) = 0 med ==> med exists v eq.not 0 : med v P = v . $
],
[
#strong[A strictly positive transition matrix.]; Set
$ Q = 1 / 2 (I + P) , #h(2em) R = Q^(k - 1) . $
A shortest path between distinct states has length at most $k - 1$. Since $Q (x , x) gt.eq 1 \/ 2$, self-loops extend it to length $k - 1$; for equal endpoints, use only self-loops. Therefore
$ R (x , y) > 0 quad (x , y in S) , #h(2em) v Q = v , #h(2em) v R = v . $
],
[
#strong[One sign and strict positivity.]; If $v$ had both signs, strict cancellation would give, for every $y$,
$ lr(|v (y)|) = lr(|sum_x v (x) R (x , y)|) < sum_x lr(|v (x)|) R (x , y) . $
Summing over $y$ produces the contradiction
$ sum_y lr(|v (y)|) < sum_x lr(|v (x)|) underbrace(sum_y R (x , y), = 1) = sum_x lr(|v (x)|) . $
Change the sign of $v$ if needed. Then
$ v gt.eq 0 , quad v eq.not 0 , quad v (y) = sum_x v (x) R (x , y) > 0 , #h(2em) pi = frac(v, sum_x v (x)) . $
Thus $pi > 0$, $pi P = pi$, and $sum_x pi (x) = 1$.
],
[
#strong[Uniqueness over real vectors.]; If $u P = u$, $v P = v$ and $sum_x u (x) = sum_x v (x) = 1$, then $w = u - v$ satisfies
$ w P = w , #h(2em) sum_x w (x) = 0 . $
If $w eq.not 0$, it has both signs, contradicting step 3\. Hence $u = v$.
]
)
]

#example(title: [Two-state equilibrium])[
For
$ P = mat(delim: "(", 1 - a, a; b, 1 - b) , #h(2em) a , b in [0 , 1] , $
stationarity and normalization give
$ pi (1) a = pi (2) b , #h(2em) pi (1) + pi (2) = 1 . $
Consequently,
$ a + b > 0 med ==> med pi = (frac(b, a + b) , frac(a, a + b)) . $
If $a = b = 0$, then $P = I$ and every distribution is stationary. This is why normalization and degenerate cases must be checked.
]

= Lecture 5: Special stationary distributions

== Doubly stochastic matrices and detailed balance

#definition(title: [Doubly stochastic matrix])[
A transition matrix $P = (p (x , y))_(x , y in S)$ is #emph[doubly stochastic]; if every row and every column sums to one:
$ sum_(y in S) p (x , y) = 1 quad (x in S) , #h(2em) sum_(x in S) p (x , y) = 1 quad (y in S) . $
]

#proposition(title: [Uniform stationary distribution; original Theorem 1.14])[
If $lr(|S|) = N$ and $P$ is doubly stochastic, then $pi (x) = 1 \/ N$ is stationary.
]

#proof[
For each $y$,
$ (pi P) (y) = 1 / N sum_x p (x , y) = 1 / N = pi (y) . $
]

#remark(title: [Uniqueness, convergence, and infinite spaces])[
Irreducibility makes this distribution unique. For a finite irreducible chain, aperiodicity is additionally needed for convergence from every initial state. A countably infinite set admits no uniform probability distribution assigning the same mass to every state.
]

#definition(title: [Detailed balance])[
For a transition matrix $P$ on $S$, a probability distribution $pi = (pi (x))_(x in S)$ satisfies #emph[detailed balance]; if
$ pi (x) p (x , y) = pi (y) p (y , x) #h(2em) (x , y in S) . $
These equations equate the direct equilibrium flows in both directions.
]

#proposition(title: [Detailed balance implies stationarity])[
Every probability distribution satisfying detailed balance is stationary.
]

#proof[
For every $y$,
$ (pi P) (y) = sum_x pi (x) p (x , y) = pi (y) sum_x p (y , x) = pi (y) . $
]

#example(title: [Stationarity without detailed balance])[
For the deterministic cycle $1 arrow.r 2 arrow.r 3 arrow.r 1$, the uniform distribution is stationary, but
$ pi (1) p (1 , 2) = 1 / 3 eq.not 0 = pi (2) p (2 , 1) . $
Thus detailed balance is sufficient, but not necessary, for stationarity.
]

#remark(title: [Symmetry])[
A finite symmetric stochastic matrix is doubly stochastic and satisfies detailed balance with the uniform distribution. Neither detailed balance nor double stochasticity alone implies matrix symmetry.
]

== Birth and death chains

#definition(title: [Birth and death chain])[
Fix integers $l lt.eq r$ and let $S = { l , l + 1 , dots.h , r }$. A #emph[birth and death chain]; moves only to a neighboring state or stays put. Its upward and downward probabilities are $p_x$ and $q_x$:
$ p (x , x + 1) & = p_x &  & (l lt.eq x < r) ,\
p (x , x - 1) & = q_x &  & (l < x lt.eq r) ,\
p (x , x) & = 1 - p_x - q_x &  & (l lt.eq x lt.eq r) . $
Require $p_x , q_x gt.eq 0$, $p_x + q_x lt.eq 1$, and $q_l = p_r = 0$. All other transition probabilities are zero.
]

#proposition(title: [Product formula])[
Suppose $q_(l + 1) , dots.h , q_r > 0$. Set
$ w_l = 1 , #h(2em) w_x = product_(j = l)^(x - 1) p_j / q_(j + 1) quad (l < x lt.eq r) , #h(2em) Z = sum_(x = l)^r w_x . $
Then $pi (x) = w_x \/ Z$ satisfies detailed balance and is stationary. If also $p_l , dots.h , p_(r - 1) > 0$, the chain is irreducible and this distribution is strictly positive and unique.
]

#proof[
The product formula gives
$ w_(x + 1) q_(x + 1) = w_x p_x quad ==> quad pi (x + 1) q_(x + 1) = pi (x) p_x . $
Detailed balance is automatic for equal states and nonadjacent pairs. Moreover,
$ w_x gt.eq 0 , quad Z gt.eq w_l = 1 quad ==> quad pi (x) gt.eq 0 , quad sum_x pi (x) = 1 . $
If every upward probability is also positive, each edge can be traversed in both directions: the chain is irreducible and $w_x > 0$ for every $x$. Uniqueness follows from Theorem~#thm-ref(<thm:finite-stationary>);.
]

#remark(title: [Reverse construction and infinite chains])[
If all upward probabilities are positive, use
$ w_r = 1 , #h(2em) w_x = q_(x + 1) / p_x w_(x + 1) quad (x = r - 1 , dots.h , l) . $
Never divide by a zero transition probability. On an infinite half-line, the forward construction gives a stationary probability distribution only when $Z = sum_x w_x < oo$.
]

== Random walks on undirected graphs

#definition(title: [Simple random walk on an undirected graph])[
Let $G = (V , E)$ be a finite simple undirected graph with no isolated vertices: $V$ is the vertex set, and $E$ is the set of unordered edges between distinct vertices. For $u , v in V$, define the adjacency entries and degrees by
$ A (u , v) = upright(bold(1))_({ { u , v } in E }) , #h(2em) d (u) = sum_(v in V) A (u , v) > 0 . $
Thus $A (u , v) = A (v , u)$ and $d (u)$ is the number of neighbors of $u$. The #emph[simple random walk]; has state space $S = V$ and chooses one of these neighbors uniformly:
$ p (u , v) = frac(A (u , v), d (u)) . $
]

#proposition(title: [Degree-proportional stationary distribution])[
The simple random walk above has stationary distribution
#numbered-eq("5.1")[$ pi (u) = frac(d (u), sum_v d (v)) = frac(d (u), 2 lr(|E|)) . $] <eq:graph>
]

#proof[
The degree sum is $sum_v d (v) = 2 lr(|E|)$, and symmetry gives detailed balance:
$ pi (u) p (u , v) = frac(A (u , v), 2 lr(|E|)) = frac(A (v , u), 2 lr(|E|)) = pi (v) p (v , u) . $
]

#remark(title: [Connected and regular graphs])[
Connectedness makes the chain irreducible. A regular graph has uniform stationary distribution. Without connectedness, each connected component can receive an arbitrary total stationary mass; #link(<eq:graph>)[(5.1)]; is one particular choice.
]

#example(title: [Link ranking on a directed graph])[
For a finite directed graph with positive out-degrees $d^(+) (j)$, following a uniformly chosen outgoing edge gives
$ p (j , k) = frac(upright(bold(1))_({ j arrow.r k }), d^(+) (j)) . $
Splitting each vertex's score equally among its outgoing links yields
$ pi (k) = sum_(j : j arrow.r k) frac(pi (j), d^(+) (j)) quad <==> quad pi P = pi . $
The undirected degree formula need not apply to this directed chain.
]

#pagebreak()

#heading(level: 1, numbering: none)[Source map and clarifications]

The source is Asaf Cohen, #emph[MATH 526, Fall 2026];, lecture PDFs supplied in #raw("Lecture_Notes_export (1).zip");. The section-to-source map is:

#align(center, table(columns: 3, stroke: none, align: left, inset: (x: 6pt, y: 3pt),
  table.hline(stroke: 0.08em),
  [Lecture], [Source pages], [Material retained],
  table.hline(stroke: 0.05em),
  [2], [2--8, 11--18], [Multistep transitions; stopping and return times],
  [3], [2--5, 10--19], [Recurrence criteria; finite-state decomposition],
  [4], [2--4, 6, 9--10, 14--18], [Stationarity; existence and uniqueness],
  [5], [2--6, 8--12, 14--19], [Detailed balance; special chains and graph walks],
  table.hline(stroke: 0.08em)
))

Proofs have been written out independently and some arguments reorganized to avoid circular reasoning. The principal clarifications are the positive-time return convention, the finite-versus-countable hypotheses, and correct product indices for birth and death weights. The numerical social mobility and gambling calculations from Lectures 2--5 are omitted. Standard probability tools used in the added proofs are conditional expectation, Tonelli's theorem, and the monotone class theorem.
