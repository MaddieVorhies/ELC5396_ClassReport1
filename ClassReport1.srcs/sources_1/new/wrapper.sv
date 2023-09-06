`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2023 06:03:18 PM
// Design Name: 
// Module Name: wrapper
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


module wrapper(
    input logic clk, rst, en, sel,
    output logic [7:0] an,
    output logic [7:0] sseg
    );
    
    logic [3:0] cw_an;
    logic [3:0] ccw_an;
    logic [7:0] cw_sseg;
    logic [7:0] ccw_sseg;
    
    clockwise myClockwise (
        .clk(clk),
        .rst(rst), 
        .en(en),
        .an(cw_an),
        .sseg(cw_sseg)
    );
    
    counter_clockwise myCounterClockwise (
        .clk(clk),
        .rst(rst), 
        .en(en),
        .an(ccw_an),
        .sseg(ccw_sseg)
    );
    
    mux #(4) mux_an (
      .a_in(cw_an),
      .b_in(ccw_an),
      .sel(sel),
      .mux_out(an)
   );
   
   mux #(8) mux_sseg (
      .a_in(cw_sseg),
      .b_in(ccw_sseg),
      .sel(sel),
      .mux_out(sseg)
   );
   
   assign an[7:4] = 4'b1111;
    
endmodule
