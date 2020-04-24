// Your Comments Go Here
module part2( SW, LEDG, LEDR);
	 input [17:0] SW; // toggle switches - all 18 of them (overkill)!
	 output [17:0] LEDR; // red LEDs (all of them, too)
	 output [3:0] LEDG;
	 // the mux:
	 assign LEDR = SW;
	 assign LEDG[0] = (~SW[17] & SW[0]) | (SW[17] & SW[4]);
	 assign LEDG[1] = (~SW[17] & SW[1]) | (SW[17] & SW[5]);
	 assign LEDG[2] = (~SW[17] & SW[2]) | (SW[17] & SW[6]);
	 assign LEDG[3] = (~SW[17] & SW[3]) | (SW[17] & SW[7]);	 
endmodule 