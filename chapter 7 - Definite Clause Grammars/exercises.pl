%7.1
/*
s  -->  foo,bar,wiggle. 
foo  -->  [choo]. 
foo  -->  foo,foo. 
bar  -->  mar,zar. 
mar  -->  me,my. 
me  -->  [i]. 
my  -->  [am]. 
zar  -->  blar,car. 
blar -->  [a]. 
car  -->  [train]. 
wiggle  -->  [toot]. 
wiggle  -->  wiggle,wiggle.
*/
%wiggle([toot|X],X).
%wiggle(X,Z) :- wiggle(X,Y), wiggle(Y,Z).

%7.2
/*
s --> [a,b].
s --> l,s,r.
l --> [a]. 
r --> [b].
*/

s --> [].
s --> l,s,r.
l --> [a].
r --> [b,b].