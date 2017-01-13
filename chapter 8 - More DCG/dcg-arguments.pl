/*
   s  -->  np(subject),vp. 
    
   np(_)  -->  det,n. 
   np(X)  -->  pro(X). 
    
   vp  -->  v,np(object). 
   vp  -->  v. 
    
   det  -->  [the]. 
   det  -->  [a]. 
    
   n  -->  [woman]. 
   n  -->  [man]. 
    
   pro(subject)  -->  [he]. 
   pro(subject)  -->  [she]. 
   pro(object)  -->  [him]. 
   pro(object)  -->  [her]. 
    
   v  -->  [shoots].
*/

% Parse tree
 s(s(NP,VP))  -->  np(NP),vp(VP). 
    
   np(np(DET,N))  -->  det(DET),n(N). 
    
   vp(vp(V,NP))  -->  v(V),np(NP). 
   vp(vp(V))        -->  v(V). 
    
   det(det(the))  -->  [the]. 
   det(det(a))      -->  [a]. 
    
   n(n(woman))  -->  [woman]. 
   n(n(man))      -->  [man]. 
    
   v(v(shoots))  -->  [shoots].