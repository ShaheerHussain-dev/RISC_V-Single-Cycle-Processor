`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 03:17:35 PM
// Design Name: 
// Module Name: Imm_generator
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


module imm_generator #(
    parameter integer IMMEDIATE_WIDTH = 12,
    parameter integer OUTPUT_WIDTH = 32
)(
    input logic [IMMEDIATE_WIDTH-1:0] immediate,
    output logic [OUTPUT_WIDTH-1:0] extended_immediate
);

    always_comb begin
        extended_immediate = {{(OUTPUT_WIDTH-IMMEDIATE_WIDTH){immediate[IMMEDIATE_WIDTH-1]}},
                             immediate};
    end

endmodule