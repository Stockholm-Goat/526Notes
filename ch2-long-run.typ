// Typst copy of ch2-long-run/ch2-long-run.tex. Shared styles are in notes.typ.
#import "notes.typ": *
#show: notes.with(head-right: [Chapter 2: Lectures 6--7(b)])

#title-block[Chapter 2: Long-run behavior and coupling (Lectures 6--7(b))]

#strong[Scope.]; Lectures 6 and 7, including the Lecture 7(b) exercises (Sections~#heading-ref(<subsec:7b-walks>);--#heading-ref(<subsec:7b-maximal>);): periodicity, the limit theorems and their proofs, coupling, total variation, and convergence, with completed proofs and derivations. Purely numerical examples are omitted. Numbering is local; original theorem numbers and source pages are recorded where useful.

// #include "front.typ"

#outline(depth: 1)

#pagebreak()

#counter(heading).update(5)

= Lecture 6: Periodicity and long-run behavior

== Limiting distributions and period

#remark(title: [Transient states have vanishing transition probabilities])[
Let $P$ be a transition matrix on a finite or countable state space $S$. For every $x , y in S$, (3.1) gives
$ y upright(" transient") quad ==> quad sum_(n = 1)^oo P^n (x , y) < oo quad ==> quad P^n (x , y) limits(-->)_(n arrow.r oo) 0 . $
]

#definition(title: [Limiting distribution])[
For a Markov chain $(X_n)_(n gt.eq 0)$ with transition matrix $P$ on a finite or countable state space $S$, a probability vector $q = (q (y))_(y in S)$ is a #emph[limiting distribution]; if
$ forall x , y in S , #h(2em) P^n (x , y) limits(-->)_(n arrow.r oo) q (y) . $
Here $P^n (x , y) = bb(P)_x (X_n = y)$: the limiting state probabilities are the same for every initial state $x$.
]

#proposition(title: [A limiting distribution is stationary], label: <prop:limit-stationary>)[
Let $P$ be a transition matrix on a finite or countable state space $S$. If a probability vector $q$ on $S$ is a limiting distribution for $P$, then $q P = q$.
]

#proof[
Fix $x in S$. For every $y in S$, Fatou's lemma and Chapman--Kolmogorov give
$ (q P) (y) = sum_(z in S) lim_(n arrow.r oo) P^n (x , z) p (z , y) lt.eq liminf_n P^(n + 1) (x , y) = q (y) . $
Hence
$ q (y) - (q P) (y) gt.eq 0 , #h(2em) sum_(y in S) [q (y) - (q P) (y)] = 1 - 1 = 0 quad ==> quad q P = q . $
For finite $S$, interchange the limit and the finite sum directly.
]

#remark(title: [Loss of mass on an infinite space])[
For a chain on a countably infinite $S$ and a fixed $x in S$, the limits $q (y) = lim_(n arrow.r oo) P^n (x , y)$, if they exist for every $y in S$, can satisfy $sum_(y in S) q (y) < 1$. Such a $q$ is not a limiting #emph[probability distribution]; under this definition.
]

#definition(title: [Return lengths, period, and aperiodicity])[
Let $P$ be a transition matrix on a finite or countable state space $S$. For each state $x in S$, let
$ I_x = { n in { 1 , 2 , dots.h } : P^n (x , x) > 0 } $
be its possible positive return lengths. If $I_x eq.not nothing$, its #emph[period]; is
$ d (x) = gcd I_x , $
the greatest common divisor of those lengths. The state is #emph[aperiodic]; iff $d (x) = 1$; an irreducible chain is aperiodic iff every state $x in S$ has period one.
]

#lemma(title: [Period is a class property; original Lemma 1.17], label: <lem:period-class>)[
Let $P$ be a transition matrix on a finite or countable state space $S$. For any $x , y in S$ with $x arrow.r y$ and $y arrow.r x$, both periods are defined and $d (x) = d (y)$.
]

#proof[
Fix such $x , y$ and choose integers $a , b gt.eq 1$ with $P^a (x , y) P^b (y , x) > 0$. Thus $a + b in I_x inter I_y$, so both periods are defined. For every $n in I_y$,
$ a + b , med a + n + b in I_x quad ==> quad d (x) divides n quad ==> quad d (x) divides d (y) . $
Interchange $x , y$ to obtain $d (y) divides d (x)$.
]

#remark(title: [Quick tests for aperiodicity])[
For a transition matrix $P$ on a finite or countable state space $S$, every $x in S$ and integer $n gt.eq 1$ satisfy
$ n , n + 1 in I_x med ==> med d (x) = 1 , #h(2em) p (x , x) > 0 med ==> med 1 in I_x med ==> med d (x) = 1 . $
Thus an irreducible chain with $p (x , x) > 0$ for at least one $x in S$ is aperiodic.
]

#proposition(title: [Periodicity prevents ordinary convergence])[
Let $P$ be the transition matrix of an irreducible chain on a finite state space $S$, with common period $d > 1$. Then the matrix sequence $(P^n)_(n gt.eq 0)$ does not converge entrywise as $n arrow.r oo$.
]

#proof[
Suppose $P^n arrow.r L$ and let $pi$ be the unique stationary distribution. For every $x in S$, the row $L (x , dot.op)$ is a stationary probability vector; Theorem~4.3 gives
$ L (x , dot.op) = pi , #h(2em) pi (x) > 0 . $
Fix $x in S$. For every integer $n gt.eq 1$, $d divides.not n arrow.r.double P^n (x , x) = 0$; this holds along an infinite subsequence, contradicting $P^n (x , x) arrow.r pi (x) > 0$.
]

#example(title: [Stationarity without convergence])[
On $S = { 1 , 2 }$, let $P$ and $pi$ be as below. For every integer $n gt.eq 0$,
$ P = mat(delim: "(", 0, 1; 1, 0) , quad pi = (1 \/ 2 , 1 \/ 2) , quad pi P = pi , quad P^(2 n) = I , quad P^(2 n + 1) = P . $
]

