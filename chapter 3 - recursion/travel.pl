   byCar(auckland,hamilton). 
   byCar(hamilton,raglan). 
   byCar(valmont,saarbruecken). 
   byCar(valmont,metz). 
    
   byTrain(metz,frankfurt). 
   byTrain(saarbruecken,frankfurt). 
   byTrain(metz,paris). 
   byTrain(saarbruecken,paris). 
    
   byPlane(frankfurt,bangkok). 
   byPlane(frankfurt,singapore). 
   byPlane(paris,losAngeles). 
   byPlane(bangkok,auckland). 
   byPlane(singapore,auckland). 
   byPlane(losAngeles,auckland).

   directRoute(A,B,car) :- byCar(A,B).
   directRoute(A,B,train) :- byTrain(A,B).
   directRoute(A,B,plane) :- byPlane(A,B).

   travel(A,B) :- directRoute(A,B,_).
   travel(A,B) :-
      directRoute(A, Intermediate,_),
      travel(Intermediate, B).

   travel(From, To, go(From,To,Transport)) :- 
      directRoute(From,To,Transport).
   travel(From,To, go(From,Intermediate, Transport, RemainingRoute)) :-
      directRoute(From, Intermediate,Transport),
      travel(Intermediate, To, RemainingRoute).