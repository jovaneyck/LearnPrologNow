contains(katarina, olga).
contains(olga, natasha).
contains(natasha, irina).

in(Outer, Inner) :- contains(Outer, Inner).
in(Outer, Inner) :-
	contains(Outer, Intermediate),
	in(Intermediate, Inner).