/*
even --> [].
even --> as, even.
as --> [a,a].
*/

%a^n b^2m c^2m d^n
s --> middle.
s --> a,s,d.
a --> [a].
d --> [d].

middle --> [].
middle --> bees,middle,cees.
bees --> [b,b].
cees --> [c,c].



prop --> [p].
prop --> [q].
prop --> [r].

prop --> not, prop.

prop --> leftp, prop, and, prop, rightp.
prop --> leftp, prop, or, prop, rightp.
prop --> leftp, prop, implies, prop, rightp.

not --> [not].
leftp --> ['('].
rightp --> [')'].
and --> [and].
or --> [or].
implies --> [implies].