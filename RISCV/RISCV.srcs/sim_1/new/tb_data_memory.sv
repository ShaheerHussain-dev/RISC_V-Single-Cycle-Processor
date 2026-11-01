`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/09/2026 09:43:54 PM
// Design Name: 
// Module Name: tb_data_memory
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

module tb_data_memory;

    logic         clk;
    logic         MemRead;
    logic         MemWrite;
    logic [2:0]   funct3;
    logic [31:0]  address;
    logic [31:0]  write_data;
    logic [31:0]  read_data;

    data_memory uut (
        .clk(clk),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .funct3(funct3),
        .address(address),
        .write_data(write_data),
        .read_data(read_data)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        MemRead  = 1'b0;
        MemWrite = 1'b0;
        funct3   = 3'b010; // Word access
        address  = 32'd0;
        write_data = 32'h00000000;
        #20;

        // Store a word
        MemWrite   = 1'b1;
        address    = 32'd16;
        write_data = 32'hDEADBEEF;
        #10;

        MemWrite = 1'b0;
        #10;

        // Read the word back
        MemRead = 1'b1;
        address = 32'd16;
        funct3  = 3'b010;
        #20;

        MemRead = 1'b0;
        #20;
    end

endmodule