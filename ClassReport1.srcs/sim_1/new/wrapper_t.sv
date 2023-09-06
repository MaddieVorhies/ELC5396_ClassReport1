`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/05/2023 02:16:17 PM
// Design Name: 
// Module Name: wrapper_t
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


module wrapper_t();
    logic clk, rst, en, sel;
    logic [3:0] an;
    logic [7:0] sseg;
    
    
    wrapper dut (
        .clk(clk),
        .rst(rst), 
        .en(en),
        .sel(sel),
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
        en = 0;
        sel = 0;
        rst = 0;
        #3;
        rst = 1;
        #3;
        rst = 0;
        #4;
        
        //Enable and rotate clockwise
        en = 1;
        #100;
        
        //Rotate counter-clockwise
        sel = 1;
        #100;
        
        //Pause
        en = 0;
        #20;
        
        //Resume
        en = 1;
        #50;
        
        $finish;
    end


endmodule
