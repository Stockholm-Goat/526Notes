// Shared front matter, included by every chapter (Typst copy of front.tex).
#import "notes.typ": *

#strong[Reading guide.]; Blocks are colour-coded: #text(fill: thmbar)[#strong[brown];]; for theorems, propositions, lemmas, and corollaries, with each proof attached directly below its result; #text(fill: exbar)[#strong[blue];]; for examples; #text(fill: defbar)[#strong[green];]; for definitions; and #text(fill: rembar)[#strong[grey];]; for remarks and notation. Proofs use equations and short steps.

#strong[Chapters.]; The notes are split into three files with continuous section numbering, each in its own folder: Chapter~1 (#raw("ch1-foundations/");), Sections~2--5; Chapter~2 (#raw("ch2-long-run/");), Sections~6--7; and Chapter~3 (#raw("ch3-exit-countable/");), Sections~8--9\. A result or equation in another chapter is cited by its number as plain text, e.g. Theorem~6.7 or~(3.1).

#notation(title: [Standing conventions])[
Throughout, $(X_n)_(n gt.eq 0)$ is a sequence of random variables taking values in a nonempty finite or countable state space $S$. Write
$ P = (p (x , y))_(x , y in S) & : med upright("transition matrix") , quad p (x , y) gt.eq 0 , quad sum_(y in S) p (x , y) = 1 ,\
P^n (x , y) & : med n upright("-step transition probability from ") x upright(" to ") y , quad P^0 = I ,\
bb(P)_x , med bb(E)_x & : med upright("probability and expectation for the chain started at ") x ,\
cal(F)_n = sigma (X_0 , dots.h , X_n) & : med upright("information available through time ") n . $
Here $I$ is the identity matrix. For any random variable $Z$, $cal(L) (Z)$ denotes its probability distribution (its #emph[law];); $Z tilde.op mu$ means $cal(L) (Z) = mu$. An indicator $upright(bold(1))_A$ equals one on the event $A$ and zero otherwise. For an initial distribution $q$ on $S$, $bb(P)_q$ and $bb(E)_q$ mean probability and expectation with $X_0 tilde.op q$. Distributions are row vectors. Nonnegative sums may be interchanged (Tonelli); $inf nothing = oo$.
]
