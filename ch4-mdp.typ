#import "notes.typ" : *

#outline(depth: 1)
#counter(heading).update(1)
= Intro to MDP
We only study MDP for finite state space. Let $SS$ denote the state space. From now on we assert that $SS$ is finite. Let $AA$ be the action space. For each $s in SS$, we have $a in AA$, and the transition law depends on $a$. Notice that both $SS$ and $AA$ automatically generates a measurable space by the discrete $sigma$-algebra.

#definition(title: [Markov Decision Process])[
  A discounted MDP is a tuple $cal(M)=(SS, AA, D, P, R, lambda)$ where
  + $SS$ is the state space equipped with $cal(F)_S = 2^SS$.
  + $AA$ is the action space equipped with $cal(F)_A = 2^AA$.
  + $D in cal(F)_S times.o cal(F)_A$ measurable is the admissible set. We denote $D_s != emptyset$ as the admissible actions from state $s in SS$.
  + $P:D times cal(F)_S -> [0,1]$ is a transition kernel. We denote $P(s,a,B)$ by $P_a (s, B)$.
  + $R:SS times AA -> RR$ measurable is the reward function. We assert that it is bounded.
  + $lambda in [0,1)$ is the discount factor.
]

#definition(title: [History])[
  $H_n$ is the history of the MDP $cal(M)$. It is defined by
  $
    H_n = (SS times AA) ^ n times SS.
  $
  It has the associated $sigma$-algebra
  $
    cal(H)_n =(cal(F)_S times.o cal(F)_A)^(times.o n) times.o cal(F)_s
  $
  We call the measurable space $(H_n, cal(H)_n)$ the history space.
]

We now define control.
#definition(title: [General Control])[
  A control $pi$ of the MDP $cal(M)$ is a sequence $(pi_n)$ where each $pi_n$ is a transition kernel of from $(H_n, cal(H)_n)$ to $(AA, cal(F)_A)$. i.e.
  $
    pi_n:H_n times cal(F)_A -> [0,1]
  $
  Also, $pi_n (h, D_s)=1$ for all $h in H_n$
]
This is very general. We note some special cases.
#example(title: [Determinstic Control])[
  A control $pi_n$ is determinstic if there exists measurable function $f_n: H_n -> AA$, $f_n (h) in D_s$ where $s$ is last coordinate of $h$, such that
  $
    pi_n (h, B) = bb(1)(f_n (h) in B)
  $
]

#example(title: [Admissible Adapted Control])[
  Let $a_n$ be $AA$ valued process such that it is adapted to $sigma(S_0, dots, S_n)$ and is admissible to each $S_n$. By Doob-Dynkin, $exists g_n: SS^(n+1) -> AA$ measurable such that $a_n = g_n (S_0, dots, S_n)$. We define $pi_n(h,C) := bb(1)(g_n(h) in C)$.

  It is easy to verify this is a control.
]
Given a control, we can generate a probability distribution from $pi$. We have the following theorem-definition.
#definition(title: [Controlled Distribution])[
  Let $pi=(pi_n)$ be a control of $cal(M)$. Let $Omega = (SS times AA)^NN$, $cal(F) = (SS times.o AA)^(times.o NN)$. Let $S_n, A_n$ be coordinate maps from $SS^NN, AA^NN$ resp. Let $h_n = (S_0,A_0,dots,A_(n-1),S_n)$.
  
  Let $s in SS$, there exists an unique probability measure $PP_s^pi: (Omega, cal(F)) -> [0,1]$ where  such that
  + $PP_s^pi (S_0 = s) = 1$
  + $PP_s^pi (A_n in C | h_n) = pi_n (h_n, C)$ a.e.
  + $PP_s^pi (S_(n+1) in B | h_n, A_n) = P_(A_n)(S_n, B)$ a.e.
  The second one is the controlled condition, and the third one is the Markovian condition.
]
The existence and uniqueness come from Ionescu-Tulcea, the proof of which is omitted.

To evaluate a control, we make following definitions.
#definition()[
  $U:[0,oo) -> RR$ is a utility function if $U$ is non-decreasing and concave.
]
#definition()[
  Let $lambda in [0,1)$, the value of a control $pi$ starting from state $s$ is 
  $
    V^pi (s) = EE^pi_s [U(sum_(n=0)^oo lambda ^n R(S_n, a_n))].
  $
]
#definition()[
  The value function $V^*:SS -> RR$ is defined as
  $
    V^* (s)= sup_(pi in Pi) V^pi (s).
  $
  A control $pi$ is optimal if
  $
    V^pi (s) = V^* (s).
  $
]


= Bellman Function and Equation
#definition(title: [Bellman])[
  Define $V:SS -> [-M, M]$ as
  $
    V(s)= max_(a in A)[R(s,a) + lambda sum_(s ^ prime in S) P_a (s, s ^ prime) V(s ^ prime)] #h(2em) (*).
  $
  This is the Bellman value function.
]

