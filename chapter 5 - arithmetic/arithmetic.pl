% This is where "declarative" and "procedural" meanings of a prolog program start to break down.
% "is" needs it's right-hand side to be fully instantiated & cannot perform unification over there.

%! X = 2 + 3 just does unification.
%! if you want to evaluate use is/2: X is 2 + 3.
%! ALL variables on righthand side must be bound on evaluation or you'll get errors 
%! ERROR: is/2: Arguments are not sufficiently instantiated
add_3_and_double(X,Y)  :-  Y  is  (X+3)*2.

len([], 0).
len([_|T], L) :- len(T,TL), L is TL + 1.

%! tail recursion also matters in pl!
accLen([], Acc, Acc).
accLen([_|T], Acc, L) :- 
	NewAcc is Acc + 1,
	accLen(T,NewAcc,L).

leng(List,Length) :- accLen(List,0,Length).

% run tests using run_tests/0
:- begin_tests(arithmetic).

	test(lt) :- 1 < 2.
	test(le) :- 2 =< 2.
	test(eq) :- 3 =:= 3.
	test(ne) :- 2 =\= 3.
	test(evaluates_operands) :- 1 + 2 =:= 2 + 1.
	test(
		equality_does_not_evaluate_but_tries_to_unify, 
		fail) :-
		2 + 1 = 1 + 2.
				
:- end_tests(arithmetic).


accMax([], Acc, Acc).
accMax([X|Xs], Acc, Max) :-
	X =< Acc,
	accMax(Xs,Acc, Max).
accMax([X|Xs], Acc, Max) :-
	Acc < X,
	accMax(Xs,X, Max).

maxi([H|T], L) :- accMax(T,H,L).

increment(X,Y) :- Y is X + 1.

sum(X,Y,Sum) :- Sum is X + Y.

addone([], []).
addone([H|T], [Incr|Rest]) :-
	Incr  is H + 1,
	addone(T,Rest).