// Chapter 2 practice set 2: coupling and limiting distributions. Shared styles are in notes.typ.
#import "notes.typ": *
#show: notes.with(head-right: [Chapter 2: Practice set 2])
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

#title-block[Chapter 2: Practice set 2 --- coupling and limiting distributions]

#strong[Scope.] Part A: total variation and couplings. Part B: existence and computation of limiting distributions. Result numbers refer to the Chapter~2 notes (Theorem~6.7 = limit theorems, Lemma~7.5 = coupling inequality, Theorem~7.22 = maximal coupling). A $star$ on a problem or a part means it is harder than the Fall 2026 practice midterm; unmarked problems are at about exam level. Solutions start on a new page after the problems.

#heading(numbering: none)[Part A: Coupling and total variation]

#problem(title: [TV and a maximal coupling])[
Let $mu = "Bin"(2, 1/2)$ and $nu = "Unif"{0, 1, 2}$.
+ Compute $norm(mu - nu)_"TV"$.
+ Write the $3 times 3$ joint table of a coupling $(U, V)$ with $U tilde mu$, $V tilde nu$ and $bb(P)(U != V) = norm(mu - nu)_"TV"$.
]

#problem(title: [Two binomials])[
Let $0 <= p <= q <= 1$. Using a coupling of $n$ pairs of Bernoullis, show
$ norm("Bin"(n, p) - "Bin"(n, q))_"TV" <= n (q - p) . $
]

#problem(title: [Doeblin coupling], starred: true)[
Let $P$ be a transition matrix on a finite $S$, and put
$ delta = sum_(y in S) min_(x in S) p(x, y) . $
Assume $delta > 0$.
+ Define $nu(y) = min_x p(x, y) \/ delta$ and, if $delta < 1$, $R(x, y) = (p(x, y) - delta nu(y)) \/ (1 - delta)$. Show that $nu$ is a probability vector and $R$ is a transition matrix.
+ Build a coupling of two $P$-chains as follows. At each step, with probability $delta$ both chains jump to a common state drawn from $nu$; otherwise, each moves by $R$ (independently if they differ, together if they are equal). Check that each coordinate is a $P$-chain, and deduce
  $ norm(P^n (x, dot) - P^n (y, dot))_"TV" <= (1 - delta)^n , quad norm(P^n (x, dot) - pi)_"TV" <= (1 - delta)^n . $
+ Apply this to
  $ P = mat(0.5, 0.3, 0.2; 0.2, 0.5, 0.3; 0.3, 0.2, 0.5) . $
  What is $pi$? What bound do you get for $n = 5$?
]

#problem(title: [Lazy walk on a cycle], starred: true)[
Let $m >= 3$ and let $P$ be the lazy walk on $bb(Z)_m$: $p(x, x) = 1/2$, $p(x, x plus.minus 1) = 1/4$.
+ Start $X_0 = x$, $Y_0 = y$. Until they meet, flip a fair coin each step: on heads $X$ moves to $X plus.minus 1$ (each with probability $1/2$) and $Y$ stays; on tails $Y$ moves and $X$ stays. After meeting, they move together. Show each coordinate is a lazy walk.
+ Show that $D_n = X_n - Y_n$ (mod $m$) performs simple random walk until it hits $0$, and use gambler's ruin to show $bb(E) tau <= m^2 \/ 4$.
+ Deduce $norm(P^n (x, dot) - pi)_"TV" <= m^2 \/ (4n)$. How large must $n$ be to guarantee distance at most $1/4$?
]

#problem(title: [Lazy walk on the hypercube], starred: true)[
On $S = {0, 1}^d$, one step picks a coordinate $i$ uniformly and a fair bit $B$, and sets $x_i = B$.
+ Show the chain is irreducible and aperiodic with uniform stationary distribution.
+ Couple two copies using the same $(i, B)$ at every step. Show $tau <= T$, where $T$ is the coupon-collector time for the $d$ coordinates, and deduce $norm(P^n (x, dot) - pi)_"TV" <= d e^(-n\/d)$.
+ For $d = 10$, how many steps guarantee distance at most $0.01$?
]

#problem(title: [Monotone coupling], starred: true)[
Reflecting walk on ${0, 1, dots, N}$: $p(x, x + 1) = p$ for $x < N$, $p(x, x - 1) = q = 1 - p$ for $x > 0$, $p(0, 0) = q$, $p(N, N) = p$.
+ Write one step as $X_(j+1) = f(X_j, U_(j+1))$ with $U_(j+1) tilde "Unif"[0, 1]$ and $f(x, u)$ nondecreasing in $x$.
+ Drive two chains from $x <= y$ with the same $U$'s. Show $X_n <= Y_n$ for all $n$, and deduce that $x |-> bb(P)_x (X_n >= k)$ is nondecreasing for every $n, k$.
+ Show the gap $Y_n - X_n$ never increases, and that the chains are equal from the first time $X$ hits $N$ or $Y$ hits $0$.
]

