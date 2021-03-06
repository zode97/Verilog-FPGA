// Testbench
module Mux_4w_2_to_1_testbench; // notice: no inputs or outputs
	 // you can use whatever names you want for these signals:
	 logic SE; // mux select line
	 logic [3:0] XIN, YIN; // mux inputs
	 //logic [3:0] MO; // mux output
	 // the mux:
	 part2 DUT( SE, XIN, YIN );

	 initial begin
		 XIN = 0; // all zeros
		 YIN = 1; // all ones
		 SE = 0;
		 #50 SE = 1; // wait 50 time units then change SE to 1
		 // more test cases go here
	 end // initial

	 initial begin
		 $monitor( XIN,,, YIN,,, SE); // extra commas cause spaces to print
		 // you can use printf-type format strings in $monitor()
		 // something like
		 // $monitor( "%b\t%b\t%b\t%b", X, Y, S, M ); // binary outputs
		 // %b calls for binary output
		 // \t is a tab character (whitespace)
		 $monitor( "%b\t%b\t%b", XIN, YIN, SE);
	 end
endmodule

