`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 03:17:58 PM
// Design Name: 
// Module Name: tb_Alu
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


module tb_Alu;

    logic [31:0] value1;
    logic [31:0] value2;
    logic [3:0] ALUControl;
    logic [31:0] result;

    Alu uut (
        .value1(value1),
        .value2(value2),
        .ALUControl(ALUControl),
        .result(result)
    );

    initial begin

        value1 = 32'd10;
        value2 = 32'd3;

        // ADD
        ALUControl = 4'b0010;
        #20;

        // SUB
        ALUControl = 4'b0110;
        #20;

        // AND
        ALUControl = 4'b0000;
        #20;

        // OR
        ALUControl = 4'b0001;
        #20;

    end

endmodule
