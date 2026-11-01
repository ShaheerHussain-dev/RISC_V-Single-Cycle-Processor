`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/01/2026 03:21:00 PM
// Design Name: 
// Module Name: tb_regfile
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


module tb_regfile;

logic clk;
logic write_enable;
logic [4:0] read_address1;
logic [4:0] read_address2;
logic [4:0] write_address;
logic [31:0] write_data;
logic [31:0] read_data1;
logic [31:0] read_data2;

register_file uut(
    .clk(clk),
    .write_enable(write_enable),
    .read_address1(read_address1),
    .read_address2(read_address2),
    .write_address(write_address),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

initial begin
    clk = 0;
end

always #10 clk = ~clk;

initial begin

    write_enable = 0;
    read_address1 = 1;
    read_address2 = 2;
    write_address = 3;
    write_data = 32'd55;

    #20;

    write_enable = 1;
    write_address = 3;
    write_data = 32'd55;

    #20;

    write_enable = 0;
    read_address1 = 3;
    read_address2 = 1;

    #20;

    write_enable = 1;
    write_address = 4;
    write_data = 32'd100;

    #20;

    write_enable = 0;
    read_address1 = 4;
    read_address2 = 3;

    #20;

    read_address1 = 0;
    read_address2 = 0;

    #20;

    write_enable = 1;
    write_address = 0;
    write_data = 32'd999;

    #20;

    write_enable = 0;
    read_address1 = 0;
    read_address2 = 0;

    #20;

end

endmodule