// Chapter 3 practice problems with solutions. Shared styles are in notes.typ.
#import "notes.typ": *
#show: notes.with(head-right: [Chapter 3: Practice problems])
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

#title-block[Chapter 3: Practice problems (Lectures 8--9)]

#strong[Scope.] Exit probabilities and expected exit times, the matrix form $(I - Q)^(-1)$, gambler's ruin, and countable state spaces (positive, null recurrence and transience). Notation follows the notes: $V_A = inf{n >= 0 : X_n in A}$ counts time $0$, $T_y = inf{n >= 1 : X_n = y}$ does not. A $star$ on a problem or a part means it is harder than the Fall 2026 practice midterm; unmarked problems are at about exam level. Solutions start on a new page after the problems.

#heading(numbering: none)[Problems]

#problem(title: [Random walk on a graph])[
A walker moves on the graph with vertices ${1, dots, 5}$ and edges
$ {1, 2}, {1, 3}, {2, 3}, {2, 4}, {3, 4}, {3, 5}, {4, 5}, $
choosing a neighbour uniformly at random at each step. It starts at $1$.
+ Find the probability of reaching $5$ before $4$.
+ Find the expected number of steps until it first reaches ${4, 5}$.
+ Find the expected number of steps to return to $1$. Use a method different from (a)--(b).
+ A step from $i$ to $j$ costs $|i - j|$. Write (do not solve) a system of equations for the expected total cost until the first arrival at $5$, including the final step.
]

#problem(title: [Gambler's ruin numbers])[
+ $N = 5$, $p = 0.4$, initial capital $x = 2$. Find the probability of reaching $5$ before $0$ and the expected duration.
+ At roulette ($p = 18/38$) you start with \$10 and stop at \$20 or \$0, betting \$1 each time. What is the probability of reaching \$20? Compare with a fair game.
+ Same game, but you are allowed to keep playing forever if you never hit \$0 (no upper target). What is the probability you are never ruined?
]

#problem(title: [Gambler's ruin with ties])[
On ${0, dots, N}$ with $0$, $N$ absorbing, let $p(x, x + 1) = p$, $p(x, x - 1) = q$, $p(x, x) = s$ for $0 < x < N$, where $p, q > 0$ and $p + q + s = 1$.
+ Show that $h(x) = bb(P)_x (V_N < V_0)$ is the same as for the walk without ties with up-probability $p' = p/(p + q)$.
+ Show that the expected duration is $g(x) = g'(x) \/ (1 - s)$, where $g'$ is the duration for the walk without ties with up-probability $p'$.
+ Evaluate both for $N = 4$, $x = 2$, $p = q = 1/4$, $s = 1/2$.
]

#problem(title: [Fundamental matrix: a two-year program])[
A student in year 1 repeats the year with probability $0.1$, advances to year 2 with probability $0.8$ and drops out with probability $0.1$. In year 2 the student repeats with probability $0.1$, graduates with probability $0.85$ and drops out with probability $0.05$. Graduate and Dropout are absorbing.
+ Write $Q$ (transient part) and compute $F = (I - Q)^(-1)$. Interpret each entry.
+ Starting in year 1, find the expected number of years in the program.
+ Starting in year 1, find the probability of graduating.
]

#problem(title: [Waiting for patterns])[
A coin shows heads with probability $p$; flips are independent.
+ For $p = 1/2$, find the expected number of flips until $H H$ first appears, and until $H T$ first appears.
+ For general $p$, find the probability that $H H$ appears before $T T$. Evaluate at $p = 2/3$.
]

#problem(title: [Reflection at zero])[
Simple symmetric walk on ${0, 1, dots, N}$ with $p(0, 1) = 1$ (reflection at $0$) and $N$ absorbing.
+ Write the equations for $g(x) = bb(E)_x V_N$.
+ Verify that $g(x) = N^2 - x^2$ solves them, and explain why this is the answer.
+ Compare $g(0)$ with the expected duration $x(N - x)$ of the fair gambler's ruin. Which is larger at $x = N\/2$, and why?
]

#problem(title: [A discrete queue])[
On $S = bb(Z)_(>= 0)$ let $p(i, i + 1) = p$ for $i >= 0$, $p(i, i - 1) = q$ for $i >= 1$, $p(i, i) = 1 - p - q$ for $i >= 1$, and $p(0, 0) = 1 - p$, where $p, q > 0$ and $p + q <= 1$.
+ Show the chain is irreducible and aperiodic.
+ Find all $p, q$ for which a stationary distribution exists, and find it.
+ In that case, find $bb(E)_0 T_0$ and $lim_n P^n (5, 0)$.
+ For $p = q$, is the chain transient, null recurrent or positive recurrent?
]

