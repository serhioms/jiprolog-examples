package com.ugos.jiprolog.example;

public class PrologExamples {
	
	public static void main(String args[]) {

		new JIPrologMachine("prolog_example.pl").parse(new String[] {"?- writeln('prolog_example.pl')."
				
				,"?- true."		// Always yes
				,"?- false."	// Always no
				
				,"?- trace."	// Turn tracer on 			- hangs somewhere 
				,"?- notrace."	// Turn tracer off  
				
				,"?- writeln('Who are mortal? Who are human?')."
				,"?- mortal(X)."
				,"?- human(X)." 

				,"?- writeln('Is Socrates human? Is Socrates mortal?')."
				,"?- human(socrates)." 
				,"?- mortal(socrates)."

				,"?- writeln('Is cat human? Is cat mortal?')."
				,"?- human(cat)."
				,"?- mortal(cat)."
				
				,"?- writeln('Lots of questions?')."
				,"?- are(socrates,mortal)"	// yes 
				,"?- are(mortal, socrates)"	// yes
				,"?- are(human,mortal)"		// yes 
				,"?- are(cat,mortal)"		// no 
				,"?- are(mortal, cat)"		// no 
				,"?- are(X,mortal)"			// ***
				,"?- are(mortal, Y)"		// ***
				,"?- are(X, Y)"				// ***
				
				,"?- writeln('Adjacent example.')."
				,"adjacent(X,Y)." 
				,"adjacent(2,3)." 
				,"adjacent(3,5). " 
				,"adjacent(1,X)." 
				,"adjacent(1,x)." 

				,"?- writeln('Color example.')."
				,"color(X,Y,Z). "

				,"?- writeln('Conflict example.')."
				,"conflict1(a)."						// yes
				,"conflict1(b)."						// no
				,"conflict1(Which)."					// Which=b
				,"conflict(X,Y,a). "
				,"conflict(X,Y,b). "
				,"conflict(X,Y,Coloring). "				// X=2,Y=4,Coloring=b
				,"adjacent(X,Y)."
				,"color(2,Color,Coloring)."
				,"color(4,Color,Coloring)."
				,"conflict(X,Y,b),color(X,Color,b)."	// R1=2,R2=4,C=blue


				,"?- writeln('Factorial example.')."
				,"factorial(3,X)."
				,"factorial(5,X)."
				,"factorial(3,6)."
				,"factorial(5,2)." // no!
				,"factorial3(5,1,X)."
				,"factorial3(5,4,X)."
				
				,"?- writeln('Move example.')."
				,"move(1,left,right,abrakadabra)."
				,"move(3,left,right,center)."
				,"move(5,left,right,center)."
				,"move(3,left,right,left)."
				,"move(3,left,right,center)."
		
				,"?- writeln('??? example.')."
				,"t has_depth D."
				,"h is_sibling_of S."

				,"?- writeln('Locate example.')."
				,"locate(n)."

				,"?- writeln('Member example.')."
				,"member(2,[1,2,3])."
				,"member(X,[1,2,3])."
				,"member([3,Y],[[1,a],[2,m],[3,z],[4,v],[3,p]])."
				
				,"?- writeln('Member example.')."
				,"?- member(X,[23,45,67,12,222,19,9,6]), Y is X*X, Y < 100."
				,"?- member2(X,[23,45,67,12,222,19,9,6]), Y is X*X, Y < 100."

				,"?- writeln('Member example.')."
				,"takeout(X,[1,2,3],L)."
				,"member(X,[1,2,3],L)."

				,"?- writeln('Member2 example.')."
				,"member2(X,[1,2,3],L)."
				,"?- member2(X,[23,45,67,12,222,19,9,6]), Y is X*X, Y < 100."
				,"takeout(X,[1,2,3],L)."
				,"reverse([1,2,3],[],A)."

				,"?- writeln('Mergesort example.')."
				,"?- mergesort([4,3,6,5,9,1,7],S)."
				,"(H,T) = (1,2,3,4)."
				,"(A,B,C) = (1,2,3,4,5)."
				,"(A#B) = 1#2#3#4."

				,"?- writeln('Change example.')."
				,"change([H,Q,D,N,P])."
				
				,"?- writeln('Find regions example.')."
				,"?- find_regions([[1,2],[1,3],[1,4],[1,5],[2,3],[2,4],[3,4],[4,5]],[],R). "
		});
	}
}