We consider the following map $T: (S mapsto [-M, M], S mapsto [-M, M])$
$
  T V (s):= max_(a in A)[R(s,a) + lambda sum_(s^prime in S) P_a(s, s^prime) V(s^prime)]
$

Notice since $S$ is finite, $S mapsto [-M, M] tilde.equiv [-M, M] ^(|S|)$. We wish to show there is a fixed point for $T$. We utilize the following theorem.

#theorem(title: [Banach])[
  Let $X$ be  Banach spaces, and $f: X -> X$, $f$ is a contraction, then there is an unique fixed point $x^star$. Moreover, $lim_(n -> oo) f^(n)(x) = x^star #h(1em) forall x in X $, where $f^n = underbrace(f compose dots.c compose f, n "times")$. 
]
#proof[
  Uniqueness is trivial. We now show existence. 
  $
    norm(f^n (x)-f^n (y))_oo <= c^n norm(x-y)_oo 
  $
  Let $x_n = f^n (x_0)$. The Cauchyness comes from
  $
    norm(x_n - x_m) <= sum norm(x_(k+1) - x_k) <= sum c^k norm(f(x_0) - x_0) <= c^n/(1-c) norm(f(x_0) - x_0) -> 0
  $
  So $x_n$ is Cauchy. Let $x$ be the limit. Note $f(lim f^n (x))=lim f^(n+1)(x)=x$
]

#proposition()[
  Let $T: [-M, M]^(|S|)$ be the map above, $T $ is a contraction under  $norm(*)_oo$.
]
#proof[
  Let $V, U$ be in domain of $T$
  $
    norm(T V - T U)_oo = &norm(max_(a in A)(R(s,a) + lambda sum P_a (s, s^prime) V(s^prime))- \
    
    &max_(a in A)(R(s,a) + lambda sum P_a (s, s^prime) U(s^prime))) \
    
    <= &max_a norm(lambda sum P_a (s, s^prime) V(s^prime) -  lambda sum P_a(s, s^prime) U(s^prime))\

    <= &lambda max_a norm(sum P_a (s, s^prime) (V(s^prime)-U(s^prime)))\

    <= &lambda norm(V - U)
  $
  By definition, $lambda in (0,1)$
]
Therefore $T$ is a contraction, then by the fixed point theorem, it has a fixed point. Hence, there exists a $V$ that satisfies $(*)$.

#definition()[
  $
    sigma^*(s)=arg max_(a in A) [R(s,a) + lambda sum_(s in S) P(s, s^prime) V^* (s)] 
  $
  It is easy to verify that this is a control.
]

#theorem()[
  The Bellman function $V^*$ is the value function and $sigma^*$ is an optimal control. 
]
#proof()[
  We notice
  $
    EE_s^pi [V^*(S_(n+1))|cal(F)_n] = sum_(s^prime in SS) P_(a_n)(S_n,s^prime) V^* (s^prime),
  $
  by controlled Markov. Let $W$ be the value function. We first show $V^* <= W$. We argue $sigma^*$ is generates $V^*$. Note $V^sigma^star$ satisfies 
  $
    V^sigma^* (s) =R(s,sigma^*(s)) + lambda sum_(s in SS) P_(sigma^star (s))(s, s^prime) V^sigma^*(s^prime),
  $
  by first step analysis. Since $sigma^*$ is maximal, $V^*$ satisfy the same relationship. By $T$ is a contraction, the fixed point is unique, hence $V^sigma^* = V^*$. Therefore $V^* <= W$.

  For the reversed inequality, let $pi=(a_n)$ be any policy, note 
  $
    V^*(S_n) &>= R(S_n,a_n) + lambda sum P_(a_n)(S_n, s^prime)V^*(s^prime)\
    &= R(S_n,a_n)+lambda EE_s^pi (V^*(S_(n+1))|cal(F)_n) \
    ==>EE_s^pi V^*(S_n) &>= EE_s^pi (R(S_n, a_n)) + lambda EE_s^pi (V^*(S_(n+1)))
  $
  Denote $EE_s^pi V^*(S_n) =: x_n$, $r_n = EE_s^pi R(S_n, a_n)$. We then have
  $
    lambda^n x_n - lambda^(n+1) x_(n+1) &>= lambda ^n r_n \
    => x_0 - lambda^n x_n &>= sum_(m=0)^(n-1) lambda^m r_m\
    => V^*(s) &>=lambda^n EE_s^pi V^*(S_n) + EE_s^pi [sum_(m=0)^(n-1) lambda^n R(S_m, a_m)] ->V^pi (s) 
  $
]

$
 H_X (t) = EE((X-t)^+) 
$
show $partial^+_t H_X(t) = -PP(X>=t)$