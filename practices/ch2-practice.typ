// Chapter 2 practice problems with solutions. Shared styles are in notes.typ.
#import "notes.typ": *
#show: notes.with(head-right: [Chapter 2: Practice problems])
#set enum(numbering: "(a)")

// Problem and solution blocks (blue = problem, grey = solution).
#let prob-counter = counter("practice-prob")
#let problem(title: none, starred: false, body) = notes-box(bar: exbar, head: exhead, bg: exbg, breakable: false, {
  prob-counter.step()
  block(above: 0pt, below: 0.56em, box-head(exhead,
    [Problem #context prob-counter.display()#if starred [ $star$]], title: title))
  body
})
#let solution(n, body) = notes-box(bar: rembar, head: remhead, bg: rembg, {
  block(above: 0pt, below: 0.56em, sticky: true, box-head(remhead, [Solution #n]))
  body
})

#title-block[Chapter 2: Practice problems (Lectures 6--7(b))]

#strong[Scope.] Periodicity, the limit theorems, coupling and total variation. Result numbers refer to the Chapter~2 notes (e.g. Theorem~6.7 = limit theorems, Lemma~7.8 = eventual positivity, Theorem~7.22 = maximal coupling). Problems marked $star$ are proof-style. Solutions start on a new page after the problems.

#heading(numbering: none)[Problems]

#problem(title: [Four-state chain])[
On $S = {1, 2, 3, 4}$ let
$ P = mat(0, 1, 0, 0; 0, 0, 1, 0; 1/2, 0, 0, 1/2; 1, 0, 0, 0) . $
+ Show the chain is irreducible and find the period of each state.
+ Find the stationary distribution $pi$, and compute $bb(E)_1 T_1$ and $bb(E)_4 T_4$ two ways: from $pi$, and directly from the return paths.
+ Find $lim_(n -> oo) P^n (4, 1)$. Which part of Theorem~6.7 justifies this?
+ You earn \$7 in every time step the chain is at state $4$ and nothing otherwise. What is the long-run average earning per step, almost surely?
+ Determine $I_1 = {n >= 1 : P^n (1, 1) > 0}$ and the smallest $n_1$ with $P^n (1, 1) > 0$ for all $n >= n_1$.
+ The smallest $n$ with $P^n > 0$ entrywise is $n = 10$. Explain why $P^9$ still has a zero entry.
]

#problem(title: [Periodic chain on a cycle])[
Let $(X_n)$ be simple random walk on the cycle $bb(Z)_6 = {0, 1, dots, 5}$: $p(x, x plus.minus 1) = 1/2$ (mod $6$).
+ Find the period and the stationary distribution. Does $P^n (0, 0)$ converge?
+ Compute $lim_n P^(2n) (0, y)$ and $lim_n P^(2n+1) (0, y)$ for every $y$. (Hint: look at $P^2$ restricted to the even states.)
+ Compute $lim_n 1/n sum_(j=1)^n P^j (0, 0)$ and the almost-sure long-run fraction of time spent at $0$. Which hypotheses of Theorem~6.7 are you using?
]

#problem(title: [Cyclic classes], starred: true)[
Let $P$ be irreducible with period $d$. Fix $x, y in S$. Show that all $n$ with $P^n (x, y) > 0$ are congruent modulo $d$.
]

#problem(title: [Exact convergence rate for two states])[
Let $P = mat(1 - a, a; b, 1 - b)$ with $a, b in [0, 1]$, $a + b > 0$, and put $lambda = 1 - a - b$.
+ Show that $P^n (1, 1) = b/(a + b) + a/(a + b) lambda^n$.
+ Compute $norm(P^n (1, dot) - pi)_"TV"$ exactly.
+ For which $(a, b)$ does $P^n (1, dot)$ fail to converge? Relate this to periodicity.
]

#problem(title: [Total variation is non-increasing], starred: true)[
Let $mu, nu$ be probability distributions on a countable $S$ and $P$ a transition matrix.
+ Show $norm(mu P - nu P)_"TV" <= norm(mu - nu)_"TV"$, once using the formula $1/2 sum abs(dot)$ and once using a coupling.
+ Deduce that if $pi$ is stationary, then $n |-> norm(P^n (x, dot) - pi)_"TV"$ is non-increasing.
]

