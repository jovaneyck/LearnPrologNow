directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(fahlquemont,stAvold).
directTrain(stAvold,forbach).
directTrain(saarbruecken,dudweiler).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

travelBetween(A,B) :- 
	directTrain(A,B).
travelBetween(A,B) :-
	directTrain(A,X),
	travelBetween(X,B).