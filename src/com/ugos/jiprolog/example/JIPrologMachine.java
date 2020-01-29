package com.ugos.jiprolog.example;

import java.io.IOException;

import com.ugos.jiprolog.engine.JIPEngine;
import com.ugos.jiprolog.engine.JIPQuery;
import com.ugos.jiprolog.engine.JIPSyntaxErrorException;
import com.ugos.jiprolog.engine.JIPTerm;
import com.ugos.jiprolog.engine.JIPVariable;

public class JIPrologMachine {

	private final JIPEngine jip;
	
	public JIPrologMachine(String plfile) {
		jip = new JIPEngine();
		try {
			jip.consultFile(plfile);
		} catch (JIPSyntaxErrorException ex) {
			ex.printStackTrace();
			System.exit(0); // needed to close threads by AWT if shareware
		} catch (IOException ex) {
			ex.printStackTrace();
			System.exit(0); // needed to close threads by AWT if shareware
		}
	}

	public void parse(String... terms) {
		JIPTerm queryTerm = null;
		for (int i = 0; i < terms.length; i++) {
			
			if( terms[i].trim().startsWith("?-")) {
				System.out.println("\n" + terms[i]);
			} else {
				System.out.println("\n?- " + terms[i]);
			}
			
			queryTerm = jip.getTermParser().parseTerm(terms[i]);

			// open Query
			JIPQuery jipQuery = jip.openSynchronousQuery(queryTerm);
			JIPTerm solution;

			// Loop while there is another solution
			for(boolean nosolution=true; jipQuery.hasMoreChoicePoints(); ) {
				solution = jipQuery.nextSolution();
				if (solution != null) {
					JIPVariable[] vars = solution.getVariables();
					if( vars.length == 0 ) {
						System.out.println("yes");
					} else {
						int num = 0;
						for (JIPVariable var : vars) {
							if (!var.isAnonymous()) {
								if( num++ > 0 ) {
									System.out.print(",");
								}
								System.out.print(var.getName() + "=" + var.toString(jip));
							}
						}
						System.out.println("");
					}
					nosolution = false;
				} else if( nosolution ){
					System.out.println("no");
				}
			}
		}
	}
}
