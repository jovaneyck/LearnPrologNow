s(s(NP,VP))  -->  np(NP),vp(VP).     

np(np(DET,N))  -->  det(DET),n(N). 
    
vp(vp(V,NP))  -->  v(V),np(NP). 
vp(vp(V))        -->  v(V). 
    
det(det(the))  -->  [the]. 
det(det(a))      -->  [a]. 
    
n(n(woman))  -->  [woman]. 
n(n(man))      -->  [man]. 
    
v(v(shoots))  -->  [shoots].

indent(Offset,Deeper) :-
	Deeper is Offset + 4.

pptree(S) :- pptree(S, 0).
pptree(s(NP,VP),Offset) :-
	write("s("), nl,
	indent(Offset,Deeper),
	tab(Deeper),pptree(NP, Deeper), nl,
	tab(Deeper),pptree(VP, Deeper),write(")").

pptree(np(DET,N),Offset) :-
	write("np("), nl,
	indent(Offset,Deeper),
	tab(Deeper), pptree(DET,Deeper), nl,
	tab(Deeper), pptree(N,Deeper),write(")").

pptree(vp(V),_) :- write(vp(V)).
pptree(vp(V,NP),Offset) :-
	write("vp("), nl,
	indent(Offset,Deeper),
	tab(Deeper), pptree(V,Deeper),nl,
	tab(Deeper), pptree(NP,Deeper),write(")").

pptree(v(V),_) :- write(v(V)).
pptree(det(D),_) :- write(det(D)).
pptree(n(N),_) :- write(n(N)).

pp(Term) :- pp(Term, 0).
pp(V,Offset) :- 
	var(V),
	tab(Offset),write(V).
pp(A,Offset) :- 
	atom(A),
	tab(Offset),write(A).
pp(Unary,Offset) :-
	functor(Unary,_,NbArgs),
	NbArgs = 1,
	tab(Offset),write(Unary).
pp(Nary,Offset) :-
	functor(Nary,_,NbArgs),
	NbArgs > 1,
	Nary =.. [F|Args],
	tab(Offset),write(F), write("("),
	indent(Offset,Deeper),
	pplines(Args,Deeper),write(")").

pplines([],_).
pplines([H|T],Offset) :- 
	nl,pp(H,Offset),
	pplines(T, Offset).