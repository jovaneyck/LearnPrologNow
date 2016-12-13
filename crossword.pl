word(abalone,a,b,a,l,o,n,e).
word(abandon,a,b,a,n,d,o,n).
word(enhance,e,n,h,a,n,c,e).
word(anagram,a,n,a,g,r,a,m).
word(connect,c,o,n,n,e,c,t).
word(elegant,e,l,e,g,a,n,t).

crossword(V1, V2, V3, H1, H2, H3) :-
	word(H1,_,L12,_,L14,_,L16,_),
	word(H2,_,L22,_,L24,_,L26,_),
	word(H3,_,L32,_,L34,_,L36,_),
	word(V1,_,L12,_,L22,_,L32,_),
	word(V2,_,L14,_,L24,_,L34,_),
	word(V3,_,L16,_,L26,_,L36,_).