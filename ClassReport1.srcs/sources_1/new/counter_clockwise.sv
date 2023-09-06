`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2023 05:27:04 PM
// Design Name: 
// Module Name: counter_clockwise
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2023 05:04:32 PM
// Design Name: 
// Module Name: clockwise
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


module counter_clockwise #(parameter N=28) (
    input logic clk, rst, en,
    output logic [3:0] an,
    output logic [7:0] sseg
);

    logic [N-1:0] q_reg;
    logic [N-1:0] q_next;
    
    always_ff @(posedge clk, posedge rst)
        if (rst) 
            q_reg <= 0;
        else if (en)
            q_reg <= q_next;
            
    assign q_next = q_reg + 1;
    
    always_comb
        case (q_reg[N-1:N-3])
            3'b000:
                begin
                    an = 4'b0111;
                    sseg = 8'b10011100;
                end
            3'b001:
                begin
                    an = 4'b0111;
                    sseg = 8'b10100011;
                end
            3'b010:
                begin
                    an = 4'b1011;
                    sseg = 8'b10100011;
                end
            3'b011:
                begin
                    an = 4'b1101;
                    sseg = 8'b10100011;
                end
            3'b100:
                begin
                    an = 4'b1110;
                    sseg = 8'b10100011;
                end
            3'b101:
                begin
                    an = 4'b1110;
                    sseg = 8'b10011100;
                end
            3'b110:
                begin
                    an = 4'b1101;
                    sseg = 8'b10011100;
                end
            default:
                begin
                    an = 4'b1011;
                    sseg = 8'b10011100;
                end
        endcase
        
endmodule

