% https://www.cpp.edu/~jrfisher/www/prolog_tutorial/2_2.html

% facts
mortal(mortal).					% The mortal is mortal - tautology !!!
human(human).					% tautology
animal(animal).					% tautology

human(socrates).				% The human is Socratus 			or Socratus - human
animal(cat).

% rules
alive(X) :- human(X); animal(X).
mortal(X) :- alive(X).			% The dying of X if the human is X	or Any human is dying

% are X Y? or are Y X?
are(X,Y) :- mortal(X), Y = mortal, X \= mortal.
are(Y,X) :- mortal(X), Y = mortal, X \= mortal.


/* 
	Map coloring example
*/
adjacent(1,2).							% The clause is a unit clause if having no body i.e. FACT         
adjacent(2,1) :- true. 					% true is default body for FACT
adjacent(1,3).         adjacent(3,1). 	% the adjacent of 1 is 3 and the adjacent of 3 is 1
adjacent(1,4).         adjacent(4,1). 
adjacent(1,5).         adjacent(5,1). 
adjacent(2,3).         adjacent(3,2). 
adjacent(2,4).         adjacent(4,2). 
adjacent(3,4).         adjacent(4,3). 
adjacent(4,5).         adjacent(5,4).

color(1,red,a).    color(1,red,b). 
color(2,blue,a).   color(2,blue,b). 
color(3,green,a).  color(3,green,b). 
color(4,yellow,a). color(4,blue,b). 
color(5,blue,a).   color(5,green,b).				

conflict1(Coloring) :- 
   adjacent(X,Y), 
   color(X,Color,Coloring), 
   color(Y,Color,Coloring). 
   
conflict(R1,R2,Coloring) 		% clause head
:-								% ':-' which can be read as "if"
								% The clause is a rule, because it does have a body.
   adjacent(R1,R2), 			% The body consists of literals  
   color(R1,Color,Coloring), 	% separated by commas ','
   color(R2,Color,Coloring). 	% each of which can be read as "and"
   
/* 
	Two predicate definitions that calculate the factorial function
*/   
factorial(0,1).		% it says "the factorial of 0 is 1"
factorial(N,F) :-	% it says "the factorial of N is F  
   N>0, 			% if N>0 and 
   N1 is N-1, 		% N1 is N-1 and 
   factorial(N1,F1),% the factorial of N1 is F1 and  
   F is N * F1.		% F is N*F1"

/*
	Clause trees are so-called AND-trees, since, in order for the root 
	to be a consequence of the program, each of its subtrees must also 
	be rooted at literals which are themselves consequences of the program.
	We will have more to say about clause trees later. We have indicated 
	that clause trees provide a meaning or semantics for programs. 
	We will see another approach to program semantics in Chapter 6. 
	Clause trees do provide an intuitive, as well as a correct, approach 
	to program semantics.
	
	We will need to distinguish between the program clause trees and 
	so-called Prolog derivation trees. The clause trees are "static" and 
	can be drawn for a program and goal regardless of the particular 
	procedural goal-satisfaction mechanism. Roughly speaking, the clause 
	trees correspond to the declarative reading of the program.

	Derivation trees, on the other hand, take into account the 
	variable-binding mechanism of Prolog and the order that subgoals are 
	considered. Derivation trees are discussed in Section 3.1 
	(but see the animation below).

*/

      
factorial3(0,F,F). 
factorial3(N,A,F) :-  
    N > 0, 
    A1 is N*A, 
    N1 is N-1, 
    factorial3(N1,A1,F).      


/*
	Towers of Hanoi puzzle
*/    
% The first clause in the program describes the move of a single disk
move(1,A,B,_) :-  						% The variables filled in by '_' 
    write('Move top disk from '), 		% (or any variables beginning with underscore) are 
    write(A), 							% 'don't-care' variables. Prolog allows these variables
    write(' to '), 						% to freely match any structure, but no variable binding
    write(B), 							% results from this gratuitous matching.
    nl. 						% new line
    
move(N,X,Y,Z) :- 
    N>1, 
    M is N-1, 
    move(M,X,Z,Y),
    move(1,X,Y,_), 
    move(M,Z,Y,X).     
 
 
 
 
/* The tree database */ 

:- op(500,xfx,'is_parent'). 

