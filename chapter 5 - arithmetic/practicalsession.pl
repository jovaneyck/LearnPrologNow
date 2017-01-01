mini([H|T], Min) :- accMin(T,H,Min).

accMin([],Acc,Acc).
accMin([H|T], Acc, Min) :-
	H < Acc,
	accMin(T, H, Min).
accMin([H|T], Acc, Min) :-
	Acc =< H,
	accMin(T, Acc, Min).

scalarMult(_, [], []).
scalarMult(Factor, [H|T], [Mul|Rest]) :-
	Mul is H * Factor,
	scalarMult(Factor, T, Rest).

dot([],[],0).
dot([H1|T1],[H2|T2], Product) :-
	dot(T1,T2, RestProduct),
	HeadProduct is H1 * H2,
	Product is HeadProduct + RestProduct.