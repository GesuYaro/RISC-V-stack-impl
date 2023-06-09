`timescale 1ns / 1ps


module lifo (
    input clk,
    input rst, 
    input en,
    input mode,
    input [15:0] data_i,
    output reg empty, 
    output reg full, 
    output [15:0] data_o,
	output reg [3:0] amount
);

parameter POP_MODE = 0;
parameter PUSH_MODE = 1;

reg [15:0] mem[7:0];
reg [3:0] ptr = 0;

wire[15:0] mem0;
wire[15:0] mem1;
wire[15:0] mem2;
wire[15:0] mem3;
wire[15:0] mem4;
wire[15:0] mem5;
wire[15:0] mem6;
wire[15:0] mem7; 

assign mem0 = mem[0];
assign mem1 = mem[1];
assign mem2 = mem[2];
assign mem3 = mem[3];
assign mem4 = mem[4];
assign mem5 = mem[5];
assign mem6 = mem[6];
assign mem7 = mem[7];

assign data_o = (en && (mode == POP_MODE) && (ptr > 0)) ? mem[ptr - 1] : 0;

always@ (posedge clk or negedge rst) begin

    if(!rst) begin
        ptr <= 0; 
        empty <= 1; 
        full <= 0;
        amount <= 0;
    end else
        if(en)
            if(mode == PUSH_MODE && !full) begin
                empty <= 0;
                mem[ptr] <= data_i;
                if (ptr + 1 == 8) full <= 1;
                ptr <= ptr + 1;
                amount <= ptr + 1;
            end
            else if(mode == POP_MODE && !empty) begin
                full <= 0;
                // data_o <= mem[ptr - 1];
                ptr <= ptr - 1;
                amount <= ptr - 1;
                if (ptr == 1) empty <= 1;
            end
end
endmodule

