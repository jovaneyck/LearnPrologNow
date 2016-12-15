child(jan, jozef).
child(jo,jan).

descendant(X,Y) :- child(X,Y).
descendant(X,Y) :-
	child(X,F),
	descendant(F,Y).