#heading(numbering: none)[Part B: Limiting distributions]

#problem(title: [Which chains have a limiting distribution?])[
For each matrix on $S = {1, 2, 3}$, decide whether a limiting distribution exists. If it does, find it; if not, say what goes wrong and compute whatever limit does exist (row limits or Cesàro limits).
$ P_1 = mat(0, 1/2, 1/2; 1, 0, 0; 1, 0, 0), quad
  P_2 = mat(1/2, 1/2, 0; 1/4, 3/4, 0; 1/3, 1/3, 1/3), quad
  P_3 = mat(1, 0, 0; 0, 1, 0; 1/2, 1/4, 1/4), quad
  P_4 = mat(0, 1, 0; 1, 0, 0; 1/2, 0, 1/2) . $
]

#problem(title: [Absorption into closed classes])[
On $S = {1, dots, 5}$ let
$ P = mat(1/2, 1/2, 0, 0, 0; 1/3, 2/3, 0, 0, 0; 0, 0, 1, 0, 0; 1/4, 0, 1/4, 1/4, 1/4; 0, 1/2, 1/4, 1/4, 0) . $
+ Classify the states and find the closed classes.
+ Find $alpha(x) = bb(P)_x ("enter" {1, 2})$ for $x = 4, 5$.
+ Compute $lim_n P^n (4, dot)$ and $lim_n P^n (5, dot)$. Is there a limiting distribution?
]

#problem(title: [Success-run chain])[
On $S = bb(Z)_(>= 0)$, fix $p in (0, 1)$, $q = 1 - p$, and let $p(i, i + 1) = p$, $p(i, 0) = q$ for every $i$.
+ Show the chain is irreducible and aperiodic.
+ Find the stationary distribution, $lim_n P^n (x, y)$, and $bb(E)_0 T_0$.
+ What is the long-run fraction of time the chain spends at states $>= 3$?
+ $star$ Couple two copies from $x$ and $y$ by using the same coin at every step (both go up, or both reset to $0$). Show $norm(P^n (x, dot) - pi)_"TV" <= p^n$.
]

#problem(title: [Ehrenfest urn])[
$m$ balls are split between two urns; at each step a ball is chosen uniformly and moved to the other urn. Let $X_n$ be the number of balls in urn 1, so $p(i, i - 1) = i/m$ and $p(i, i + 1) = (m - i)/m$.
+ Find the stationary distribution using detailed balance.
+ Find the period. Does $P^n (0, dot)$ converge? Compute $lim_n P^(2n) (0, y)$ for $m = 4$.
+ For the lazy chain $Q = (I + P)\/2$, find $lim_n Q^n (x, y)$.
+ Starting from an empty urn 1, what is the expected time to return to an empty urn 1? Evaluate for $m = 10$.
+ $star$ Show that the number of ones in the hypercube walk of Problem~5 (with $d = m$) is exactly the lazy Ehrenfest chain $Q$. Deduce $norm(Q^n (0, dot) - pi)_"TV" <= m e^(-n\/m)$.
]

#problem(title: [Walks on cycles: aperiodic or not?])[
+ On $bb(Z)_5$ let $p(x, x + 1) = p(x, x + 2) = 1/2$. Show the chain is irreducible and aperiodic, and find $lim_n P^n (0, y)$.
+ On $bb(Z)_6$ let $p(x, x + 1) = p(x, x + 3) = 1/2$. Show the chain is irreducible with period $2$. Is there a limiting distribution?
+ $star$ For the chain in (b), compute $lim_n P^(2n) (0, y)$ and $lim_n P^(2n+1) (0, y)$.
]

#pagebreak()

#heading(numbering: none)[Solutions]

#solution(1)[
(a) $mu = (1/4, 1/2, 1/4)$ and $nu = (1/3, 1/3, 1/3)$. The overlap is $r = min(mu, nu) = (1/4, 1/3, 1/4)$ with $sum r = 5/6$, so $norm(mu - nu)_"TV" = 1/6$.