#problem(title: [Renewal chains: three behaviours])[
On $S = bb(Z)_(>= 0)$ let $p(i, i + 1) = a_i$ and $p(i, 0) = 1 - a_i$, with $0 < a_i < 1$.
+ Show that $bb(P)_0 (T_0 > k) = a_0 a_1 dots.c a_(k-1)$ for $k >= 1$.
+ Classify the chain (transient / null recurrent / positive recurrent) for
  $ ("i") med a_i = 1/(i + 2), quad ("ii") med a_i = (i + 1)/(i + 2), quad ("iii") med a_i = 1 - 1/(i + 2)^2 . $
+ In case (i), find $bb(E)_0 T_0$ and the stationary distribution.
+ $star$ In case (iii), find $bb(P)_0 (T_0 = oo)$ exactly.
]

#problem(title: [Mean hitting time on a half-line], starred: true)[
Let $p < q$, $p + q = 1$, and consider the walk on $bb(Z)_(>= 0)$ with $p(x, x + 1) = p$, $p(x, x - 1) = q$ for $x >= 1$, and $0$ absorbing.
+ Using the gambler's ruin duration $g_N (x) = bb(E)_x (V_0 and V_N)$ and monotone convergence, show $bb(E)_x V_0 = x/(q - p)$.
+ What goes wrong when $p = q$?
]

#problem(title: [True or false; justify briefly])[
+ In an irreducible chain, if one state is null recurrent then all states are.
+ An irreducible recurrent chain on a countably infinite space always has a stationary distribution.
+ If $bb(E)_x T_x < oo$ for one state $x$ of an irreducible chain, a stationary distribution exists.
+ On a finite $S$, $h(x) = bb(P)_x (V_A < V_B)$ is always the unique solution of the boundary-value equations.
+ For simple symmetric random walk on $bb(Z)$, $bb(E)_1 V_0 < oo$.
+ A transient state $y$ has $bb(E)_y T_y = oo$.
+ On a finite $S$, if every state of $D = S without A$ can reach $A$, then $I - Q$ is invertible, where $Q = P|_(D times D)$.
]

#pagebreak()

#heading(numbering: none)[Solutions]

#solution(1)[
Degrees: $d(1) = 2$, $d(2) = 3$, $d(3) = 4$, $d(4) = 3$, $d(5) = 2$; $2|E| = 14$.

(a) $h(x) = bb(P)_x (V_5 < V_4)$: $h(5) = 1$, $h(4) = 0$ and
$ h(1) = (h(2) + h(3))/2, quad h(2) = (h(1) + h(3) + 0)/3, quad h(3) = (h(1) + h(2) + 0 + 1)/4 . $
The solution is $h(1) = 4/13$, $h(2) = 3/13$, $h(3) = 5/13$. So the answer is $4/13$.

(b) $g(x) = bb(E)_x V_({4, 5})$: $g(4) = g(5) = 0$ and
$ g(1) = 1 + (g(2) + g(3))/2, quad g(2) = 1 + (g(1) + g(3))/3, quad g(3) = 1 + (g(1) + g(2))/4 , $
giving $g(1) = 53/13$, $g(2) = 43/13$, $g(3) = 37/13$. So the answer is $53/13 approx 4.08$.

(c) The graph is connected, so the walk is irreducible with $pi(u) = d(u)\/(2|E|)$. By Theorem~6.7(3), $bb(E)_1 T_1 = 1\/pi(1) = 14/2 = 7$.

(d) Let $c(x)$ be the expected cost until $V_5$. Then $c(5) = 0$, and for $x != 5$, conditioning on the first step,
$ c(x) = sum_(y tilde x) 1/d(x) (|x - y| + c(y)) . $
Explicitly:
$ c(1) &= 1/2 (1 + c(2)) + 1/2 (2 + c(3)), \
c(2) &= 1/3 (1 + c(1)) + 1/3 (1 + c(3)) + 1/3 (2 + c(4)), \
c(3) &= 1/4 (2 + c(1)) + 1/4 (1 + c(2)) + 1/4 (1 + c(4)) + 1/4 (2 + 0), \
c(4) &= 1/3 (2 + c(2)) + 1/3 (1 + c(3)) + 1/3 (1 + 0) . $
]