#remark(title: [Making a chain lazy])[
For any transition matrix $P$ on a finite or countable state space $S$, let $Q = (I + P) \/ 2$, where $I$ is the identity matrix. For every probability vector $pi$ on $S$, $pi Q = pi <==> pi P = pi$; $Q$ is irreducible iff $P$ is. Since $Q (x , x) gt.eq 1 \/ 2$ for every $x in S$, an irreducible $Q$ is aperiodic.
]

== Main limit theorems and their hypotheses

#notation(title: [Hypotheses and empirical visit counts])[
For a Markov chain $(X_n)_(n gt.eq 0)$ with transition matrix $P$ on a finite or countable state space $S$, use
$ mat(delim: #none, augment: #(vline: (1,)), align: #left, upright(I) , upright("irreducibility") ; upright(A) , upright("aperiodicity") ; upright(R) , upright("recurrence of every state") ; upright(S) , upright("existence of a stationary probability distribution ") pi) #h(2em) N_y (n) = sum_(j = 1)^n upright(bold(1))_({ X_j = y }) . $
The count is defined for every $y in S$ and integer $n gt.eq 1$; $upright(S)$ denotes the hypothesis in the table (distinct from the state space $S$).
]

#theorem(title: [Limit theorems; original Theorems 1.19--1.23], label: <thm:limits>)[
Let $(X_n)_(n gt.eq 0)$ be a Markov chain with transition matrix $P$ on a finite or countable state space $S$. The following hold for every initial state $x in S$ and every target state $y in S$, with $n arrow.r oo$ through positive integers. All almost-sure limits are under $bb(P)_x$. Whenever $upright(S)$ holds, let $pi$ be any stationary probability distribution for $P$. In part (4), the probability-one event may depend on $f$.

#enum(numbering: "(1)",
[
#strong[Convergence in distribution.]; $upright(I) + upright(A) + upright(S) med ==> med norm(P^n (x , dot.op) - pi)_(upright(T V)) arrow.r 0$, hence $P^n (x , y) arrow.r pi (y)$.
],
[
#strong[Visit frequency.]; $upright(I) + upright(R) med ==> med N_y (n) \/ n arrow.r 1 \/ bb(E)_y T_y$ almost surely, where $T_y = inf { k in { 1 , 2 , dots.h } : X_k = y }$ and $1 \/ oo = 0$.
],
[
#strong[Return-time formula and uniqueness.]; $upright(I) + upright(S) med ==> med pi (y) = 1 \/ bb(E)_y T_y > 0$ for every $y in S$; the stationary distribution is unique.
],
[
#strong[Ergodic theorem.]; If $upright(I) + upright(S)$, then for every function $f : S arrow.r bb(R)$ with $sum_(z in S) lr(|f (z)|) pi (z) < oo$,
$ 1 / n sum_(j = 1)^n f (X_j) --> sum_(z in S) f (z) pi (z) quad upright("almost surely") . $
],
[
#strong[Cesàro convergence.]; $upright(I) + upright(S) med ==> med n^(- 1) sum_(j = 1)^n P^j (x , y) arrow.r pi (y)$.
]
)
]

#definition(title: [Positive and null recurrence], label: <def:pos-null>)[
Let $(X_n)_(n gt.eq 0)$ be a Markov chain on a finite or countable state space $S$. For a recurrent state $y in S$, let $T_y = inf { n in { 1 , 2 , dots.h } : X_n = y }$, its first return time under $bb(P)_y$. Then
$ y upright(" positive recurrent") & <==> bb(E)_y T_y < oo ,\
y upright(" null recurrent") & <==> bb(E)_y T_y = oo . $
Thus the distinction is whether the mean return time is finite.
]

#remark(title: [Which assumptions are needed?])[
Only part (1) of Theorem~#thm-ref(<thm:limits>); requires aperiodicity. For any irreducible chain on a finite state space, $upright(R) + upright(S)$ hold; on countably infinite spaces, recurrence need not imply finite mean return time (Theorem~9.5(b)).
]

== Stationary mass and recurrence

#lemma(title: [Stationary mass implies recurrence; original Lemma 1.25], label: <lem:stationary-recurrence>)[
Let $P$ be a transition matrix on a finite or countable state space $S$, and let $pi$ be a stationary probability distribution for $P$. For every $y in S$, $pi (y) > 0$ implies that $y$ is recurrent. If $P$ is irreducible, then every $y in S$ satisfies $pi (y) > 0$ and is recurrent.
]

#proof[
#strong[1\. Recurrence.]; Fix $y in S$ with $pi (y) > 0$. If $rho_(y y) = bb(P)_y (T_y < oo) < 1$, the total visit count $N_y = sum_(n = 1)^oo upright(bold(1))_({ X_n = y })$ satisfies, by (3.1),
$ sum_(x in S) pi (x) bb(E)_x N_y = sum pi (x) frac(rho_(x y), 1 - rho_(y y)) lt.eq frac(1, 1 - rho_(y y)) < oo . $
Stationarity and Tonelli instead give
$ sum_(x in S) pi (x) bb(E)_x N_y = sum_(n gt.eq 1) (pi P^n) (y) = sum_(n gt.eq 1) pi (y) = oo , $
a contradiction.

#strong[2\. Positivity.]; Now assume irreducibility. Choose $z in S$ with $pi (z) > 0$. For each $y in S$, there is an integer $m = m (z , y) gt.eq 0$ such that
$ P^m (z , y) > 0 quad ==> quad pi (y) = (pi P^m) (y) gt.eq pi (z) P^m (z , y) > 0 . $
]

#remark(title: [Proofs])[
Part (1) of Theorem~#thm-ref(<thm:limits>); is proved by coupling in Lecture 7\. Parts (2)--(5) are stated without proof in the lecture and are not proved here. Part (4) identifies empirical time averages with stationary expectations, without an aperiodicity assumption.
]

= Lecture 7: Coupling, total variation, and convergence

== Coupling distributions