#problem(title: [Limiting $==>$ unique stationary, and any initial law], starred: true)[
+ Suppose $q$ is a limiting distribution for $P$ on countable $S$. Show that every stationary distribution $pi$ equals $q$. (Use DCT on $pi(y) = sum_x pi(x) P^n (x, y)$.)
+ Suppose $P$ is irreducible, aperiodic and has a stationary $pi$. Show that $norm(mu P^n - pi)_"TV" -> 0$ for every initial distribution $mu$.
]

#problem(title: [Eventual positivity with a self-loop], starred: true)[
Let $P$ be irreducible on a finite $S$ with $abs(S) = k$, and suppose $p(z, z) > 0$ for some $z$. Show $P^n (x, y) > 0$ for all $x, y$ and all $n >= 2k - 2$. Compare with Problem~1(f): why doesn't this bound apply there?
]

#problem(title: [Aperiodicity in the coupling proof])[
Let $P = mat(0, 1; 1, 0)$.
+ Write down the product chain $Q((u, v), (u', v')) = p(u, u') p(v, v')$ on ${1, 2}^2$ and show it is not irreducible.
+ Run two independent copies from $(X_0, Y_0) = (1, 2)$. Show the meeting time is $tau = oo$ almost surely.
+ Point to the exact step in the proof of Theorem~6.7(1) that breaks.
]

#problem(title: [TV and a maximal coupling])[
Let $1 <= m < n$, $mu = "Unif"{1, dots, m}$ and $nu = "Unif"{1, dots, n}$.
+ Compute $norm(mu - nu)_"TV"$.
+ Construct a coupling $(U, V)$ with $bb(P)(U != V) = norm(mu - nu)_"TV"$.
]

#problem(title: [Maximal coupling by the formula])[
Let $p = (1/2, 1/3, 1/6)$ and $q = (1/3, 1/3, 1/3)$ on ${1, 2, 3}$. Compute $norm(p - q)_"TV"$ and write the $3 times 3$ joint table $gamma$ of the maximal coupling from Theorem~7.22. Check both marginals.
]

#problem(title: [Poisson approximation (Le Cam)], starred: true)[
+ Show $norm("Ber"(p) - "Pois"(p))_"TV" = p(1 - e^(-p)) <= p^2$ for $p in [0, 1]$.
+ Using (a) and a coupling, show $norm("Bin"(n, p) - "Pois"(n p))_"TV" <= n p^2$.
+ Give the bound for $n = 100$, $p = 0.02$.
]

#problem(title: [Biased walk on $bb(Z)$])[
Let $p(x, x + 1) = p$ and $p(x, x - 1) = q = 1 - p$ on $bb(Z)$, with $p in (0, 1)$.
+ Find $P^(2n) (0, 0)$ and its asymptotics using $binom(2n, n) tilde 4^n \/ sqrt(pi n)$.
+ Decide recurrence or transience for each $p$.
+ Is there a stationary distribution when $p = 1/2$? (Use Theorem~6.7(3) and translation invariance.)
]

#problem(title: [Random-to-top, numbers])[
Take $m = 52$ cards and $epsilon = 0.01$; $H_52 approx 4.538$.
+ How many steps $n$ guarantee $norm(P^n (x, dot) - pi)_"TV" <= epsilon$ via the Markov-inequality bound $m H_m \/ n$? Via the union bound $m e^(-n\/m)$?
+ ($star$ Lower bound.) Show that for $n <= m - 2$, with $j = m - n$,
  $ norm(P^n (x, dot) - pi)_"TV" >= 1 - 1/(j!) . $
  (Hint: which cards can be at the bottom after $n$ steps, and in what order?) What does this give for $n = 50$ and $n = 40$?
]

