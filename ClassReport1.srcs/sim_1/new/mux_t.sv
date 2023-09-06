`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2023 07:23:47 PM
// Design Name: 
// Module Name: mux_t
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


module mux_t();
    parameter N=4;
    logic [N-1:0] a_in;
    logic [N-1:0] b_in;
    logic sel;
    logic [N-1:0] mux_out;
    
    
    mux #(.N(N)) dut (
        .a_in(a_in),
        .b_in(b_in),
        .sel(sel),
        .mux_out(mux_out)
    );
    
    
    
    initial begin
        a_in = 0;
        b_in = 1;
        
        sel = 0;
        #10;
    
        sel = 1;
        #10;
    
        sel = 0;
        #10;
    
        sel = 1;
        #10;
    
        $finish;
    end

endmodule