#definition(title: [Coupling of measures and random variables])[
#strong[Measures.]; Let $mu , nu$ be probability measures on a measurable space $(E , cal(E))$. A #emph[coupling]; of $mu , nu$ is a probability measure $eta$ on $(E times E , cal(E) times.o cal(E))$ satisfying
$ eta (A times E) = mu (A) , #h(2em) eta (E times A) = nu (A) #h(2em) (A in cal(E)) . $
#strong[Random variables.]; Let $X_i : (Omega_i , cal(F)_i , bb(P)_i) arrow.r (E , cal(E))$, $i = 1 , 2$, be random variables. A coupling of $X_1 , X_2$ is a pair of $E$-valued random variables $Y_1 , Y_2$ on a common probability space $(Omega , cal(F) , bb(P))$ such that
$ bb(P) circle.stroked.tiny Y_i^(- 1) = bb(P)_i circle.stroked.tiny X_i^(- 1) #h(2em) (i = 1 , 2) . $
Equivalently, $cal(L) (Y_i) = cal(L) (X_i)$; their joint law is a coupling of $cal(L) (X_1) , cal(L) (X_2)$.
]

#remark(title: [Dependence is allowed])[
The marginal laws are prescribed; the coupled random variables need not be independent. These definitions apply to general measurable spaces. The Markov-chain results retain the standing finite or countable state space $S$.
]

#example(title: [Monotone Bernoulli coupling])[
For real parameters $0 lt.eq q lt.eq p lt.eq 1$, let $Z tilde.op upright(U n i f o r m) [0 , 1]$ and set
$ U = upright(bold(1))_({ Z lt.eq q }) , #h(2em) V = upright(bold(1))_({ Z lt.eq p }) . $
Then $U tilde.op upright(B e r n o u l l i) (q)$, $V tilde.op upright(B e r n o u l l i) (p)$, and $U lt.eq V$ almost surely. The two joint laws are
$ mat(delim: #none, augment: #(hline: (1,), vline: (1,)), upright("monotone") , V = 0 , V = 1 ; U = 0 , 1 - p , p - q ; U = 1 , 0 , q) #h(2em) mat(delim: #none, augment: #(hline: (1,), vline: (1,)), upright("independent") , V = 0 , V = 1 ; U = 0 , (1 - q) (1 - p) , (1 - q) p ; U = 1 , q (1 - p) , q p) . $
Let $(U_i , V_i)_(i gt.eq 1)$ be independent copies of the monotone pair. For every integer $n gt.eq 1$ and every $k in bb(Z)$,
$ sum_(i = 1)^n U_i lt.eq sum_(i = 1)^n V_i med upright("a.s.") quad ==> quad bb(P) (upright(B i n) (n , q) gt.eq k) lt.eq bb(P) (upright(B i n) (n , p) gt.eq k) . $
]

== Total variation and the coupling inequality

#definition(title: [Total variation distance])[
For probability measures $mu , nu$ on the same measurable space $(E , cal(E))$, their #emph[total variation distance]; is
$ norm(mu - nu)_(upright(T V)) = sup_(A in cal(E)) lr(|mu (A) - nu (A)|) . $
It would be trivial to verify that this is indeed a norm
]

#proposition(title: [Discrete total variation formula])[
Let $S$ be finite or countable, and let $mu , nu$ be probability measures on $(S , 2^S)$. For every $z in S$, write $mu (z) = mu ({ z })$ and $nu (z) = nu ({ z })$. Then
$ norm(mu - nu)_(upright(T V)) = 1 / 2 sum_(z in S) lr(|mu (z) - nu (z)|) . $
]

#proof[
Note the supremum is attained by $A_(+) = { z in S : mu (z) gt.eq nu (z) }$. For $z in S$, write $delta_z = mu (z) - nu (z)$. Since $sum_z delta_z = 0$,
$ D := sum_(z in A_(+)) delta_z = - sum_(z in.not A_(+)) delta_z ==> D = 1 / 2 sum_z lr(|delta_z|) . $
Notice
$ norm(mu - nu)_(upright(T V)) = mu (A_(+)) - nu (A_(+)) = sum_(x = in A_(+)) delta_x = D quad $
]

#lemma(title: [Coupling inequality], label: <lem:coupling>)[
Let $(E , cal(E))$ be a measurable space and let $U , V : (Omega , cal(F) , bb(P)) arrow.r (E , cal(E))$ be random variables with laws $mu , nu$, respectively. Assume ${ U eq.not V } in cal(F)$ (as it is for countable discrete $E$). Then
$ norm(mu - nu)_(upright(T V)) lt.eq bb(P) (U eq.not V) . $
]

#proof[
For every $A in cal(E)$,
$ lr(|mu (A) - nu (A)|) & = lr(|bb(E) (upright(bold(1))_({ U in A }) - upright(bold(1))_({ V in A }))|)\
 & lt.eq bb(E) lr(|upright(bold(1))_({ U in A }) - upright(bold(1))_({ V in A })|) lt.eq bb(P) (U eq.not V) . $
Take $sup_(A in cal(E))$.
]

#corollary[
Use the same setting as in lemma #thm-ref(<lem:coupling>);, let $eta$ be a coupling of $mu , nu$, then
$ norm(mu - nu)_(upright(T V)) lt.eq eta (X eq.not Y) $
where $(X , Y) tilde.op eta$
]

#proof[
$forall A in cal(E)$, we have:
$ mu (A) - nu (A) & = eta (A , Omega) - eta (Omega , A)\
 & = eta (A , Y = X) + eta (A , Y eq.not X) - eta (Y = X , A) - eta (Y eq.not X , A)\
 & = eta (A , Y eq.not X) - eta (Y eq.not X , A)\
 & lt.eq eta (X eq.not Y) $
OR we just notice $bb(P) (X eq.not Y) lt.eq eta (X eq.not Y)$
]

#example(title: [Poisson coupling])[
For real parameters $0 lt.eq lambda_1 lt.eq lambda_2$, take independent random variables
$ U tilde.op "Pois" (lambda_1) , #h(2em) W tilde.op "Pois" (lambda_2 - lambda_1) , #h(2em) V = U + W tilde.op "Pois" (lambda_2) . $
The coupling inequality gives
$ norm("Pois" (lambda_1) - "Pois" (lambda_2))_(upright(T V)) & lt.eq bb(P) (W > 0)\
 & = 1 - e^(- (lambda_2 - lambda_1)) lt.eq lambda_2 - lambda_1 . $
