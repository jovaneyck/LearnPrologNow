termtype(V,variable) :- var(V).
termtype(A,atom) :- atom(A).
termtype(C,constant) :- atomic(C).
termtype(ST, simple_term) :- 
	nonvar(ST),
	functor(ST,_,A),
	A = 0.
termtype(CT, complex_term) :-
	nonvar(CT),
	functor(CT,_,A),
	A > 0.
termtype(_,term).

allGrounded([]).
allGrounded([H|T]) :-
	groundterm(H),
	allGrounded(T).
groundterm(X) :- atom(X).
groundterm(CT) :-
	termtype(CT,complex_term),
	CT =.. [_|Args],
	allGrounded(Args).

:- begin_tests(groundterm).
	test(variable, fail) :- groundterm(_).
	test(complex_instantiated) :- groundterm(french(bic_mac,le_bic_mac)), !.
	test(complex_with_variables, fail) :- groundterm(french(whopper,_)).
:- end_tests(groundterm).

:- run_tests.