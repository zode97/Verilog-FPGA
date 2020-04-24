// Your Comments Go Here
module part3( SW, LEDG, LEDR);
	 input [17:0] SW; // toggle switches - all 18 of them (overkill)!
	 output [17:0] LEDR; // red LEDs (all of them, too)
	 output [2:0] LEDG;
	 wire S0, S1, S2,a,b,c;
	 // the mux:
	 assign LEDR = SW;
	 assign S0 = SW[15];
	 assign S1 = SW[16];
	 assign S2 = SW[17];
	 assign a = (~S0 & SW[14:12]) | (S0 & SW[11:9]);
	 assign b = (~S0 & SW[8:6]) | (S0 & SW[5:3]);
	 assign c = (~S1 & a) | (S1 & b);
	 assign LEDG[2:0] = (~S2 & c) | (S2 & SW[2:0]);	 
endmodule 