`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 03:15:19 PM
// Design Name: 
// Module Name: program_counter
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


module program_counter #(
    parameter integer WIDTH = 32,
    parameter integer STEP = 4
)(
    input  logic clk,
    input  logic rst,
    output logic [WIDTH-1:0] pc
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst)
            pc <= '0;
        else
            pc <= pc + STEP;
    end

endmodule