`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2023 03:58:10 PM
// Design Name: 
// Module Name: disp_mux_t
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


module disp_mux_t(
    input logic clk, rst,
    input logic [3:0] btn,
    input logic [7:0] sw,
    output logic [3:0] en, 
    output logic [7:0] sseg
);

    logic [7:0] d3_reg, d2_reg, d1_reg, d0_reg;
    
    disp_mux dut (
        .clk(clk),
        .rst(rst),
        .in3(d3_reg),
        .in2(d2_reg),
        .in1(d1_reg),
        .in0(d0_reg),
        .en(en),
        .sseg(sseg)
    );
    
    always_ff @(posedge clk)
        begin
            if (btn[3])
                d3_reg <= sw;
            if (btn[2])
                d2_reg <= sw;
            if (btn[1])
                d1_reg <= sw;
            if (btn[0])
                d0_reg <= sw;
        end

endmodule
