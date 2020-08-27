package com.ugos.jiprolog.example;

public class AristotelAssertiveSyllogism {
	
	public static void main(String args[]) {
		new JIPrologMachine("my_syllogisms.pl").parse(new String[] {"?- writeln('my_syllogisms.pl')."
				 ,"?- all(A,B)."
				 ,"?- not(C,D)."
				 
				 ,"?- barbara(greeks,mortal)."
				 ,"?- barbara(mortal,greeks)."
				 ,"?- barbara(greeks,P)."
				 ,"?- barbara(S,greeks)."
				 ,"?- barbara(S,mortal)."
				 ,"?- barbara(mortal,P)."
				 ,"?- barbara(men,P)."
				 ,"?- barbara(S,men)."
				 
				 ,"?- barbara(S,P)."
				 ,"?- celarent(S,P)."
				 ,"?- calemes(S,P)."
				 ,"?- cesare(S,P)."
				 ,"?- camestres(S,P)."
				 
				 ,"?- bocardo(S,P)."
				 ,"?- dimatis(S,P)."
				 ,"?- fesapo(S,P)."
				 ,"?- fresison(S,P)."

				 ,"?- conclude(K,S,P)."
		});
	}
}
