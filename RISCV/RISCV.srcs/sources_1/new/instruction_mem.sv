`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 03:15:40 PM
// Design Name: 
// Module Name: instruction_mem
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
// //////////////////////////////////////////////////////////////////////////////////
module instruction_mem #(
    parameter integer ADDRESS_WIDTH = 32,
    parameter integer BYTE_WIDTH = 8,
    parameter integer MEMORY_SIZE_BYTES = 256
)(
    input  logic [ADDRESS_WIDTH-1:0] pc,

    output logic [31:0] instruction,
    output logic [4:0]  rs1,
    output logic [4:0]  rs2,
    output logic [4:0]  rd,
    output logic [6:0]  opcode,
    output logic [2:0]  funct3,
    output logic [6:0]  funct7,
    output logic [11:0] immediate
);

    logic [BYTE_WIDTH-1:0] memory [0:MEMORY_SIZE_BYTES-1];

    integer i;
    integer address;

    initial begin
        for (i = 0; i < MEMORY_SIZE_BYTES; i = i + 1)
            memory[i] = '0;

        $readmemh("instrmem.mem", memory);
    end

    always_comb begin
        instruction = 32'b0;
        opcode      = 7'b0;
        funct3      = 3'b0;
        funct7      = 7'b0;
        rs1         = 5'b0;
        rs2         = 5'b0;
        rd          = 5'b0;
        immediate   = 12'b0;

        address = pc;

        if (address >= 0 && address + 3 < MEMORY_SIZE_BYTES) begin
            instruction = {
                memory[address + 3],
                memory[address + 2],
                memory[address + 1],
                memory[address]
            };
        end

        opcode = instruction[6:0];
        funct3 = instruction[14:12];
        funct7 = instruction[31:25];
        rs1    = instruction[19:15];

        case (opcode)
            7'b0110011: begin
                rd        = instruction[11:7];
                rs2       = instruction[24:20];
                immediate = 12'b0;
            end

            7'b0010011: begin
                rd        = instruction[11:7];
                immediate = instruction[31:20];
            end

            7'b0000011: begin
                rd        = instruction[11:7];
                immediate = instruction[31:20];
            end

            7'b0100011: begin
                rs2       = instruction[24:20];
                immediate = {
                    instruction[31:25],
                    instruction[11:7]
                };
            end

            7'b1100011: begin
                rs2       = instruction[24:20];
                immediate = {
                    instruction[31],
                    instruction[7],
                    instruction[30:25],
                    instruction[11:8]
                };
            end

            default: begin
                rs1       = 5'b0;
                rs2       = 5'b0;
                rd        = 5'b0;
                funct3    = 3'b0;
                funct7    = 7'b0;
                immediate = 12'b0;
            end
        endcase
    end

endmodule
