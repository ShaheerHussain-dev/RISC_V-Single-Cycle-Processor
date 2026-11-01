`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 08:32:55 PM
// Design Name: 
// Module Name: tb_mux2x1
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


module tb_mux2x1;

logic [31:0] register_value;
logic [31:0] immediate_value;
logic select_immediate;
logic [31:0] selected_value;

mux2to1 uut(
    .register_value(register_value),
    .immediate_value(immediate_value),
    .select_immediate(select_immediate),
    .selected_value(selected_value)
);

initial begin

    register_value = 32'd25;
    immediate_value = 32'd50;
    select_immediate = 0;

    #20;

    select_immediate = 1;

    #20;

    register_value = 32'd100;
    immediate_value = 32'd200;
    select_immediate = 0;

    #20;

    select_immediate = 1;

    #20;

end

endmodule
