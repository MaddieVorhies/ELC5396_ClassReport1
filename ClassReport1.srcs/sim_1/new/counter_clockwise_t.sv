`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2023 07:23:25 PM
// Design Name: 
// Module Name: counter_clockwise_t
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


module counter_clockwise_t();
    parameter N = 3;
    logic clk, rst, en;
    logic [3:0] an;
    logic [7:0] sseg;
    
    counter_clockwise# (.N(N)) dut (
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
