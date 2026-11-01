`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 03:18:53 PM
// Design Name: 
// Module Name: tb_program_counter
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


module tb_program_counter;

logic clk;
logic rst;
logic [31:0] pc;

program_counter uut(
    .clk(clk),
    .rst(rst),
    .pc(pc)
);

initial begin
    clk = 0;
end

always #10 clk = ~clk;

initial begin
    rst = 1;
    #20;

    rst = 0;
    #100;

    rst = 1;
    #20;

    rst = 0;
    #100;
end

endmodule