#solution(2)[
(a) $r = q/p = 1.5$. $h(2) = (1 - r^2)/(1 - r^5) = 40/211 approx 0.190$ and $g(2) = (2 - 5 h(2))/(q - p) = 1110/211 approx 5.26$ bets.

(b) $r = 20/18 = 10/9$: $h(10) = (1 - r^(10))/(1 - r^(20)) approx 0.259$. In a fair game it is $10/20 = 0.5$: a small house edge halves your chance.

(c) With no upper target, the probability of never being ruined is $lim_(N -> oo) h_N (10)$. Since $p < q$, this limit is $0$ (Proposition~8.17): ruin is certain.
]

#solution(3)[
(a) For $0 < x < N$, $h(x) = p h(x + 1) + q h(x - 1) + s h(x)$, i.e. $(1 - s) h(x) = p h(x + 1) + q h(x - 1)$. Divide by $1 - s = p + q$:
$ h(x) = p' h(x + 1) + q' h(x - 1), quad p' = p/(p + q), med q' = q/(p + q) . $
These are the equations without ties, with the same boundary values; by uniqueness $h$ is the no-ties answer, with ratio $q'/p' = q/p$.

(b) $(1 - s) g(x) = 1 + p g(x + 1) + q g(x - 1)$. Multiply $g' (x) = 1 + p' g'(x + 1) + q' g'(x - 1)$ by $1/(1 - s)$ to see that $g'/(1 - s)$ solves the same equations with zero boundary values; by uniqueness $g = g'/(1 - s)$. (Each "real" move takes on average $1/(1 - s)$ steps.)

(c) $p' = q' = 1/2$, so $h(2) = 2/4 = 1/2$ and $g(2) = 2 (4 - 2) \/ (1/2) = 8$.
]

#solution(4)[
(a) With transient states (year 1, year 2),
$ Q = mat(0.1, 0.8; 0, 0.1), quad I - Q = mat(0.9, -0.8; 0, 0.9), quad F = (I - Q)^(-1) = mat(10/9, 80/81; 0, 10/9) . $
$F(x, y)$ is the expected number of years spent in year $y$ starting from year $x$ (counting the starting year). For example $F(1, 2) = 80/81$: a year-1 student spends on average $80/81$ years in year 2.

(b) $g = F bold(1)$: $g(1) = 10/9 + 80/81 = 170/81 approx 2.10$ years.

(c) Let $b = (0, 0.85)^top$ be the one-step graduation probabilities. Then $h = F b$, so $h(1) = 80/81 dot 0.85 = 68/81 approx 0.840$. (From year 2: $h(2) = 10/9 dot 0.85 = 17/18$.)
]

#solution(5)[
(a) Track the relevant suffix. For $H H$ with states $emptyset$ (start or last flip $T$) and $H$: $a = 1 + a/2 + b/2$ and $b = 1 + a/2$, where $a, b$ are the expected remaining flips. Hence $a = 6$. For $H T$: $a = 1 + a/2 + b/2$ and $b = 1 + b/2$ (from $H$, a $T$ finishes and an $H$ keeps us at $H$), so $b = 2$ and $a = 4$. The answers are $6$ and $4$: $H T$ comes sooner because a failed attempt at $H T$ (another $H$) does not lose progress.

(b) States: last flip $H$ or $T$. Let $u = bb(P)(H H "first" | "last" = H)$ and $v = bb(P)(H H "first" | "last" = T)$. Then
$ u = p + q v, quad v = p u quad ==> quad u = p/(1 - p q), quad v = p^2/(1 - p q) . $
From the start, $p u + q v = (p^2 (1 + q))/(1 - p q)$. At $p = 2/3$: $(4/9 dot 4/3)/(7/9) = 16/21$.
]

#solution(6)[
(a) $g(N) = 0$, $g(0) = 1 + g(1)$, and $g(x) = 1 + (g(x + 1) + g(x - 1))/2$ for $0 < x < N$.

(b) For $0 < x < N$: $1 + ((N^2 - (x + 1)^2) + (N^2 - (x - 1)^2))/2 = 1 + N^2 - x^2 - 1 = N^2 - x^2$. At $0$: $1 + N^2 - 1 = N^2$. At $N$: $0$. Every state reaches $N$, so the solution is unique (Theorem~8.11) and $g(x) = N^2 - x^2$.

(c) At $x = N\/2$: $N^2 - N^2/4 = 3N^2\/4$ versus $N^2\/4$. Reflection removes the "escape" at $0$, so the walk must eventually go all the way to $N$: three times as long.
]