For arbitrary $lambda_1 , lambda_2 in \[ 0 , oo \)$, replace $lambda_2 - lambda_1$ by $lr(|lambda_2 - lambda_1|)$.
]

== Aperiodicity implies eventual positive transition probabilities

#lemma(title: [Eventual positivity; original Lemma 1.26], label: <lem:eventual>)[
Let $P$ be the transition matrix of a discrete-time Markov chain on a finite or countable state space $S$, and let $d (x)$ denote the period of a state $x in S$ with a positive-probability return. For every such state $x$ with $d (x) = 1$,
$ exists n_x in bb(Z)_(gt.eq 1) quad forall n in bb(Z)_(gt.eq n_x) : quad P^n (x , x) > 0 . $
]

#proof[
Fix $x in S$ with $d (x) = 1$. Notice For $I_x = { n in bb(Z)_(gt.eq 1) : P^n (x , x) > 0 }$,
$ a , b in I_x quad ==> quad P^(a + b) (x , x) gt.eq P^a (x , x) P^b (x , x) > 0 quad ==> quad a + b in I_x . $

The successive gcds of an enumeration of $I_x$ form a divisibility sequence of positive integers. They stabilize at $gcd I_x = 1$; hence
$ exists r in bb(Z)_(gt.eq 1) , med a_1 , dots.h , a_r in I_x : quad gcd (a_1 , dots.h , a_r) = 1 . $
Put $a = a_1$. The Euclidean algorithm (Bézout's identity) gives integers $c_1 , dots.h , c_r in bb(Z)$ such that
$ sum_(i = 1)^r c_i a_i = 1 . $
For each $i in { 1 , dots.h , r }$, add a sufficiently large nonnegative multiple of $a$ to $c_i$ to obtain an integer $k_i gt.eq 1$. Then
$ b := sum_(i = 1)^r k_i a_i in I_x , #h(2em) b equiv sum_(i = 1)^r c_i a_i = 1 med \( mod med a \) . $
Set $n_x = (a - 1) b + 1$. For any integer $n gt.eq n_x$, let $s in { 0 , dots.h , a - 1 }$ be the remainder when $n$ is divided by $a$. Then
$ n - s b equiv s - s = 0 med \( mod med a \) , #h(2em) n - s b gt.eq n - (a - 1) b gt.eq 1 . $
Thus, for the positive integer $m = (n - s b) \/ a$,
$ n = s b + m a in I_x , $
because $a , b in I_x$, $s gt.eq 0$, $m gt.eq 1$, and $I_x$ is closed under addition.
]

#corollary[
Under the setting of the previous lemma, if the chain is irreducible and aperiodic, then
$ forall (x , y) in S^2 quad exists n_(x , y) in bb(Z)_(gt.eq 1) quad forall n in bb(Z)_(gt.eq n_(x , y)) : quad P^n (x , y) > 0 . $
The thresholds may depend on $x$ or on $(x , y)$, respectively.
]

#proof[
Let $(x , y) in S^2$. Choose an integer $l gt.eq 0$ with $P^l (x , y) > 0$. For every integer $n gt.eq l + n_y$,
$ P^n (x , y) gt.eq P^l (x , y) P^(n - l) (y , y) > 0 . $
]

== Proof of convergence by a coalescing coupling

#definition(title: [Coalescing coupling and meeting time])[
Let $S$ be finite or countable and $P$ a transition matrix on $S$. Let $X = (X_n)_(n gt.eq 0)$ and $Y = (Y_n)_(n gt.eq 0)$ be two $S$-valued Markov chains, each with transition matrix $P$, constructed on one probability space $(Omega , cal(F) , bb(P))$. Their #emph[meeting time]; is
$ tau = inf { n in bb(Z)_(gt.eq 0) : X_n = Y_n } . $
The coupling is #emph[coalescing]; if it satisfies the additional condition
$ bb(P) (tau lt.eq n , med X_n eq.not Y_n) = 0 #h(2em) upright("for every integer ") n gt.eq 0 . $
That is, after their first meeting, the chains remain equal almost surely. The assertion $bb(P) (tau < oo) = 1$ is a separate property. Each coordinate must retain its own Markov-chain law. One construction uses independent transitions before $tau$ and the same sampled next state for both chains after $tau$.
]

#proof(title: [Proof of Theorem~#thm-ref(<thm:limits>);(1)])[
Recall the statement. Let $P$ be irreducible, aperiodic on countable state space and $pi$ stationary exists. We want to show $norm(P^n (x , dot.op) - pi)_(upright(T V)) arrow.r 0$

Fix an initial state $x in S$.

#strong[Step 1]; For $(u , v) , (u ' , v ') in S^2$ and every integer $n gt.eq 0$, its transition matrix and powers are
$ Q ((u , v) , (u ' , v ')) & = p (u , u ') p (v , v ') ,\
Q^n ((u , v) , (u ' , v ')) & = P^n (u , u ') P^n (v , v ') . $
By Lemma~#thm-ref(<lem:eventual>);, both factors are positive for all sufficiently large $n$. Hence any product state can reach any other.

#strong[Step 2]; For every $(u ' , v ') in S^2$, stationarity of $pi$ gives
$ (pi times.o pi) Q (u ' , v ') & = sum_(u , v) pi (u) pi (v) p (u , u ') p (v , v ')\
 & = (sum_u pi (u) p (u , u ')) (sum_v pi (v) p (v , v '))\
 & = pi (u ') pi (v ') . $

Let $a in S$ such that $pi (a) > 0$, then $(pi times.o pi) (a , a) > 0$, hence $(a , a)$ is recurrent in $S^2$.
$ bb(P) (upright("ever hit ") (a , a)) = 1 ==> bb(P) (upright("ever hit the diagonal")) = 1 . $

