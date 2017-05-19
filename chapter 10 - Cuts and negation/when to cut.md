* Mutually exclusive clauses for a single predicate: once you know there's no use in trying different clauses, cut.
* Green cuts: don't change results but can speed up
* Red cuts: change results
* cut-fail combination: model exceptions to general rules: likes(A,B) :- exception(A),!,fail.
* Negation as failure: \+ (again, order is important, arguments should be instantiated before using negation).