// TCES 330, Spring 2020
// 5/2020
// HW 3, Part 4
// Flashes values from 0 to 9 and then repeats 
// using 7 segment LEDS and 50Hz system clock 
// Author: Shahzoda Staroverov

module part4(KEY, CLOCK_50, HEX0,LEDG);
	input CLOCK_50; // system clock
	input [0:0]KEY; 
	output [6:0] HEX0; // 7 segment display
	output [8:8]LEDG; //green button
	logic ad_clk; //adjusted clock to slow down the count
	logic [3:0] Q;
	assign LEDG = 1;
	adjust_clock( CLOCK_50, ad_clk);
	Timer_1s u1( ~KEY, ad_clk, Q);
	HEX d1(Q, HEX0);
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