#problem(title: [True or false; justify briefly])[
+ If $P$ is irreducible on a finite set, then $P^n$ converges entrywise.
+ A stationary distribution is always a limiting distribution.
+ If $x <-> y$ then $d(x) = d(y)$.
+ If $pi$ is stationary and $pi(y) = 0$, then $y$ is transient.
+ For a finite irreducible chain, $1/n sum_(j=1)^n P^j (x, y)$ converges.
+ $norm(mu - nu)_"TV" = sum_z abs(mu(z) - nu(z))$.
+ An irreducible chain with $p(x, x) > 0$ for at least one $x$ is aperiodic.
+ If $U tilde mu$, $V tilde nu$ and $bb(P)(U != V) = 0.1$, then $norm(mu - nu)_"TV" = 0.1$.
+ The ergodic theorem (Theorem~6.7(4)) requires aperiodicity.
]

#pagebreak()

#heading(numbering: none)[Solutions]

#solution(1)[
(a) $1 -> 2 -> 3 -> 1$ and $3 -> 4 -> 1$, so every state reaches every other: the chain is irreducible. Return loops at $1$ have lengths $3$ ($1 -> 2 -> 3 -> 1$) and $4$ ($1 -> 2 -> 3 -> 4 -> 1$), and $gcd(3, 4) = 1$. Period is a class property (Lemma~6.4), so every state has period $1$.

(b) $pi P = pi$ reads $pi_1 = 1/2 pi_3 + pi_4$, $pi_2 = pi_1$, $pi_3 = pi_2$, $pi_4 = 1/2 pi_3$. Take $pi_1 = pi_2 = pi_3 = 2$, $pi_4 = 1$ (check: $pi_1 = 1 + 1$) and normalise:
$ pi = (2/7, 2/7, 2/7, 1/7), quad bb(E)_1 T_1 = 1/pi_1 = 7/2, quad bb(E)_4 T_4 = 1/pi_4 = 7 . $
Directly: from $1$ the return takes $3$ or $4$ steps with probability $1/2$ each, so $bb(E)_1 T_1 = 7/2$. From $4$: go $4 -> 1 -> 2 -> 3$ ($3$ steps). At $3$, either go to $4$ (one more step), or go to $1$ and repeat the loop $3 -> 1 -> 2 -> 3$. The number $G$ of such loops is geometric on ${0, 1, dots}$ with success probability $1/2$, so $bb(E) G = 1$ and $bb(E)_4 T_4 = 3 + 1 + 3 bb(E) G = 7$.

(c) Irreducible, aperiodic and $pi$ exists, so Theorem~6.7(1) gives $P^n (4, 1) -> pi_1 = 2/7$.

(d) Theorem~6.7(4) with $f = 7 dot upright(bold(1))_({4})$: the average tends to $sum_z f(z) pi(z) = 7 dot 1/7 = 1$ dollar per step.

(e) Every return to $1$ is a concatenation of $3$-loops and $4$-loops, so
$ I_1 = {3a + 4b : a, b >= 0, med a + b >= 1} = {3, 4, 6, 7, 8, 9, dots} . $
The integers $1, 2, 5$ are not of this form, and every $n >= 6$ is ($6 = 3 + 3$, $7 = 3 + 4$, $8 = 4 + 4$, then add $3$'s). So $n_1 = 6$.

(f) A return to $4$ is the path $4 -> 1 -> 2 -> 3 -> 4$ (length $4$) with some number of $3$- or $4$-loops through $1$ inserted, so $I_4 = {4 + 3a + 4b} = {4, 7, 8, 10, 11, dots}$. Since $9 - 4 = 5$ is not of the form $3a + 4b$, $P^9 (4, 4) = 0$.
]

#solution(2)[
(a) Each step changes parity, and $0 -> 1 -> 0$ has length $2$, so $d = 2$. $P$ is doubly stochastic, so $pi equiv 1/6$ (unique by irreducibility). $P^n (0, 0) = 0$ for odd $n$, but by (b) $P^(2n) (0, 0) -> 1/3$, so $P^n (0, 0)$ does not converge.

