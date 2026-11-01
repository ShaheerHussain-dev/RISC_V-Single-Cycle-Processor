`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2026 03:32:28 PM
// Design Name: 
// Module Name: register_file
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


module register_file #(
    parameter integer DATA_WIDTH = 32,
    parameter integer ADDRESS_WIDTH = 5,
    parameter integer REGISTER_COUNT = 32
)(
    input logic clk,
    input logic write_enable,
    input logic [ADDRESS_WIDTH-1:0] read_address1,
    input logic [ADDRESS_WIDTH-1:0] read_address2,
    input logic [ADDRESS_WIDTH-1:0] write_address,
    input logic [DATA_WIDTH-1:0] write_data,
    output logic [DATA_WIDTH-1:0] read_data1,
    output logic [DATA_WIDTH-1:0] read_data2
);

    logic [DATA_WIDTH-1:0] registers [0:REGISTER_COUNT-1];
    integer i;

    initial begin
        for (i = 0; i < REGISTER_COUNT; i = i + 1)
            registers[i] = '0;

        $readmemh("regmem.mem", registers);
        registers[0] = '0;
    end

    always_comb begin
        if (read_address1 == 0)
            read_data1 = '0;
        else
            read_data1 = registers[read_address1];

        if (read_address2 == 0)
            read_data2 = '0;
        else
            read_data2 = registers[read_address2];
    end

    always_ff @(posedge clk) begin
        if (write_enable && write_address != 0)
            registers[write_address] <= write_data;

        registers[0] <= '0;
    end

endmodule