#strong[Step 3]; Start $X_0 = x$, $Y_0 tilde.op pi$, independently until the first meeting; then use shared transitions. Each coordinate still has transition matrix $P$, so for every integer $n gt.eq 0$,
$ X_n tilde.op P^n (x , dot.op) , #h(2em) Y_n tilde.op pi . $
Before meeting, the pair agrees with the independent product construction; therefore $bb(P) (tau < oo) = 1$. For every integer $n gt.eq 0$, Lemma~#thm-ref(<lem:coupling>); yields
$ norm(P^n (x , dot.op) - pi)_(upright(T V)) & = norm(P^n (x , dot.op) - sum_z pi (z) P^n (z , dot.op))_(upright(T V))\
 & = norm(cal(L) X_n - cal(L) Y_n)_(upright(T V))\
 & lt.eq bb(P) (X_n eq.not Y_n)\
 & = bb(P) (tau > n) --> 0 . $
For every $y in S$,
$ lr(|P^n (x , y) - pi (y)|) lt.eq norm(P^n (x , dot.op) - pi)_(upright(T V)) --> 0 . $
]

#remark(title: [Which product chain is recurrent?])[
The recurrence and stationarity argument applies to the #emph[independent]; product chain. It supplies the finite meeting time for the coalescing coupling; the two joint chains have different transitions after meeting.
]

== Random-to-top shuffling and coupon collection

#definition(title: [Random-to-top shuffle])[
Fix a positive integer $m$. Let $frak(S)_m$ be the set of $m !$ orderings of a deck of $m$ distinct labeled cards. The chain has state space $frak(S)_m$. At each step, independently select a position uniformly from ${ 1 , dots.h , m }$ and move that card to the top, preserving the relative order of the other cards. Equivalently, select a card label uniformly at each step.
]

#proposition(title: [Uniform stationarity and ergodicity of the shuffle])[
For every integer $m gt.eq 1$, the random-to-top chain on the permutation set $frak(S)_m$ is irreducible and aperiodic. Its unique stationary distribution is
$ pi (sigma) = frac(1, m !) #h(2em) (sigma in frak(S)_m) . $
]

#proof[
#enum(numbering: "1.",
[
#strong[Stationarity.]; Fix an integer $m gt.eq 1$ and a target deck $sigma = (a_1 , a_2 , dots.h , a_m) in frak(S)_m$. Its $m$ predecessors insert $a_1$ in one of the $m$ positions of $(a_2 , dots.h , a_m)$; each reaches $sigma$ with probability $1 \/ m$. Thus
$ sum_eta p (eta , sigma) = m dot.op 1 / m = 1 , #h(2em) (pi P) (sigma) = frac(1, m !) sum_eta p (eta , sigma) = frac(1, m !) . $
],
[
#strong[Irreducibility and aperiodicity.]; Selecting $a_m , a_(m - 1) , dots.h , a_1$ produces $sigma$ from any deck $eta in frak(S)_m$, so $P^m (eta , sigma) gt.eq m^(- m) > 0$. Selecting the top card leaves a deck unchanged, so $p (eta , eta) gt.eq 1 \/ m > 0$.
]
)
]

#definition(title: [Coupon collection time])[
Fix a positive integer $m$, the number of distinct labels. Let $L_1 , L_2 , dots.h$ be independent random variables, each uniform on ${ 1 , dots.h , m }$; $L_n$ is the label selected on draw $n in bb(Z)_(gt.eq 1)$. The #emph[coupon collection time]; is the random variable
$ T = inf { n in bb(Z)_(gt.eq 1) : { L_1 , dots.h , L_n } = { 1 , dots.h , m } } , $
the first draw by which every label has appeared.
]

#proposition(title: [Shuffle coupling bound])[
Fix an integer $m gt.eq 1$. Let $P$ be the random-to-top transition matrix on $frak(S)_m$, and let $pi$ be uniform on $frak(S)_m$. For any initial deck $x in frak(S)_m$, couple chains $X , Y$ with $X_0 = x$ and $Y_0 tilde.op pi$ using the same iid uniform card labels $(L_j)_(j gt.eq 1)$, independent of the initial decks. Let
$ tau = inf { j in bb(Z)_(gt.eq 0) : X_j = Y_j } , #h(2em) T = inf { j in bb(Z)_(gt.eq 1) : { L_1 , dots.h , L_j } = { 1 , dots.h , m } } . $
Then $tau lt.eq T$ almost surely, and for every integer $n gt.eq 0$,
#numbered-eq("7.1")[$ norm(P^n (x , dot.op) - pi)_(upright(T V)) lt.eq bb(P) (tau > n) lt.eq bb(P) (T > n) . $] <eq:shuffle>
]

#proof[
Fix any integer $n gt.eq 0$. At time $n$, both decks consist of
$ underbrace(upright("selected labels, in decreasing order of last selection"), upright("identical in both decks")) quad + quad underbrace(upright("unselected labels"), upright("original relative order")) . $
Hence $n gt.eq T arrow.r.double X_n = Y_n$, so $tau lt.eq T$. Shared label selections preserve equality after $tau$; the coupling inequality gives
$ norm(P^n (x , dot.op) - pi)_(upright(T V)) lt.eq bb(P) (X_n eq.not Y_n) = bb(P) (tau > n) lt.eq bb(P) (T > n) . $
]

#remark(title: [Meeting may occur before collection])[
For the shared-label shuffle coupling above, the meeting time $tau$ satisfies $tau lt.eq T$, where $T$ is its coupon collection time; equality $tau = T$ need not hold.
]

#proposition(title: [Expected coupon collection time])[
For every integer $m gt.eq 1$, let $(L_j)_(j gt.eq 1)$ be iid uniform on ${ 1 , dots.h , m }$, and let $T$ be the first draw by which all $m$ labels have appeared. Then
$ bb(E) T = m H_m , #h(2em) H_m = sum_(j = 1)^m 1 / j . $
]

#proof[
For each $i in { 1 , dots.h , m }$, let $D_i$ count the additional selections needed to increase the number of distinct labels from $i - 1$ to $i$. Conditional on the collected set, for every integer $k gt.eq 0$,
$ p_i = frac(m - i + 1, m) , #h(2em) bb(P) (D_i > k divides upright("history at ") i - 1 upright(" distinct labels")) = (1 - p_i)^k . $
Thus $D_i tilde.op "Geom" (p_i)$ on ${ 1 , 2 , dots.h }$, and
$ T = sum_(i = 1)^m D_i quad ==> quad bb(E) T = sum_(i = 1)^m 1 / p_i = sum_(i = 1)^m frac(m, m - i + 1) = m H_m . $
Linearity of expectation does not require independence of the $D_i$.
]