(b) By parity (or Problem~3), $P^(2n) (0, y) = 0$ for odd $y$ and $P^(2n+1) (0, y) = 0$ for even $y$. The two-step chain on $E = {0, 2, 4}$ has $P^2 (x, x) = 1/2$ and $P^2 (x, x plus.minus 2) = 1/4$: it is irreducible, aperiodic (self-loop) and doubly stochastic. So its stationary law is uniform on $E$, and Theorem~6.7(1) gives $P^(2n) (0, y) -> 1/3$ for $y in E$. Then $P^(2n+1) (0, y) = sum_z p(0, z) P^(2n) (z, y) -> 1/3$ for odd $y$, by the same argument on the odd class. So
$ lim_n P^(2n) (0, dot) = (1/3, 0, 1/3, 0, 1/3, 0), quad lim_n P^(2n+1) (0, dot) = (0, 1/3, 0, 1/3, 0, 1/3) . $

(c) The Cesàro limit is the average of $1/3$ and $0$, namely $1/6 = pi(0)$, consistent with Theorem~6.7(5). The almost-sure fraction of time at $0$ is $1 \/ bb(E)_0 T_0 = pi(0) = 1/6$ by Theorem~6.7(2),(3). These parts need only I + R or I + S, not aperiodicity.
]

#solution(3)[
Choose $m >= 1$ with $P^m (y, x) > 0$. If $P^(n_1) (x, y) > 0$ and $P^(n_2) (x, y) > 0$, then by Chapman--Kolmogorov
$ P^(n_i + m) (x, x) >= P^(n_i) (x, y) P^m (y, x) > 0 quad (i = 1, 2), $
so $n_1 + m, n_2 + m in I_x$. Both are divisible by $d = d(x)$, hence $d divides n_1 - n_2$.
]

#solution(4)[
(a) Let $u_n = P^n (1, 1)$. Then $u_(n+1) = u_n (1 - a) + (1 - u_n) b = b + lambda u_n$ with $u_0 = 1$. The fixed point is $u^* = b/(a + b)$, and $u_n - u^* = lambda^n (1 - u^*) = a/(a + b) lambda^n$.

(b) $pi = (b/(a+b), a/(a+b))$ and $P^n (1, dot) - pi = a/(a+b) lambda^n (1, -1)$, so
$ norm(P^n (1, dot) - pi)_"TV" = 1/2 dot 2 dot a/(a + b) abs(lambda)^n = a/(a + b) abs(1 - a - b)^n . $

(c) Since $a + b > 0$, $abs(lambda) < 1$ unless $lambda = -1$, i.e. $a = b = 1$. That is the flip chain, which is irreducible with period $2$; $P^n (1, 1)$ alternates between $0$ and $1$. (If $a = b = 0$, then $P = I$, which is reducible and every distribution is stationary.)
]

#solution(5)[
(a) _Formula._ By Tonelli,
$ norm(mu P - nu P)_"TV" = 1/2 sum_y abs(sum_x (mu(x) - nu(x)) p(x, y)) <= 1/2 sum_x abs(mu(x) - nu(x)) sum_y p(x, y) = norm(mu - nu)_"TV" . $
_Coupling._ Take a maximal coupling $(X_0, Y_0)$ of $mu, nu$, i.e. one that maximises $bb(P)(X_0 = Y_0)$, equivalently minimises $bb(P)(X_0 != Y_0)$. By Theorems~7.22--7.23 it satisfies $bb(P)(X_0 != Y_0) = norm(mu - nu)_"TV"$. If $X_0 = Y_0$, take one step together; otherwise step independently. Then $X_1 tilde mu P$, $Y_1 tilde nu P$, and ${X_1 != Y_1} subset.eq {X_0 != Y_0}$. So
$ norm(mu P - nu P)_"TV" <= bb(P)(X_1 != Y_1) <= bb(P)(X_0 != Y_0) = norm(mu - nu)_"TV" . $
The first inequality is the coupling inequality (Lemma~7.5); the last equality is maximality.

(b) Apply (a) with $mu = P^n (x, dot)$ and $nu = pi$, using $pi P = pi$:
$ norm(P^(n+1) (x, dot) - pi)_"TV" = norm(P^n (x, dot) P - pi P)_"TV" <= norm(P^n (x, dot) - pi)_"TV" . $
]

