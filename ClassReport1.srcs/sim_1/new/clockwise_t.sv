`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2023 04:31:36 PM
// Design Name: 
// Module Name: clockwise_t
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


module clockwise_t();
    parameter N = 3;
    logic clk, rst, en;
    logic [3:0] an;
    logic [7:0] sseg;
    
    clockwise# (.N(N)) dut (
        .clk(clk),
        .rst(rst),
        .en(en),
        .an(an),
        .sseg(sseg)
    );
    
    initial begin
        clk = 0;
        forever
            #5 clk = ~clk;
    end

    
    initial begin   
        //Reset
        rst = 0;
        #3;
        rst = 1;
        #3;
        rst = 0;
        #4;
        
        //Enable rotation
        en = 1;
        #100;
        
        //Pause rotation
        en = 0;
        #30;
        
        //Unpause rotation
        en = 1;
        #50
        $finish;
    end


endmodule
