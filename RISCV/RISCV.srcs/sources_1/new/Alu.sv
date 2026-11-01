`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 03:16:11 PM
// Design Name: 
// Module Name: Alu
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

module Alu #(
    parameter integer WIDTH = 32
)(
    input logic [WIDTH-1:0] value1,
    input logic [WIDTH-1:0] value2,
    input logic [3:0] ALUControl,
    output logic [WIDTH-1:0] result
);

    always_comb begin
        case (ALUControl)
            4'b0000: result = value1 & value2;
            4'b0001: result = value1 | value2;
            4'b0010: result = value1 + value2;
            4'b0110: result = value1 - value2;
            default: result = '0;
        endcase
    end

endmodule