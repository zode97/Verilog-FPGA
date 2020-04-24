// Module that connects ten switches and lights
module part1 (SW, LEDR);
	input [17:0] SW; // vector of slide switches
	output [17:0] LEDR; // vector of red LEDs
	assign LEDR= SW; // switches are now wired to red LEDs
endmodule
