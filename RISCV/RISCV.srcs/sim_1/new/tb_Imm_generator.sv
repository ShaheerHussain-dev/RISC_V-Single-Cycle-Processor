`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 03:19:47 PM
// Design Name: 
// Module Name: tb_Imm_generator
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


module tb_imm_generator;

logic [11:0] immediate;
logic [31:0] extended_immediate;

imm_generator uut(
    .immediate(immediate),
    .extended_immediate(extended_immediate)
);

initial begin

    immediate = 12'h005;
    #20;

    immediate = 12'h7FF;
    #20;

    immediate = 12'h800;
    #20;

    immediate = 12'hFFF;
    #20;

    immediate = 12'h000;
    #20;

end

endmodule