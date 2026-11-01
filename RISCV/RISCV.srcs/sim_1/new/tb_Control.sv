`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 03:29:46 PM
// Design Name: 
// Module Name: tb_Control
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


module tb_Control;

    logic [6:0] opcode;
    logic       RegWrite;
    logic       ALUSrc;
    logic       MemRead;
    logic       MemWrite;
    logic       MemtoReg;
    logic       Branch;
    logic [1:0] ALUOp;

    Control uut (
        .opcode(opcode),
        .RegWrite(RegWrite),
        .ALUSrc(ALUSrc),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg),
        .Branch(Branch),
        .ALUOp(ALUOp)
    );

    initial begin
        opcode = 7'b0000000;
        #10;

        opcode = 7'b0110011; // R_TYPE
        #10;

        opcode = 7'b0010011; // I_TYPE
        #10;

        opcode = 7'b0000011; // LOAD
        #10;

        opcode = 7'b0100011; // STORE
        #10;

        opcode = 7'b1100011; // BRANCH
        #10;
    end

endmodule