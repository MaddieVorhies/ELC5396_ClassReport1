`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2023 05:33:57 PM
// Design Name: 
// Module Name: mux
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux# (parameter N=8)(
    input logic [N-1:0] a_in,
    input logic [N-1:0] b_in,
    input logic sel,
    output logic [N-1:0] mux_out
);
	
	assign mux_out = sel ? b_in : a_in; 
    
endmodule