#solution(6)[
(a) Fix $y$. For every $n$, $pi(y) = (pi P^n)(y) = sum_x pi(x) P^n (x, y)$. The summand tends to $pi(x) q(y)$ and is dominated by $pi(x)$, with $sum_x pi(x) = 1 < oo$. DCT (counting measure on $S$) gives $pi(y) = sum_x pi(x) q(y) = q(y)$.

(b) Since $pi = sum_x mu(x) pi$,
$ norm(mu P^n - pi)_"TV" = 1/2 sum_y abs(sum_x mu(x) (P^n (x, y) - pi(y))) <= sum_x mu(x) norm(P^n (x, dot) - pi)_"TV" . $
Each term tends to $0$ by Theorem~6.7(1) and is dominated by $mu(x)$; DCT gives the limit $0$.
]

#solution(7)[
Fix $x, y$. By irreducibility there are paths $x -> z$ of length $ell_1 <= k - 1$ and $z -> y$ of length $ell_2 <= k - 1$: a shortest path visits distinct states, and the length is $0$ if the endpoints coincide. For $n >= 2k - 2$, put $s = n - ell_1 - ell_2 >= 0$ and insert $s$ self-loops at $z$:
$ P^n (x, y) >= P^(ell_1) (x, z) dot p(z, z)^s dot P^(ell_2) (z, y) > 0 . $
In Problem~1 no state has a self-loop, so the argument does not apply; there the threshold is $10 > 2 dot 4 - 2 = 6$.
]

#solution(8)[
(a) $Q$ moves $(1, 1) <-> (2, 2)$ and $(1, 2) <-> (2, 1)$ deterministically. There are two closed classes, the diagonal ${(1, 1), (2, 2)}$ and the off-diagonal ${(1, 2), (2, 1)}$, so $Q$ is not irreducible.

(b) From $(1, 2)$ the pair alternates $(1, 2), (2, 1), (1, 2), dots$ and never reaches the diagonal, so $tau = oo$.

(c) Step 1 of the proof uses aperiodicity (Lemma~7.8 and Corollary~7.9) to show that $Q$ is irreducible. That is what makes the recurrent state $(a, a)$ reachable from every starting pair, giving $bb(P)(tau < oo) = 1$. Here that step fails. Consistently, $norm(P^n (1, dot) - pi)_"TV" = 1/2$ for all $n$.
]

#solution(9)[
(a) $sum_z min(mu(z), nu(z)) = m dot 1/n$, so $norm(mu - nu)_"TV" = 1 - m/n$.

(b) Let $V tilde "Unif"{1, dots, n}$. If $V <= m$ put $U = V$; otherwise draw $U tilde "Unif"{1, dots, m}$ independently. Then for $u <= m$,
$ bb(P)(U = u) = 1/n + (n - m)/n dot 1/m = 1/m , $
so $U tilde mu$, and $bb(P)(U != V) = bb(P)(V > m) = 1 - m/n$. By the coupling inequality (Lemma~7.5) this is optimal.
]

#solution(10)[
$r = min(p, q) = (1/3, 1/3, 1/6)$, so $sum r = 5/6$ and $d = norm(p - q)_"TV" = 1/6$. The excesses are $a = p - r = (1/6, 0, 0)$ and $b = q - r = (0, 0, 1/6)$. Off the diagonal $gamma(x, y) = a_x b_y \/ d$, which is nonzero only at $(1, 3)$: $gamma(1, 3) = (1/6 dot 1/6)/(1/6) = 1/6$. So
$ gamma = mat(1/3, 0, 1/6; 0, 1/3, 0; 0, 0, 1/6) . $
The row sums are $(1/2, 1/3, 1/6) = p$, the column sums are $(1/3, 1/3, 1/3) = q$, and $bb(P)(U != V) = 1/6 = d$.
]

#solution(11)[
(a) Compute the overlaps. At $0$: $min(1 - p, e^(-p)) = 1 - p$, since $e^(-p) >= 1 - p$. At $1$: $min(p, p e^(-p)) = p e^(-p)$. At $k >= 2$, $"Ber"(p)$ has no mass. Hence
$ norm("Ber"(p) - "Pois"(p))_"TV" = 1 - (1 - p) - p e^(-p) = p(1 - e^(-p)) <= p dot p , $
using $1 - e^(-p) <= p$.