(b) The excess of $mu$ is $1/6$ at $1$; the excess of $nu$ is $1/12$ at $0$ and $1/12$ at $2$. Following Theorem~7.22, put $r$ on the diagonal and send $mu$'s excess at $1$ to $nu$'s excess at $0$ and $2$ (rows: $U$; columns: $V$):
$ mat(delim: #none, augment: #(hline: (1,), vline: (1,)), "", V = 0, V = 1, V = 2; U = 0, 1/4, 0, 0; U = 1, 1/12, 1/3, 1/12; U = 2, 0, 0, 1/4) $
Row sums $(1/4, 1/2, 1/4) = mu$, column sums $(1/3, 1/3, 1/3) = nu$, and $bb(P)(U != V) = 1/12 + 1/12 = 1/6$.
]

#solution(2)[
Take $Z_1, dots, Z_n$ iid uniform on $[0, 1]$ and put $U_i = upright(bold(1)){Z_i <= p}$, $V_i = upright(bold(1)){Z_i <= q}$. Then $sum U_i tilde "Bin"(n, p)$, $sum V_i tilde "Bin"(n, q)$, and $bb(P)(U_i != V_i) = bb(P)(p < Z_i <= q) = q - p$. Since $sum U_i != sum V_i$ forces some $U_i != V_i$, the coupling inequality and a union bound give
$ norm("Bin"(n, p) - "Bin"(n, q))_"TV" <= bb(P)(sum_i U_i != sum_i V_i) <= sum_i bb(P)(U_i != V_i) = n (q - p) . $
]

#solution(3)[
(a) $nu >= 0$ and $sum_y nu(y) = delta \/ delta = 1$. For every $x, y$, $p(x, y) >= min_(x') p(x', y) = delta nu(y)$, so $R >= 0$, and $sum_y R(x, y) = (1 - delta)\/(1 - delta) = 1$.

(b) From $x$, the next state is $y$ with probability $delta nu(y) + (1 - delta) R(x, y) = p(x, y)$, whether or not the chains have met; so each coordinate is a $P$-chain. Each step, independently of the past, the "common jump" happens with probability $delta$, and after it the chains are equal forever. Hence $bb(P)(tau > n) <= (1 - delta)^n$, and the coupling inequality gives the first bound. For the second, by convexity,
$ norm(P^n (x, dot) - pi)_"TV" &= norm(sum_y pi(y) (P^n (x, dot) - P^n (y, dot)))_"TV" \
  &<= sum_y pi(y) norm(P^n (x, dot) - P^n (y, dot))_"TV" <= (1 - delta)^n . $

(c) Every column of $P$ sums to $1$, so $P$ is doubly stochastic and $pi = (1/3, 1/3, 1/3)$. Column minima are $0.2, 0.2, 0.2$, so $delta = 0.6$ and the bound is $0.4^n$; for $n = 5$ it is $0.4^5 approx 0.0102$. (The true distance from state $1$ at $n = 5$ is about $0.0008$, so the bound is valid but not tight.)
]

#solution(4)[
(a) On heads (probability $1/2$) $X$ moves to $X plus.minus 1$ with probability $1/2$ each; on tails it stays. So $X$ stays with probability $1/2$ and moves to each neighbour with probability $1/4$: a lazy walk. The same holds for $Y$, and after meeting they take a common lazy step.

(b) On heads $D$ changes by $plus.minus 1$ (from $X$'s move), on tails by $minus.plus 1$ (from $Y$'s move); either way $D_(n+1) = D_n plus.minus 1$ with probability $1/2$ each. So until meeting, $D$ is simple random walk on $bb(Z)_m$, and $tau$ is the time it hits $0$, i.e. gambler's ruin on ${0, dots, m}$ absorbed at $0$ or $m$. From $D_0 = k$, $bb(E) tau = k (m - k) <= m^2 \/ 4$ (fair gambler's ruin, Lecture~8).

(c) By the coupling inequality and Markov's inequality,
$ norm(P^n (x, dot) - P^n (y, dot))_"TV" <= bb(P)(tau > n) <= frac(bb(E) tau, n) <= frac(m^2, 4n) . $
Average over $y tilde pi$ as in Solution~3(b) to get $norm(P^n (x, dot) - pi)_"TV" <= m^2\/(4n)$. Distance at most $1/4$ is guaranteed once $n >= m^2$.
]

#solution(5)[
(a) Changing coordinates one at a time reaches any $y$ from any $x$, so the chain is irreducible. $p(x, x) = 1/2$ (whatever $i$ is, $B = x_i$ with probability $1/2$), so it is aperiodic. For $y != x$, $p(x, y) = 1\/(2d)$ if $x, y$ differ in exactly one coordinate and $0$ otherwise; $P$ is symmetric, hence doubly stochastic, and $pi$ is uniform: $pi(x) = 2^(-d)$.

