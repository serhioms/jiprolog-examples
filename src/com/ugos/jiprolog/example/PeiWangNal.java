package com.ugos.jiprolog.example;

public class PeiWangNal {
	
	public static void main(String args[]) {
		new JIPrologMachine("peiwang_nal.pl").parse(new String[] {"?- writeln('peiwang_nal.pl')."
//		 		,"% To show the results, type"
		 		,"?- represent(X, Y, V)."
		});
	}
}
