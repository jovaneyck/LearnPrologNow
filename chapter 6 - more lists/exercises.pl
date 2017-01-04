append([],R,R).
append([H|T], Other, [H|Recursive]) :- append(T,Other,Recursive).

doubled(L) :- append(X,X,L).

reverse(List,Result) :- rev(List,[],Result).
rev([], Acc, Acc).
rev([H|T],Acc,Result) :- rev(T,[H|Acc],Result).

palindrome(L) :- reverse(L,L).

except_last([_],Acc,Rev) :- reverse(Acc,Rev).
except_last([H|T], Acc, Result) :- except_last(T,[H|Acc],Result).
toptail([_|T], Middle) :- except_last(T,[],Middle).

revlast(L,X) :- reverse(L,[X|_]).
reclast([X],X).
reclast([_|T], X) :- reclast(T,X).

swapfl([H|T], Result) :- sfl(T, H, [], Result).
sfl([Last], First, Acc, Result) :-
	reverse(Acc,RevAcc),
	append([Last|RevAcc],[First], Result).
sfl([H|T], First, Acc, Result) :- sfl(T,First,[H|Acc], Result).

%Exercise 6.6
prefix(P,L) :- append(P,_,L).
suffix(S,L) :- append(_,S,L).
sublist(SubL,L) :- suffix(S,L), prefix(SubL,S).

zebra(Nationality,Street) :-
    member(house(_, Nationality, zebra), Street),

	length(Street, 3),

    member(house(red, englishman, _), Street),
    member(house(_, spanish, jaguar), Street),
    sublist([house(_, _, snail), house(_, japanese, _)], Street),
    sublist([house(_, _, snail), house(blue, _, _)], Street).

:- begin_tests(lists).
	% non-deterministic predicates leave a choicepoint,
	% the cut silences test warnings.
	test(doubled) :- doubled([1,2,3,1,2,3]), !.
	test(not_doubled, fail) :- doubled([1,2,3,1,2]).

	test(reverse) :- reverse([1,2], [2,1]).

	test(palindrome) :- palindrome([r,o,t,a,t,o,r]), !.
	test(short_palindrome) :- palindrome([a]), !.
	test(long_palindrome) :- palindrome([n,u,r,s,e,s,r,u,n]), !.
	test(no_palindrome, fail) :- palindrome([n,o,p,e]).

	test(empty_no_toptail, fail) :- toptail([],_).
	test(single_element_no_toptail, fail) :- toptail([1],_).
	test(toptail) :- toptail([1,2,3,4],[2,3]), !.

	test(revlast) :- revlast([1,2,3],3).
	test(reclast_empty, fail) :- reclast([],_).
	test(reclast) :- reclast([1,2,3], 3), !.

	test(swapfl) :- swapfl([1,2,3,4],[4,2,3,1]), !.

:- end_tests(lists).