(b) With shared $(i, B)$, coordinate $i$ is set to the same bit in both chains and agrees forever after. Once every coordinate has been chosen at least once (time $T$), the chains are equal, so $tau <= T$. Then
$ norm(P^n (x, dot) - pi)_"TV" <= bb(P)(T > n) <= sum_(i = 1)^d bb(P)(i "not chosen by time" n) = d (1 - 1/d)^n <= d e^(-n\/d) . $

(c) $d e^(-n\/d) <= 0.01$ iff $n >= d (log d + log 100) = 10 (2.303 + 4.605) approx 69.1$, so $n = 70$ steps suffice.
]

#solution(6)[
(a) $f(x, u) = min(x + 1, N)$ if $u <= p$ and $f(x, u) = max(x - 1, 0)$ if $u > p$. For fixed $u$, both branches are nondecreasing in $x$, and $f(x, U)$ has the right transition probabilities.

(b) If $X_j <= Y_j$ then $X_(j+1) = f(X_j, U_(j+1)) <= f(Y_j, U_(j+1)) = Y_(j+1)$; induct from $X_0 = x <= y = Y_0$. Hence ${X_n >= k} subset.eq {Y_n >= k}$, so
$ bb(P)_x (X_n >= k) = bb(P)(X_n >= k) <= bb(P)(Y_n >= k) = bb(P)_y (Y_n >= k) . $

(c) Both chains try the same move. Away from the boundary both move by the same $plus.minus 1$, so the gap is unchanged. The gap can only change when one chain is blocked: $Y$ at $N$ trying to go up (gap shrinks by $1$) or $X$ at $0$ trying to go down (gap shrinks by $1$); it never grows. If $X$ hits $N$, then $N >= Y_n >= X_n = N$, so they are equal; similarly if $Y$ hits $0$. Once equal, the same $U$'s keep them equal.
]

#solution(7)[
$P_1$: irreducible ($1 <-> 2$, $1 <-> 3$) with period $2$ (bipartite: ${1}$ versus ${2, 3}$). Stationary $pi = (1/2, 1/4, 1/4)$, but $P_1^(2n) (1, dot) = (1, 0, 0)$ and $P_1^(2n+1) (1, dot) = (0, 1/2, 1/2)$: no limiting distribution. The Cesàro limit is $pi$.

$P_2$: ${1, 2}$ is closed and aperiodic, $3$ is transient. Exactly one closed class, aperiodic, so a limiting distribution exists. On ${1, 2}$, $pi(1) dot 1/2 = pi(2) dot 1/4$, so $pi = (1/3, 2/3, 0)$, and every row of $P_2^n$ tends to it.

$P_3$: two absorbing states $1, 2$; $3$ is transient. Rows $1$ and $2$ converge to $delta_1$ and $delta_2$, which differ, so there is no limiting distribution. From $3$, $h = bb(P)_3 ("absorbed at" 1)$ solves $h = 1/2 + h/4$, so $h = 2/3$ and $P_3^n (3, dot) -> (2/3, 1/3, 0)$.

$P_4$: the only closed class ${1, 2}$ has period $2$, so $P_4^n (1, 1)$ alternates $0, 1$: no limiting distribution. Cesàro limits exist: every row averages to $(1/2, 1/2, 0)$.
]

#solution(8)[
(a) ${1, 2}$ is closed and aperiodic (self-loops); $3$ is absorbing; $4$ and $5$ are transient (they lead to $3$, which never returns).

(b) $alpha = bb(P)("enter" {1, 2})$ satisfies $alpha_4 = 1/4 + 1/4 alpha_4 + 1/4 alpha_5$ and $alpha_5 = 1/2 + 1/4 alpha_4$. The first gives $3 alpha_4 = 1 + alpha_5$; substituting, $11/4 alpha_4 = 3/2$, so
$ alpha_4 = 6/11 , quad alpha_5 = 7/11 . $

(c) On ${1, 2}$, $pi(1) dot 1/2 = pi(2) dot 1/3$, so $pi_({1,2}) = (2/5, 3/5)$. By the mixture formula $lim_n P^n (x, dot) = alpha(x) pi_({1,2}) + (1 - alpha(x)) delta_3$:
$ lim_n P^n (4, dot) = (12/55, 18/55, 25/55, 0, 0), quad lim_n P^n (5, dot) = (14/55, 21/55, 20/55, 0, 0) . $
The rows differ (two closed classes), so there is no limiting distribution.
]