#solution(7)[
(a) Neighbours communicate in both directions, so the chain is irreducible; $p(0, 0) = 1 - p > 0$ gives aperiodicity.

(b) Detailed balance $pi(i) p = pi(i + 1) q$ gives $pi(i) = pi(0) (p/q)^i$. This is normalisable iff $p < q$, and then $pi(i) = (1 - p/q)(p/q)^i$. Since the chain is irreducible, a stationary distribution exists iff it is positive recurrent; for $p >= q$, the same truncation argument as for the reflecting walk (Theorem~9.5) shows it is null recurrent ($p = q$) or transient ($p > q$), so none exists.

(c) $bb(E)_0 T_0 = 1\/pi(0) = q/(q - p)$, and by Theorem~6.7(1), $lim_n P^n (5, 0) = pi(0) = 1 - p/q$.

(d) Null recurrent: the holding probabilities only slow the walk down (each real move takes a geometric number of steps), so the embedded walk is the symmetric reflecting walk of Theorem~9.5(b).
]

#solution(8)[
(a) Starting at $0$, $T_0 > k$ iff the first $k$ steps are all "up", i.e. $0 -> 1 -> dots.c -> k$, which has probability $a_0 a_1 dots.c a_(k-1)$.

(b) Recall $bb(P)_0 (T_0 = oo) = lim_k bb(P)_0 (T_0 > k)$ and $bb(E)_0 T_0 = sum_(k >= 0) bb(P)_0 (T_0 > k)$.
- (i) $bb(P)_0 (T_0 > k) = 1/(k + 1)! -> 0$ and $sum_k 1/(k + 1)! = e - 1 < oo$: positive recurrent.
- (ii) $bb(P)_0 (T_0 > k) = 1/2 dot 2/3 dots.c k/(k + 1) = 1/(k + 1) -> 0$, but $sum_k 1/(k + 1) = oo$: null recurrent.
- (iii) $bb(P)_0 (T_0 > k) = product_(j = 2)^(k + 1) (1 - 1/j^2) -> 1/2 > 0$ (see (d)): transient.
The chain is irreducible, so the type of $0$ is the type of every state.

(c) $bb(E)_0 T_0 = e - 1$. Using the cycle measure, $pi(i) prop bb(P)_0 (T_0 > i) = 1/(i + 1)!$ (the only possible visit to $i$ in an excursion is at time $i$), so
$ pi(i) = 1/((e - 1)(i + 1)!) quad (i >= 0) . $
Check: $pi(0) = 1/(e - 1) = 1 \/ bb(E)_0 T_0$.

(d) Telescoping, $product_(j = 2)^n (1 - 1/j^2) = product_(j = 2)^n ((j - 1)(j + 1))/j^2 = (n + 1)/(2n) -> 1/2$. So $bb(P)_0 (T_0 = oo) = 1/2$.
]

#solution(9)[
(a) For $N > x$, the walk agrees with gambler's ruin on ${0, dots, N}$ until $V_0 and V_N$, so $bb(E)_x (V_0 and V_N) = g_N (x) = (x - N h_N (x))/(q - p)$, where $h_N (x) = (r^x - 1)/(r^N - 1)$ and $r = q/p > 1$. Since $N h_N (x) -> 0$, $g_N (x) -> x/(q - p)$. Upward steps have size one, so $V_N >= N - x -> oo$, hence $V_0 and V_N arrow.t V_0$, and monotone convergence gives $bb(E)_x V_0 = lim_N g_N (x) = x/(q - p)$.

(b) For $p = q$, $g_N (x) = x(N - x) -> oo$, so $bb(E)_x V_0 = oo$ even though $V_0 < oo$ almost surely: this is null recurrence.
]

#solution(10)[
+ True: Corollary~9.7 (trichotomy).
+ False: simple symmetric random walk on $bb(Z)$ is irreducible and recurrent but null recurrent, so it has no stationary distribution.
+ True: Theorem~9.6, $(1) => (3)$, via the cycle measure.
+ False: with an inaccessible closed class (for example, $P = I$ on three states) the equations leave $h$ undetermined there. Uniqueness needs every state of $D$ to reach $A union B$.
+ False: $bb(E)_1 V_0 >= bb(E)_1 (V_0 and V_N) = N - 1$ for every $N$.
+ True: $bb(P)_y (T_y = oo) > 0$, so the expectation is infinite.
+ True: Lemma~8.2 gives $bb(P)_x (V_A > n) -> 0$ geometrically, so $Q^n -> 0$ and $sum_n Q^n$ converges to $(I - Q)^(-1)$.
]
