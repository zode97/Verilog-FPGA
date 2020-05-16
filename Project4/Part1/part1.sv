// TCES 330, Spring 2020
// 5/2020
// HW 4, Part 1
// Finite state machine with the output
// that goes to LEDG0 and FSM to HEX0 to check 
// the state  
// ISSUES: In modelsim, the output is high when
// restart is hight but it should be low. But on
// the board it works as it shoulds 
// Author: Shahzoda Staroverov
module part1(SW,KEY,LEDG, LEDR, HEX0);
	inout [1:0]SW; //reset and w input
	inout [0:0] KEY; // clk
	output [0:0] LEDG; //output
	output [1:0] LEDR; //output
	output [6:0] HEX0;
	logic [3:0] temp;
	assign LEDR = SW;
	FSM u( KEY[0], SW[0], SW[1], LEDG[0], temp);
	HEX u1(temp, HEX0);
endmodule 