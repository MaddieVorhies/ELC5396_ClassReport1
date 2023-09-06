`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2023 03:48:07 PM
// Design Name: 
// Module Name: disp_mux
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


module disp_mux (
    input logic clk, rst,
    input logic [7:0] in3, in2, in1, in0,
    output logic [3:0] en,
    output logic [7:0] sseg
);
    
    localparam N = 18;
    
    logic [N-1:0] q_reg;
    logic [N-1:0] q_next;
    
    always_ff @(posedge clk, posedge rst)
        if (rst) 
            q_reg <= 0;
        else
            q_reg <= q_next;
            
    assign q_next = q_reg + 1;
    
    always_comb
        case (q_reg[N-1:N-2])
            2'b00:
                begin
                    en = 4'b1110;
                    sseg = in0;
                end
            2'b01:
                begin
                    en = 4'b1101;
                    sseg = in1;
                end
            2'b10:
                begin
                    en = 4'b1011;
                    sseg = in2;
                end
            default:
                begin
                    en = 4'b0111;
                    sseg = in3;
                end
        endcase
      
endmodule