#corollary(title: [Deterministic mixing bounds])[
For every integer $m gt.eq 1$, let $P$ be the random-to-top transition matrix on $frak(S)_m$, let $pi$ be uniform on $frak(S)_m$, and put $H_m = sum_(j = 1)^m 1 \/ j$. For every $x in frak(S)_m$ and every integer $n gt.eq 1$,
$ norm(P^n (x , dot.op) - pi)_(upright(T V)) lt.eq min {1 , frac(m H_m, n) , m e^(- n \/ m)} . $
For every $epsilon in (0 , 1)$, either condition on the integer $n$ guarantees this distance is at most $epsilon$, uniformly in $x$:
$ n gt.eq frac(m H_m, epsilon) #h(2em) upright("or") #h(2em) n gt.eq m (log m + log (1 \/ epsilon)) . $
]

#proof[
Let $T$ be the collection time of the iid labels $(L_j)_(j gt.eq 1)$ in the shared-label coupling. For any integer $n gt.eq 1$, Markov's inequality and the union bound give, respectively,
$ bb(P) (T > n) & lt.eq frac(bb(E) T, n) = frac(m H_m, n) ,\
bb(P) (T > n) & lt.eq sum_(i = 1)^m bb(P) (i in.not { L_1 , dots.h , L_n })\
 & = m (1 - 1 / m)^n lt.eq m e^(- n \/ m) . $
Apply #link(<eq:shuffle>)[(7.1)];; total variation is also at most one.
]

#remark(title: [Expectation versus deterministic error])[
For $H_m = sum_(j = 1)^m 1 \/ j$, the approximation $H_m tilde.op log m$ is as $m arrow.r oo$ through positive integers, not an exact finite-$m$ bound. Knowing the mean collection time $bb(E) T$ alone does not give a prescribed total-variation error at a fixed integer time $n$ without a tail estimate.
]

#proposition(title: [Uniform deck at collection])[
Fix an integer $m gt.eq 1$ and any initial deck $x in frak(S)_m$. Let $(X_n)_(n gt.eq 0)$ be the random-to-top chain started at $x$, driven by iid uniform labels, and let $T$ be the first time all $m$ labels have been selected. For every integer $t gt.eq 1$ with $bb(P)_x (T = t) > 0$ and every $sigma in frak(S)_m$,
$ bb(P)_x (X_T = sigma divides T = t) = frac(1, m !) . $
In particular, $cal(L)_x (X_T)$ is uniform on $frak(S)_m$ for every $x in frak(S)_m$.
]

#proof[
Fix $x , sigma in frak(S)_m$ and an integer $t gt.eq 1$ with $bb(P)_x (T = t) > 0$. At $T = t$, every card has been selected, so $X_T$ depends only on the last selection times. Relabeling cards preserves both the law of $(L_1 , dots.h , L_t)$ and the event ${ T = t }$, and relabels the resulting deck. Hence, for every permutation $rho$ of the label set ${ 1 , dots.h , m }$,
$ bb(P)_x (X_T = sigma divides T = t) = bb(P)_x (X_T = rho sigma divides T = t) . $
Relabelings act transitively on the $m !$ decks; their conditional probabilities are equal and sum to one.
]

#remark(title: [Random times require a separate argument])[
Uniformity at $T$ follows from relabeling symmetry. Stationarity at each deterministic time alone would not justify substituting the random time $T$.
]

== Lecture 7(b): recurrence of lattice random walks <subsec:7b-walks>

#notation(title: [Asymptotic equivalence and Stirling's formula])[
For real sequences $(a_n)_(n gt.eq 1)$ and $(b_n)_(n gt.eq 1)$ with $b_n eq.not 0$ for all sufficiently large integers $n$, write
$ a_n tilde.op b_n quad <==> quad a_n / b_n limits(-->)_(n arrow.r oo) 1 . $
Stirling's formula for factorials is $n ! tilde.op sqrt(2 pi n) (n \/ e)^n$. Multiplicative constants matter in an asymptotic equivalence.
]

#remark(title: [Return-sum criterion])[
For any transition matrix $P$ on a finite or countable state space $S$ and every state $x in S$, the calculations below use
$ x upright(" recurrent") quad <==> quad sum_(n gt.eq 1) P^n (x , x) = oo . $
]

#example(title: [A mean-zero walk with jumps $+ 2$ and $- 1$])[
Let $(xi_j)_(j gt.eq 1)$ be iid integer-valued random variables with
$ bb(P) (xi_j = 2) = 1 / 3 , #h(2em) bb(P) (xi_j = - 1) = 2 / 3 #h(2em) (j in bb(Z)_(gt.eq 1)) . $
Then $bb(E) xi_j = 0$ for every integer $j gt.eq 1$. Set $X_0 = 0$ and $X_n = sum_(j = 1)^n xi_j$ for every integer $n gt.eq 1$. The induced transition matrix $P$ on $S = bb(Z)$ is irreducible, and every state $x in bb(Z)$ is recurrent with period $d (x) = 3$.
]

#proof[
#enum(numbering: "1.",
[
#strong[Irreducibility.]; The paths $(- 1)$ and $(+ 2 , - 1)$ give displacements $- 1$ and $+ 1$, both with positive probability; hence all integers communicate.
],
[
#strong[Period.]; A positive-time return with $a , b in bb(Z)_(gt.eq 0)$ upward and downward jumps, respectively, has $a + b gt.eq 1$ and satisfies
$ 2 a - b = 0 quad ==> quad a + b = 3 a . $
A three-step return is possible, so $d (0) = 3$.
],
[
#strong[Recurrence.]; For every integer $n gt.eq 1$, count paths; as $n arrow.r oo$, apply Stirling's formula:
$ P^(3 n) (0 , 0) = binom(3 n, n) (1 / 3)^n (2 / 3)^(2 n) tilde.op frac(sqrt(3), 2 sqrt(pi n)) . $
Thus $sum_(k gt.eq 1) P^k (0 , 0) = oo$. Irreducibility extends recurrence to every state.
]
)
]

