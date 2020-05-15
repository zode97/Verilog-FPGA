// TCES 330, Spring 2020
// 5/2020
// HW 3, Part 3
// Creates a 16 bit counter using LPM
// Fmax = 386.7 MHz. In part 1, the Fmax is higher
// and part 2 has similar freq.
// The difference between 4 bit counter and 16bit
// RTL design looks different from part1 and 2
// the output in RTL to four HEXs with 4 bits as inouts. 
// ISSUES: I have to puch clcok 4-5 time to get frpm 9 to 10 or 19 to 20 and etc.
// Author: Shahzoda Staroverov

module part3(KEY, SW, LEDR, LEDG, HEX0, HEX1, HEX2, HEX3);
	input KEY[0]; //KEY0 -clock
	input [1:0] SW; //SW0 enable, SW1 reset
	output [1:0] LEDR; //LEDR0, LEDR 1
	output LEDG[0]; //LEDG0	
	output [6:0] HEX0, HEX1, HEX2, HEX3;// 7 bit vectors for hex values
	wire logic [15:0] Q;
	assign LEDR = SW; //assign red LEDs to the switch bit 
	assign LEDG[0] = KEY[0]; //assign green LEDs to the switch bit 
	counter u1(KEY[0], SW[0],~SW[1],Q);
	HEX d1(Q[3:0], HEX0);
	HEX d2(Q[7:4], HEX1);
	HEX d3(Q[11:8], HEX2);
	HEX d4(Q[15:12], HEX3);
endmodule
