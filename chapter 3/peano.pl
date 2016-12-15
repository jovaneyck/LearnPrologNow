nb(0).
nb(succ(X)) :- nb(X).

add(0, Number, Number).
add(succ(X), Y, succ(Sum)) :-	
	add(X, Y, Sum).

greater_than(succ(_),0).
greater_than(succ(X), succ(Y)) :- greater_than(X,Y).