#proposition(title: [Simple symmetric walks in dimensions two and three])[
For each dimension $d in { 2 , 3 }$, let $P$ be the transition matrix on $bb(Z)^d$ defined by
$ p (x , x + e_i) = p (x , x - e_i) = frac(1, 2 d) #h(2em) (x in bb(Z)^d , med i in { 1 , dots.h , d }) , $
where $e_i$ is the $i$th coordinate unit vector; all other transitions have probability zero. Every state is recurrent when $d = 2$ and transient when $d = 3$. In each dimension, the chain is irreducible and every state has period two.
]

#proof[
#enum(numbering: "1.",
[
#strong[Communication and period.]; For either dimension $d in { 2 , 3 }$, nearest-neighbor paths connect the lattice. Each step changes the parity of the coordinate sum, while a two-step return has positive probability. For every integer $n gt.eq 0$,
$ P^(2 n + 1) (0 , 0) = 0 , #h(2em) P^2 (0 , 0) > 0 quad ==> quad d (0) = 2 . $
],
[
#strong[Two dimensions.]; Fix an integer $n gt.eq 1$. A $2 n$-step return has $m$ steps in each vertical direction and $n - m$ in each horizontal direction for some $m in { 0 , dots.h , n }$. Therefore
$ P^(2 n) (0 , 0) & = 4^(- 2 n) sum_(m = 0)^n frac((2 n) !, m !^2 (n - m) !^2)\
 & = 4^(- 2 n) binom(2 n, n) sum_(m = 0)^n binom(n, m)^2\
 & = 4^(- 2 n) binom(2 n, n)^2 tilde.op frac(1, pi n) . $
Here $sum_m binom(n, m)^2 = binom(2 n, n)$ counts selections of $n$ elements from two disjoint sets of size $n$. Thus $sum_(k gt.eq 1) P^k (0 , 0) = oo$.
],
[
#strong[Three dimensions.]; Fix an integer $n gt.eq 1$. For $i , j , k in bb(Z)_(gt.eq 0)$ with $i + j + k = n$, define
$ a_(i j k) = frac(n !, 3^n i ! j ! k !) , #h(2em) i + j + k = n , #h(2em) sum_(i + j + k = n) a_(i j k) = 1 . $
Counting equal numbers of positive and negative steps along each axis,
$ P^(2 n) (0 , 0) & = 6^(- 2 n) sum_(i + j + k = n) frac((2 n) !, (i ! j ! k !)^2)\
 & = 4^(- n) binom(2 n, n) sum_(i + j + k = n) a_(i j k)^2 . $
Let $M_n = max_(i + j + k = n) a_(i j k)$. The balancing step
$ i gt.eq j + 2 quad ==> quad a_(i - 1 , j + 1 , k) / a_(i j k) = frac(i, j + 1) > 1 $
shows that a maximizing triple has coordinates differing by at most one. Stirling's formula, in each residue class modulo three, gives a constant $C > 0$, independent of $n$, with $M_n lt.eq C \/ n$ for every integer $n gt.eq 1$. For example, along $n = 3 r$ with $r in bb(Z)_(gt.eq 1)$ and $r arrow.r oo$,
$ M_n = frac((3 r) !, 3^(3 r) (r !)^3) tilde.op frac(sqrt(3), 2 pi r) = frac(3 sqrt(3), 2 pi n) . $
Increase $C$ to cover the other two residue classes and small $n$. Choose constants $C' > 0$ and $C'' = C C'$, independent of $n$, so that $4^(- n) binom(2 n, n) lt.eq C' \/ sqrt(n)$ for all integers $n gt.eq 1$. Then
$ sum_(i + j + k = n) a_(i j k)^2 & lt.eq M_n sum_(i + j + k = n) a_(i j k) lt.eq C / n ,\
P^(2 n) (0 , 0) & lt.eq frac(C', sqrt(n)) C / n = C'' n^(- 3 \/ 2) ,\
sum_(k gt.eq 1) P^k (0 , 0) & = sum_(n gt.eq 1) P^(2 n) (0 , 0) < oo . $
Translation invariance gives transience at every state.
]
)
]

== Lecture 7(b): maximal coupling <subsec:7b-maximal>

#definition(title: [Maximal coupling])[
Let $mu , nu$ be probability measures on $(E , cal(E))$, and assume the diagonal $Delta_E = { (z , z) : z in E }$ belongs to $cal(E) times.o cal(E)$. A coupling $eta$ of $mu , nu$ is #emph[maximal]; if
$ eta (Delta_E) gt.eq gamma (Delta_E) #h(2em) upright("for every coupling ") gamma upright(" of ") mu , nu . $
Equivalently, a coupled pair $(U , V)$ with joint law $eta$ maximizes $bb(P) (U = V)$ among all couplings of the prescribed laws.
]

#proposition[
Let $p = (p_z)_(z in S)$ and $q = (q_z)_(z in S)$ be probability mass functions on a countable discrete state space $S$. For every $z in S$, we have
$ sum_z (p_z - r_z) = sum_z (q_z - r_z) = norm(p - q)_(upright(T V)) = 1 - sum_z r_z , $
where $r_z = p_z and q_z$
]

#proof[
Notice $p_z - r_z = (p_z - q_z)_(+)$ and $q_z - r_z = (q_z - p_z)_(+)$. Thus we have $sum_z (p_z - r_z) = sum_z (q_z - r_z)$ and
$ p_z - r_z + q_z - r_z = (p_z - q_z)_(+) + (q_z - p_z)_(+) = lr(|p_z - q_z|) . $
Therefore we have
$ sum_z p_z - r_z & = sum_z q_z - r_z = 1 / 2 sum_z \| p_z - q_z \|\
sum_z r_z & = sum_z (p_z - a_z) = 1 - d . $
]