a is_parent b.    c is_parent g.     f is_parent l.     j is_parent q. 
a is_parent c.    c is_parent h.     f is_parent m.     j is_parent r. 
a is_parent d.    c is_parent i.     h is_parent n.     j is_parent s. 
b is_parent e.    d is_parent j.     i is_parent o.     m is_parent t. 
b is_parent f.    e is_parent k.     i is_parent p. 
  
 /* X and  Y are siblings  */ 
 :- op(500,xfx,'is_sibling_of'). 
 X is_sibling_of Y :- Z is_parent X, 
                      Z is_parent Y, 
                      X \== Y. 
 
/* X and Y are on the same level in the tree. */ 
 :-op(500,xfx,'is_same_level_as'). 

 X is_same_level_as  X .          
 X is_same_level_as  Y :- W is_parent X, 
                          Z is_parent Y, 
                          W is_same_level_as Z. 
 
/* Depth of node in the tree. */ 
 :- op(500,xfx,'has_depth'). 

 a has_depth 0 :- !. 
 Node has_depth D :- Mother is_parent Node, 
                     Mother has_depth D1,   
                     D is D1 + 1. 
 
/* Locate node by finding a path from root down to the node. */ 
 locate(Node) :- path(Node), 
                 write(Node), 
                 nl. 
 path(a).                              /* Can start at a.      */ 
 path(Node) :- Mother is_parent Node,  /* Choose parent,       */ 
               path(Mother),           /*  find path and then  */ 
               write(Mother), 
               write(' --> '). 
 
/*  Calculate the height of a node, length of longest  path to  
    a leaf under the node.   */ 
 
 height(N,H) :- setof(Z,ht(N,Z),Set),  /* See section 2.8 for 'setof'.  */ 
                max(Set,0,H). 
 
 ht(Node,0) :- leaf(Node), !. 
 ht(Node,H) :- Node is_parent Child, 
               ht(Child,H1), 
               H is H1 +1. 
 
 leaf(Node) :- not(is_parent(Node,Child)). /* Node grounded */
 
 max([],M,M). 
 max([X|R],M,A) :- (X > M -> max(R,X,A) ; max(R,M,A)). 
 

 
member(X,[X|R]).
member(X,[Y|R]) :- member(X,R).  


member2(X,[X|_]).
member2(X,[_|R]) :- member2(X,R).


takeout(X,[X|R],R).
takeout(X,[F|R],[F|S]) :- takeout(X,R,S).



reverse([X|Y],Z,W) :- reverse(Y,[X|Z],W).
reverse([],X,X).


mergesort([],[]).    /* covers special case */
mergesort([A],[A]).
mergesort([A,B|R],S) :-  
   split([A,B|R],L1,L2),
   mergesort(L1,S1),
   mergesort(L2,S2),
   merge(S1,S2,S).

split([],[],[]).
split([A],[A],[]).
split([A,B|R],[A|Ra],[B|Rb]) :-  split(R,Ra,Rb).

merge(A,[],A).
merge([],B,B).
merge([A|Ra],[B|Rb],[A|M]) :-  A =< B, merge(Ra,[B|Rb],M).
merge([A|Ra],[B|Rb],[B|M]) :-  A > B,  merge([A|Ra],Rb,M).


?- op(500,yfx,'#').


 
change([H,Q,D,N,P]) :- 
    member(H,[0,1,2]),                      /* Half-dollars */ 
    member(Q,[0,1,2,3,4]),                  /* quarters     */ 
    member(D,[0,1,2,3,4,5,6,7,8,9,10]) ,    /* dimes        */ 
    member(N,[0,1,2,3,4,5,6,7,8,9,10,       /* nickels      */ 
               11,12,13,14,15,16,17,18,19,20]),  
    S is 50*H + 25*Q +10*D + 5*N, 
    S =< 100, 
    P is 100-S. 
    

find_regions([],R,R). 
find_regions([[X,Y]|S], R,A) :- 
     (member(X,R) ->  
        (member(Y,R) -> find_regions(S,R,A) ; find_regions(S,[Y|R],A)) ; 
           (member(Y,R) -> find_regions(S,[X|R],A) ; find_regions(S,[X,Y|R],A) ) ).     
		   
		   
		   
		   

