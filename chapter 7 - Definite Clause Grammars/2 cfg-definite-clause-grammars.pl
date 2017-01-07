%usage: 
%?- s(S,[]).
%?-  s([a,woman,shoots,a,man],[]).
%DCG are just syntactic sugar, pl treats these predicates exactly the same as the difference list approach.
%Just check out listing(s):
%	   s(A,B)  :- 
%           np(A,C), 
%           vp(C,B).
s  -->  np,vp. 

np  -->  det,n. 

vp  -->  v,np. 
vp  -->  v. 

det  -->  [the]. 
det  -->  [a]. 

n  -->  [woman]. 
n  -->  [man]. 

v  -->  [shoots].