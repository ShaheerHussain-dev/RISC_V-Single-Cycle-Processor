`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 03:20:09 PM
// Design Name: 
// Module Name: tb_instruction_mem
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


module tb_instruction_mem;

    logic [31:0] pc;
    logic [31:0] instruction;
    logic [4:0]  rs1;
    logic [4:0]  rs2;
    logic [4:0]  rd;
    logic [6:0]  opcode;
    logic [2:0]  funct3;
    logic [6:0]  funct7;
    logic [11:0] immediate;

    instruction_mem uut (
        .pc(pc),
        .instruction(instruction),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .opcode(opcode),
        .funct3(funct3),
        .funct7(funct7),
        .immediate(immediate)
    );

    initial begin
        pc = 32'd0;
        #10;

        pc = 32'd4;
        #10;

        pc = 32'd8;
        #10;

        pc = 32'd12;
        #10;
    end

endmodule