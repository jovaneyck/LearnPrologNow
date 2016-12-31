my_member(X,[X|_]).
my_member(X,[_|T]) :- my_member(X,T).

a2b([],[]).
a2b([a|ATail],[b|BTail]) :- a2b(ATail, BTail).

second(X,[_,X|_]).

swap12([X1,X2|T],[X2,X1|T]).

tran(eins,one). 
tran(zwei,two). 
tran(drei,three). 
tran(vier,four). 
tran(fuenf,five). 
tran(sechs,six). 
tran(sieben,seven). 
tran(acht,eight). 
tran(neun,nine).

listtran([],[]).
listtran([G|GT],[E|ET]) :-
	tran(G,E)
	, listtran(GT,ET).

twice([],[]).
twice([X|Xs],[X,X|TwiceXs]) :- twice(Xs, TwiceXs).

combine1([],[],[]).
combine1([X|Xs], [Y|Ys],[X,Y|Cs]) :- combine1(Xs,Ys,Cs).


combine2([],[],[]).
combine2([X|Xs], [Y|Ys],[[X,Y]|Cs]) :- combine2(Xs,Ys,Cs).

combine3([],[],[]).
combine3([X|Xs], [Y|Ys],[j(X,Y)|Cs]) :- combine3(Xs,Ys,Cs).