(b) Take independent pairs $(U_i, V_i)_(i = 1)^n$, each a maximal coupling of $"Ber"(p)$ and $"Pois"(p)$. Then $sum_i U_i tilde "Bin"(n, p)$ and $sum_i V_i tilde "Pois"(n p)$, since independent Poissons add. The coupling inequality and a union bound give
$ norm("Bin"(n, p) - "Pois"(n p))_"TV" <= bb(P)(sum_i U_i != sum_i V_i) <= sum_i bb(P)(U_i != V_i) <= n p^2 . $

(c) $100 dot 0.02^2 = 0.04$.
]

#solution(12)[
(a) A return in $2n$ steps needs $n$ up-steps and $n$ down-steps, so
$ P^(2n) (0, 0) = binom(2n, n) (p q)^n tilde (4 p q)^n / sqrt(pi n) , $
and odd-step returns are impossible (period $2$).

(b) $4 p q = 1 - (p - q)^2 <= 1$, with equality iff $p = 1/2$. If $p != 1/2$, the terms decay geometrically, so $sum_n P^n (0, 0) < oo$ and the walk is transient. If $p = 1/2$, the terms are $tilde 1 \/ sqrt(pi n)$, whose sum diverges, so the walk is recurrent. Irreducibility extends this to every state.

(c) No. A stationary $pi$ would give $pi(x) = 1 \/ bb(E)_x T_x$ for all $x$ (Theorem~6.7(3)). Translation invariance makes $bb(E)_x T_x$ the same for every $x$, so $pi$ would be constant on $bb(Z)$, which cannot sum to $1$. (In Lecture~9 terms, the walk is null recurrent.)
]

#solution(13)[
(a) Markov bound: $m H_m \/ n <= 0.01$ needs $n >= 52 dot 4.538 \/ 0.01 approx 23 thin 598$. Union bound: $m e^(-n\/m) <= 0.01$ needs $n >= m(log m + log 100) approx 52 (3.951 + 4.605) approx 444.9$, so $n = 445$ suffices.

(b) After $n$ steps at most $n$ distinct cards have been selected, so at least $j = m - n$ cards are unselected. Unselected cards sit at the bottom of the deck in their original relative order. Let $A$ be the event that the bottom $j$ cards appear in the same relative order as in $x$. Then $P^n (x, A) = 1$. Under $pi$, the order of the bottom $j$ cards is uniform among the $j!$ orders, so $pi(A) = 1 \/ j!$. Hence
$ norm(P^n (x, dot) - pi)_"TV" >= P^n (x, A) - pi(A) = 1 - 1/(j!) . $
For $n = 50$ ($j = 2$) this is at least $1/2$. For $n = 40$ ($j = 12$) it is at least $1 - 1\/12! approx 1 - 2.1 times 10^(-9)$. So roughly $m$ steps are necessary, while $m log m$ steps suffice.
]

#solution(14)[
+ False: the flip chain has $P^(2n) = I$ and $P^(2n+1) = P$.
+ False: in the same example $pi = (1/2, 1/2)$ is stationary but there is no limit.
+ True: Lemma~6.4.
+ False: take $P = I$ on ${1, 2}$ and $pi = delta_1$. Then $pi(2) = 0$, but $2$ is absorbing, hence recurrent. (For an irreducible chain the statement is vacuous, because then $pi > 0$.)
+ True: Theorem~6.7(5); a finite irreducible chain has I + S.
+ False: $norm(mu - nu)_"TV" = 1/2 sum_z abs(mu(z) - nu(z))$.
+ True: $1 in I_x$ gives $d(x) = 1$, and period is a class property.
+ False: the coupling inequality only gives $norm(mu - nu)_"TV" <= 0.1$, with equality only for a maximal coupling. For example, $mu = nu$ can be coupled to disagree.
+ False: it needs only I + S.
]
