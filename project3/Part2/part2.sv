// TCES 330, Spring 2020
// 5/2020
// HW 3, Part 2
// Creates a 16 bit counter with 4 HEX counter
// Fmax = 324.89 MHz. In part 1, the Fmax is higher
// The difference between 4 bit counter and 16bit
// RTL design looks the same as part 1
// ISSUES: I have to puch clcok 4-5 time to get frpm 9 to 10 or 19 to 20 and etc.
// Author: Shahzoda Staroverov

module part2(KEY, SW, LEDR, LEDG, HEX0, HEX1, HEX2, HEX3);
	input KEY[0]; //KEY0 -clock
	input [1:0] SW; //SW0 enable, SW1 reset
	output [1:0] LEDR; //LEDR0, LEDR 1
	output LEDG[0]; //LEDG0	
	output [6:0] HEX0, HEX1, HEX2, HEX3;// 7 bit vectors for hex values
	assign LEDR = SW; //assign red LEDs to the switch bit 
	assign LEDG[0] = KEY[0]; //assign green LEDs to the switch bit 
	Count16P( KEY[0], SW[0], SW[1], HEX0, HEX1, HEX2, HEX3);
endmodule 