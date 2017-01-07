s(S) :- np(NP), vp(VP), append(NP,VP,S).
np(NP) :- det(Det), n(N), append(Det,N,NP).
vp(VP) :- v(V), np(NP), append(V,NP,VP).
vp(VP) :- v(VP).
det([a]).
det([the]).
n([woman]).
n([man]).
v([shoots]).