package com.ugos.jiprolog.example;

import java.io.IOException;

import com.ugos.jiprolog.engine.JIPEngine;
import com.ugos.jiprolog.engine.JIPQuery;
import com.ugos.jiprolog.engine.JIPSyntaxErrorException;
import com.ugos.jiprolog.engine.JIPTerm;
import com.ugos.jiprolog.engine.JIPVariable;

public class Chess {
    // main
    public static void main(String args[])
    {
        // New instance of prolog engine
        JIPEngine jip = new JIPEngine();

        JIPTerm queryTerm = null;

        // parse query
        try
        {
            // consult file
            jip.consultFile("C:/tdmss/workspace/test/jiprolog-examples/chess/stack.pl");
            jip.consultFile("C:/tdmss/workspace/test/jiprolog-examples/chess/globals.pl");
            jip.consultFile("C:/tdmss/workspace/test/jiprolog-examples/chess/pos_val.pl");
            jip.consultFile("C:/tdmss/workspace/test/jiprolog-examples/chess/zug_gen.pl");
            jip.consultFile("C:/tdmss/workspace/test/jiprolog-examples/chess/chess_12.pl");

            queryTerm = jip.getTermParser().parseTerm("run2.");
        }
        catch(JIPSyntaxErrorException ex)
        {
            ex.printStackTrace();
            System.exit(0); // needed to close threads by AWT if shareware
        }
        catch(IOException ex)
        {
            ex.printStackTrace();
            System.exit(0); // needed to close threads by AWT if shareware
        }

        do {
	        // open Query
	        JIPQuery jipQuery = jip.openSynchronousQuery(queryTerm);
	        JIPTerm solution;
	
	        // Loop while there is another solution
	        while (jipQuery.hasMoreChoicePoints())
	        {
	            solution = jipQuery.nextSolution();
	            if( solution != null ) {
		            System.out.println("\nYeah = "+solution);
		
		            JIPVariable[] vars = solution.getVariables();
		            for (JIPVariable var : vars) {
		                if (!var.isAnonymous()) {
		                    System.out.print(var.getName() + " = " + var.toString(jip) + " ");
		                    System.out.println();
		                }
		            }
	            }
	        }
	        queryTerm = jip.getTermParser().parseTerm("play2.");
        } while( false );

    }
}
