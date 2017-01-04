append([], L, L).
append([H|T],L,[H|AppendTail]) :- append(T,L,AppendTail).

prefix(P,L) :- append(P,_,L).

suffix(S,L) :- append(_,S,L).

sublist(S,L) :- prefix(P,L), suffix(S,P).

slowrev([],[]).
slowrev([H|T], Reverse) :-
	slowrev(T, ReverseTail),
	append(ReverseTail, [H], Reverse).

rev(List,Reverse) :- accrev(List,[],Reverse).
accrev([],Acc,Acc).
accrev([H|T], Acc, Reverse) :- accrev(T, [H|Acc], Reverse).