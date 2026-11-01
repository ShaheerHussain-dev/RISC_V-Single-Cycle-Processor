`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 03:43:02 PM
// Design Name: 
// Module Name: tb_ALU_Control
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


module tb_ALU_Control;

    logic [6:0] opcode;
    logic [1:0] ALUOp;
    logic [2:0] funct3;
    logic [6:0] funct7;
    logic [3:0] ALUControl;

    ALU_Control uut (
        .opcode(opcode),
        .ALUOp(ALUOp),
        .funct3(funct3),
        .funct7(funct7),
        .ALUControl(ALUControl)
    );

    initial begin
        opcode = 7'b0000000;
        ALUOp  = 2'b00;
        funct3 = 3'b000;
        funct7 = 7'b0000000;
        
        #10;
        ALUOp = 2'b01; // Branch
        
        #10;
        ALUOp  = 2'b10;
        opcode = 7'b0110011; // R-type
        funct3 = 3'b000;
        funct7 = 7'b0100000; // SUB
        
        #10;
        funct3 = 3'b111; // AND
        
        #10;
        funct3 = 3'b110; // OR
        
        #10;
    end

endmodule
