%Exercise 10.1

p(1). 
p(2) :- !. 
p(3).

/*
1 ?- p(X).
X = 1 ;
X = 2.

2 ?- p(X),p(Y).
X = Y, Y = 1 ;
X = 1,
Y = 2 ;
X = 2,
Y = 1 ;
X = Y, Y = 2.

3 ?- p(X),!,p(Y).
X = Y, Y = 1 ;
X = 1,
Y = 2.
*/

%Exercise 10.2

class(Number,positive)  :-  Number  >  0,!. 
class(0,zero) :- !.
class(Number,negative)  :-  Number  <  0.

:- begin_tests(class).
test(zero) :- class(0,zero).
test(positive) :- class(1,positive).
test(negative) :- class(-1, negative).
:- end_tests(class).

%Exercise 10.3

split([],[],[]).
split([H|T],[H|P],N) :-
	H >= 0,
	!,
	split(T,P,N).
split([H|T],P,[H|N]) :-
	H < 0,
	split(T,P,N).

:- begin_tests(split).
test(empty) :- split([],[],[]).
test(only_positive) :- split([0,2,1],[0,2,1],[]).
test(only_negative) :- split([-1,-3,-2],[],[-1,-3,-2]).
test(mixed_bag) :- 
	split([3,4,-5,-1,0,4,-9],P,N),
	P = [3,4,0,4],
	N = [-5,-1,-9].
test(error_case,fail) :- split([1],[],[]).
test(used_as_generator, fail) :-
	%Does NOT work as cut trims down search tree
	split(Combined, [1,2], [-3,-4]),
	Combined = [-3,1,2,-4].
:- end_tests(split).

%Exercise 10.4
directTrain(saarbruecken,dudweiler). 
directTrain(forbach,saarbruecken). 
directTrain(freyming,forbach). 
directTrain(stAvold,freyming). 
directTrain(fahlquemont,stAvold). 
directTrain(metz,fahlquemont). 
directTrain(nancy,metz).

neighbouring(A,B) :- directTrain(A,B).
neighbouring(A,B) :- directTrain(B,A).

route(A,B, [A,B]) :- (A,B).
route(A, B, [A|RouteFromIntermediateToB]) :-
	neighbouring(A,Intermediate),
	route(Intermediate,B,RouteFromIntermediateToB).

:- begin_tests(route).

test(regular_direction) :- 
	neighbouring(nancy, metz).
test(reverse_direction) :- 
	neighbouring(metz,nancy).
test(no_direct_train, fail) :- 
	neighbouring(nancy,fahlquemont).


test(direct_route) :-
	route(forbach,saarbruecken,R),
	R = [forbach, saarbruecken].

test(direct_reverse_route) :-
	route(saarbruecken,forbach,R),
	R = [saarbruecken, forbach].

test(route_with_intermediate) :-
	route(forbach,dudweiler,R),
	R = [forbach, saarbruecken, dudweiler].

test(route_with_intermediate_reversed) :-
	route(dudweiler, forbach,R),
	R = [dudweiler, saarbruecken, forbach].

test(no_route, fail) :- 
	route(unknown,someplace_else,_).

test(example) :- 
	route(forbach,metz,Route),
   	Route  =  [forbach,freyming,stAvold,fahlquemont,metz].

:- end_tests(route).

%:- run_tests.