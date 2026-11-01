`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 03:49:10 PM
// Design Name: 
// Module Name: top
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

module top #(
    parameter integer WIDTH = 32
)(
    input logic clk,
    input logic rst
);

    logic [WIDTH-1:0] pc;

    logic [31:0] instruction;
    logic [4:0]  rs1;
    logic [4:0]  rs2;
    logic [4:0]  rd;
    logic [6:0]  opcode;
    logic [2:0]  funct3;
    logic [6:0]  funct7;
    logic [11:0] immediate;

    logic        RegWrite;
    logic        ALUSrc;
    logic        MemRead;
    logic        MemWrite;
    logic        MemtoReg;
    logic        Branch;
    logic [1:0]  ALUOp;

    logic [WIDTH-1:0] read_data1;
    logic [WIDTH-1:0] read_data2;
    logic [WIDTH-1:0] write_data;

    logic [WIDTH-1:0] extended_immediate;
    logic [WIDTH-1:0] ALU_input2;
    logic [3:0]       ALUControl;
    logic [WIDTH-1:0] ALU_result;
    logic [WIDTH-1:0] memory_data;

    program_counter #(
        .WIDTH(WIDTH),
        .STEP(4)
    ) PC (
        .clk(clk),
        .rst(rst),
        .pc(pc)
    );

    instruction_mem IMEM (
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

    Control CU (
        .opcode(opcode),
        .RegWrite(RegWrite),
        .ALUSrc(ALUSrc),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg),
        .Branch(Branch),
        .ALUOp(ALUOp)
    );

    regfile REG_FILE (
        .clk(clk),
        .write_enable(RegWrite && !rst),
        .read_address1(rs1),
        .read_address2(rs2),
        .write_address(rd),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    imm_generator IMM_GEN (
        .immediate(immediate),
        .extended_immediate(extended_immediate)
    );

    mux2x1 #(
        .WIDTH(WIDTH)
    ) ALU_MUX (
        .register_value(read_data2),
        .immediate_value(extended_immediate),
        .select_immediate(ALUSrc),
        .selected_value(ALU_input2)
    );

    ALU_Control ALU_CTRL (
        .ALUOp(ALUOp),
        .funct3(funct3),
        .funct7(funct7),
        .ALUControl(ALUControl)
    );

    Alu #(
        .WIDTH(WIDTH)
    ) ALU (
        .value1(read_data1),
        .value2(ALU_input2),
        .ALUControl(ALUControl),
        .result(ALU_result)
    );

    data_memory DMEM (
        .clk(clk),
        .MemRead(MemRead),
        .MemWrite(MemWrite && !rst),
        .funct3(funct3),
        .address(ALU_result),
        .write_data(read_data2),
        .read_data(memory_data)
    );

    always_comb begin
        if (MemtoReg)
            write_data = memory_data;
        else
            write_data = ALU_result;
    end

endmodule