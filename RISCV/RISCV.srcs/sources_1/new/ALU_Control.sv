`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 03:41:14 PM
// Design Name: 
// Module Name: ALU_Control
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


module ALU_Control (
    input  logic [6:0] opcode,
    input  logic [1:0] ALUOp,
    input  logic [2:0] funct3,
    input  logic [6:0] funct7,
    output logic [3:0] ALUControl
);

    always_comb begin
        case (ALUOp)

            // Address calculation for loads and stores
            2'b00: ALUControl = 4'b0010;

            // Subtraction for branch comparison
            2'b01: ALUControl = 4'b0110;

            // R-type and I-type operations
            2'b10: begin
                case (funct3)

                    3'b000: begin
                        if (opcode == 7'b0110011 && funct7[5])
                            ALUControl = 4'b0110;
                        else
                            ALUControl = 4'b0010;
                    end

                    3'b111: ALUControl = 4'b0000;
                    3'b110: ALUControl = 4'b0001;

                    default: ALUControl = 4'b0010;

                endcase
            end

            default: ALUControl = 4'b0010;

        endcase
    end

endmodule
