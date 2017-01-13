:- op(501, xfx, implies).
:- op(500, fx, not).

:- begin_tests(logicoperators).
	test(implies) :- a implies b == implies(a,b).
	test(not) :- not a == not(a).
	test(not_implies_precedence) :-
		not p implies q == implies(not(p),q).
:- end_tests(logicoperators).
:- run_tests.