default_member(H, [H|_]).
default_member(X,[_|T]) :- default_member(X,T).

member_with_append(X,L) :- append(_,[X|_], L).

set(L,S) :- recset(L,[],S).
recset([],Acc,Result) :- 
	reverse(Acc,Result).
recset([H|T], Acc, Result) :-
	member(H, Acc),
	recset(T, Acc, Result).
recset([H|T], Acc, Result) :-	
	not(member(H,Acc)),
	recset(T, [H|Acc], Result).

flatten(L,F) :- accFlat(L,[],F).
accFlat([],Acc,Acc).
accFlat(X,Acc,[X|Acc]) :-
	% ripped this from https://github.com/dragonwasrobot/learn-prolog-now-exercises/blob/master/chapter-6/practical-session.pl
	% but hasn't been mentioned _at_ _all_ in the course up until this point.
	X \= [],
	X \= [_|_].
accFlat([H|T],Acc,Result) :-
	accFlat(T,Acc,NewAcc),
	accFlat(H,NewAcc,Result).

:- begin_tests(set).
	test(set_example) :-
		set([2,2,foo,1,foo,[],[]],X),
		X = [2,foo,1,[]],
		!.
:- end_tests(set).

:- begin_tests(flatten).
	test(raw_list) :- 
		flatten(
			[1,2,3],
			[1,2,3]),
		!.
	test(one_level) :- 
		flatten(
			[[1,2],[3,4]],
			[1,2,3,4]),
		!.
	test(mixed) :- 
		flatten(
			 [a,b,[c,d],[[1,2]],foo],
			 [a,b,c,d,1,2,foo]),
		!.
	test(deep_mixed) :-
		flatten(
			 [a,b,[[[[[[[c,d]]]]]]],[[1,2]],foo,[]],
			 [a,b,c,d,1,2,foo]),
		!.
:- end_tests(flatten).