#solution(9)[
(a) Every state reaches $0$ in one step and $0$ reaches $i$ in $i$ steps, so the chain is irreducible; $p(0, 0) = q > 0$, so it is aperiodic.

(b) The chain is not reversible ($p(i, i + 1) > 0$ but $p(i + 1, i) = 0$ for $i >= 1$), so use global balance $pi P = pi$ column by column. The only way into $i + 1$ is from $i$, and every state resets to $0$ with probability $q$: $pi(i + 1) = p pi(i)$ and $pi(0) = q sum_i pi(i) = q$, so $pi(i) = q p^i$, a geometric distribution. I + A + S gives $lim_n P^n (x, y) = q p^y$ for every $x$, and $bb(E)_0 T_0 = 1\/pi(0) = 1\/q$. (Directly: the return time to $0$ is the first reset, which is geometric with mean $1\/q$.)

(c) By Theorem~6.7(2)--(4), the fraction is $sum_(i >= 3) q p^i = p^3$.

(d) Under the shared coin, the first reset sends both chains to $0$, after which they are equal. The first reset happens after time $n$ with probability $p^n$, so $norm(P^n (x, dot) - P^n (y, dot))_"TV" <= p^n$; averaging over $y tilde pi$ gives $norm(P^n (x, dot) - pi)_"TV" <= p^n$. This works on a countable state space with a bound uniform in $x$.
]

#solution(10)[
(a) Detailed balance: $pi(i) (m - i)/m = pi(i + 1) (i + 1)/m$, so $pi(i + 1)/pi(i) = (m - i)/(i + 1)$ and $pi(i) = binom(m, i) 2^(-m)$, the $"Bin"(m, 1/2)$ distribution.

(b) Every step changes $X_n$ by $plus.minus 1$, and $0 -> 1 -> 0$ has length $2$: period $2$. $P^n (0, 0) = 0$ for odd $n$, so $P^n (0, dot)$ does not converge. From $0$, even times land on even states; $P^2$ on the even states is irreducible and aperiodic with stationary law proportional to $pi$, so $lim_n P^(2n) (0, y) = 2 pi(y)$ for even $y$ and $0$ for odd $y$. For $m = 4$: $(2/16, 0, 12/16, 0, 2/16) = (1/8, 0, 3/4, 0, 1/8)$.

(c) $Q$ has the same stationary $pi$ and $Q(x, x) = 1/2$, so it is irreducible and aperiodic: $lim_n Q^n (x, y) = binom(m, y) 2^(-m)$ for every $x$.

(d) $bb(E)_0 T_0 = 1\/pi(0) = 2^m$ (for $P$ and for $Q$). For $m = 10$ this is $1024$ steps, even though the walk starts next to the most likely states; this is why the urn "never" returns to empty in practice.

(e) In the hypercube walk, the chosen bit changes with probability $1/2$ (when $B != x_i$). Given $k$ ones, it decreases with probability $1/2 dot k/m$, increases with probability $1/2 dot (m - k)/m$, and stays put with probability $1/2$: exactly $Q$. The number of ones is a function of the hypercube state, and TV cannot increase under a function, so $norm(Q^n (0, dot) - pi)_"TV" <= norm(P_"cube"^n (bold(0), dot) - "Unif")_"TV" <= m e^(-n\/m)$ by Solution~5(b).
]

#solution(11)[
(a) $x -> x + 1$ connects all of $bb(Z)_5$, so it is irreducible. Return lengths include $3$ ($1 + 2 + 2 = 5$) and $4$ ($1 + 1 + 1 + 2 = 5$), and $gcd(3, 4) = 1$: aperiodic. Each column has two entries $1/2$, so $P$ is doubly stochastic and $pi$ is uniform; Theorem~6.7(1) gives $lim_n P^n (0, y) = 1/5$.

(b) Again $x -> x + 1$ gives irreducibility. Both steps are odd and $6$ is even, so the parity of $X_n$ flips at every step: returns to $0$ need an even number of steps. Since $3 + 3 = 6$, a return in $2$ steps is possible, so the period is $2$. A periodic irreducible chain has no limiting distribution.

(c) $pi$ is uniform ($P$ is doubly stochastic). As for Problem~2 of the first set, $P^2$ restricted to the even states ${0, 2, 4}$ is irreducible and aperiodic with uniform stationary law, so
$ lim_n P^(2n) (0, dot) = (1/3, 0, 1/3, 0, 1/3, 0), quad lim_n P^(2n+1) (0, dot) = (0, 1/3, 0, 1/3, 0, 1/3) . $
]
