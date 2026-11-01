`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 03:59:16 PM
// Design Name: 
// Module Name: data_memory
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



module data_memory #(
    parameter integer ADDRESS_WIDTH = 32,
    parameter integer DATA_WIDTH = 32,
    parameter integer BYTE_WIDTH = 8,
    parameter integer MEMORY_SIZE_BYTES = 256
)(
    input  logic                     clk,
    input  logic                     MemRead,
    input  logic                     MemWrite,
    input  logic [2:0]               funct3,
    input  logic [ADDRESS_WIDTH-1:0] address,
    input  logic [DATA_WIDTH-1:0]    write_data,
    output logic [DATA_WIDTH-1:0]    read_data
);

    logic [BYTE_WIDTH-1:0] memory [0:MEMORY_SIZE_BYTES-1];

    integer i;

    initial begin
        for (i = 0; i < MEMORY_SIZE_BYTES; i = i + 1)
            memory[i] = '0;

        $readmemh("datamem.mem", memory);
    end

    // Read operation
    always_comb begin
        read_data = '0;

        if (MemRead) begin
            case (funct3)

                // Load byte (signed)
                3'b000: begin
                    if (address < MEMORY_SIZE_BYTES)
                        read_data = {
                            {24{memory[address][7]}},
                            memory[address]
                        };
                end

                // Load halfword (signed)
                3'b001: begin
                    if (address[0] == 1'b0 &&
                        address + 32'd1 < MEMORY_SIZE_BYTES)
                        read_data = {
                            {16{memory[address + 32'd1][7]}},
                            memory[address + 32'd1],
                            memory[address]
                        };
                end

                // Load word
                3'b010: begin
                    if (address[1:0] == 2'b00 &&
                        address + 32'd3 < MEMORY_SIZE_BYTES)
                        read_data = {
                            memory[address + 32'd3],
                            memory[address + 32'd2],
                            memory[address + 32'd1],
                            memory[address]
                        };
                end

                // Load byte unsigned
                3'b100: begin
                    if (address < MEMORY_SIZE_BYTES)
                        read_data = {
                            24'b0,
                            memory[address]
                        };
                end

                // Load halfword unsigned
                3'b101: begin
                    if (address[0] == 1'b0 &&
                        address + 32'd1 < MEMORY_SIZE_BYTES)
                        read_data = {
                            16'b0,
                            memory[address + 32'd1],
                            memory[address]
                        };
                end

                default: read_data = '0;

            endcase
        end
    end

    // Write operation
    always_ff @(posedge clk) begin
        if (MemWrite) begin
            case (funct3)

                // Store byte
                3'b000: begin
                    if (address < MEMORY_SIZE_BYTES)
                        memory[address] <= write_data[7:0];
                end

                // Store halfword
                3'b001: begin
                    if (address[0] == 1'b0 &&
                        address + 32'd1 < MEMORY_SIZE_BYTES) begin
                        memory[address] <= write_data[7:0];
                        memory[address + 32'd1] <= write_data[15:8];
                    end
                end

                // Store word
                3'b010: begin
                    if (address[1:0] == 2'b00 &&
                        address + 32'd3 < MEMORY_SIZE_BYTES) begin
                        memory[address] <= write_data[7:0];
                        memory[address + 32'd1] <= write_data[15:8];
                        memory[address + 32'd2] <= write_data[23:16];
                        memory[address + 32'd3] <= write_data[31:24];
                    end
                end

                default: ;

            endcase
        end
    end

endmodule