#theorem(title: [Countable maximal coupling; Lecture 7(b)], label: <thm:maximal>)[
We use notation from the previous proposition. For $d > 0$, define the joint law for all $x , y in S$ by
$ gamma (x , y) = cases(delim: "{", r_x , & x = y ,, frac((p_x - r_x) (q_y - r_y), d) , & x eq.not y) . $
This joint law defines $S$-valued random variables $U , V$ through $bb(P) (U = x , V = y) = gamma (x , y)$ for all $x , y in S$. Their marginals are $p , q$, and $bb(P) (U eq.not V) = d$. For $d = 0$, use $U = V$ with law $p = q$. These couplings are maximal.
]

#proof[
We first verify that $gamma$ gives a valid distribution.

Let $a_x = p_x - r_x$ and $b_y = q_y - r_y$ for all $x , y in S$. For arbitrary $x , y in S$, using $a_x b_x = a_y b_y = 0$,
$ sum_y gamma (x , y) & = r_x + a_x / d sum_(y eq.not x) b_y = r_x + a_x = p_x ,\
sum_x gamma (x , y) & = r_y + b_y / d sum_(x eq.not y) a_x = r_y + b_y = q_y . $
All entries are nonnegative and $sum_(x , y) gamma (x , y) = sum_x p_x = 1$.

Let $(U , V)$ be a pair of rv s.t. their distribution is given by $p , q$ resp. Let $tilde(gamma)$ be another coupling. By lemma #thm-ref(<lem:coupling>);, we have
$ 1 - tilde(gamma) (U = V) gt.eq norm(p - q)_(upright(T V)) ==> tilde(gamma) (U = V) lt.eq 1 - norm(p - q)_(upright(T V)) . $

Consider
$ gamma (U = V) = sum_z r_z = 1 - norm(p - q)_(upright(T V)) gt.eq tilde(gamma) (U = V) . $
by previous proposition. Hence $gamma$ is indeed maximal.
]

#theorem[
Let $p , q$ be pmfs on a countable discrete state space $S$. Then
$ norm(p - q)_(upright(T V)) = min_((U , V) upright(" coupling ") p , q) bb(P) (U eq.not V) . $
]

#proof[
One way inequality is given by lemma #thm-ref(<lem:coupling>);. For the other direction, let $gamma$ be the maximal coupling of $p , q$ given by theorem #thm-ref(<thm:maximal>);. Then we have
$ norm(p - q)_(upright(T V)) & = 1 / 2 sum_z \| p_z - q_z \|\
 & = 1 / 2 sum_z p_z - r_z + q_z - r_z\
 & = 1 - sum_z r_z\
 & = bb(P) (U eq.not V) . $
]

#remark(title: [Sampling a maximal coupling])[
For the pmfs $p , q$ on $S$ in Theorem~#thm-ref(<thm:maximal>);, use its $r_z = min (p_z , q_z)$, $a_z = p_z - r_z$, $b_z = q_z - r_z$ ($z in S$), and $d = norm(p - q)_(upright(T V))$. If $0 < d < 1$, choose between two branches:
$ mat(delim: #none, augment: #(hline: (1,), vline: (1,)), align: #left, upright("probability") , upright("sampling rule") ; 1 - d , #[$U = V = Z , quad bb(P) (Z = z) = r_z \/ (1 - d) ,$] ; d , #[$U tilde.op a \/ d , quad V tilde.op b \/ d , quad upright("independently") .$]) $
Here $a \/ d$ and $b \/ d$ denote the pmfs $(a_z \/ d)_(z in S)$ and $(b_z \/ d)_(z in S)$; the displayed probabilities hold for all $z in S$. The disjoint supports of $a$ and $b$ force disagreement in the second branch. If $d = 1$, use only that branch; if $d = 0$, use $U = V tilde.op p = q$.
]

#example(title: [Bernoulli maximal coupling])[
For any real parameters $0 lt.eq p_1 lt.eq p_2 lt.eq 1$, construct $U tilde.op upright(B e r n o u l l i) (p_1)$ and $V tilde.op upright(B e r n o u l l i) (p_2)$ with the joint probabilities
$ mat(delim: #none, augment: #(hline: (1,), vline: (1,)), "" , V = 0 , V = 1 ; U = 0 , 1 - p_2 , p_2 - p_1 ; U = 1 , 0 , p_1) . $
Then
$ bb(P) (U eq.not V) = p_2 - p_1 = norm(cal(L) (U) - cal(L) (V))_(upright(T V)) . $
This is the earlier monotone coupling and includes $p_1 = p_2$.
]

#pagebreak()

#heading(level: 1, numbering: none)[Source map and clarifications]

The source is Asaf Cohen, #emph[MATH 526, Fall 2026];, lecture PDFs supplied in #raw("Lecture_Notes_export (1).zip"); and #raw("Lecture_Notes_export (2).zip");. The latter contains Lectures 7, 7(b), and 8; Lecture 7 was checked against the existing summary and is not duplicated. The section-to-source map is:

#align(center, table(columns: 3, stroke: none, align: left, inset: (x: 6pt, y: 3pt),
  table.hline(stroke: 0.08em),
  [Lecture], [Source pages], [Material retained],
  table.hline(stroke: 0.05em),
  [6], [2--14], [Periodicity; convergence and ergodic theorems],
  [7], [2--12], [Coupling; total variation; shuffling],
  [7(b)], [2--12], [Lattice recurrence; maximal coupling],
  table.hline(stroke: 0.08em)
))

#strong[Definitions.]; The limiting-distribution, period, and aperiodicity definitions follow Lecture 6, pp. 4, 7, 11\. Coupling and total variation follow Lecture 7, pp. 3, 5, with measurable spaces and measurable events specified explicitly. The agreement event in a general coupling is required to be measurable. Lecture 7(b), pp. 8--12, provides the countable maximal-coupling construction; only the definition of maximality is extended to measurable spaces with measurable diagonal.

Proofs have been written out independently and some arguments reorganized to avoid circular reasoning. The principal clarifications are the aperiodicity requirement for ordinary convergence and the distinction between the first coupling time and the coupon-collection time. New clarifications include the zero-distance case of maximal coupling and balanced integer triples in the three-dimensional walk proof. The numerical social mobility, inventory, and renewal-chain calculations from Lecture 6 are omitted. Standard probability tools used in the added proofs are Tonelli and convergence theorems, the strong law of large numbers, and the first Borel--Cantelli lemma.
