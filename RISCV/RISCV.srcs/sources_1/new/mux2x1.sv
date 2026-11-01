`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 03:16:53 PM
// Design Name: 
// Module Name: mux2x1
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


module mux2x1 #(
    parameter integer WIDTH = 32
)(
    input logic [WIDTH-1:0] register_value,
    input logic [WIDTH-1:0] immediate_value,
    input logic select_immediate,
    output logic [WIDTH-1:0] selected_value
);

    always_comb begin
        if (select_immediate)
            selected_value = immediate_value;
        else
            selected_value = register_value;
    end

endmodule
