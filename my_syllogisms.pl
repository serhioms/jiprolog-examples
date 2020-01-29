% https://www.cpp.edu/~jrfisher/www/prolog_tutorial/2_2.html
% https://en.wikipedia.org/wiki/Syllogism

% 5 syllogism which possible to implement in prolog
barbara(S,P)	:- all(M,P),all(S,M),S\=P.	%fig#1
celarent(S,P)	:- not(M,P),all(S,M),S\=P.	%fig#1
cesare(S,P)		:- not(P,M),all(S,M),S\=P.	%fig#2
camestres(S,P)	:- all(P,M),not(S,M),S\=P.	%fig#2
calemes(S,P)	:- all(P,M),not(M,S),S\=P.	%fig#4

% All S iz P
concludeAll(S,P) :- 
	barbara(S,P).
	 
% All S izn't P
concludeNot(S,P) :- 
	celarent(S,P);
	calemes(S,P);
	cesare(S,P);
	camestres(S,P). 

% All together
conclude(K,S,P) :- 
	K=all,concludeAll(S,P);
	K=no,concludeNot(S,P). 

% test facts
all(men,mortal).
all(greeks,men).
not(reptiles, fur).
all(snakes, reptiles).
all(bears, fur).

% output
%?- conclude(K,S,P).
%K=all,S=greeks,P=mortal
%K=no,S=snakes,P=fur
%K=no,S=fur,P=snakes
%K=no,S=bears,P=reptiles
%K=no,S=reptiles,P=bears
