// TCES 330, Spring 2020
// 5/2020
// HW 3, Part 5
// Shifting HELLO and 3 spaces
// using 7 seg display and 50Hz system clock 
// Author: Shahzoda Staroverov

module part5(KEY, CLOCK_50, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
	input CLOCK_50; // system clock
	input [0:0] KEY; //reset
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7; // 7 segment display
	logic ad_clk; //adjusted clock to slow down the count
	logic [2:0]Q; //3bit counter
	adjust_clock( CLOCK_50, ad_clk);
	shift_HELLO(~KEY, ad_clk, Q);
	HEX_HEL d1(Q,HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7);
endmodule

module adjust_clock( Clock, ad_clk);
	//adjusted clock to slow down the count
	input Clock; // 50 MHz System Clock
	output logic ad_clk;
	parameter clk_div =24; // to desplay for 1 second and move to next
	logic [clk_div:0] counter;
	initial counter =0;
	always @(posedge Clock) 
		counter = counter+1; //increases up
	assign ad_clk = counter[clk_div];
	
endmodule

