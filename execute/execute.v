/*
 *
 *
 *
 */

`include "../alu/alu.v"

module execute(
    input [4:0] rs1,
    input [4:0] rs2,
    input [4:0] rd,
    input [3:0] alu_control,
    input write_en,
    input clk,
    input reset,
    output zero_flag);

    wire [31:0] rs1_data;
    wire [31:0] rs2_data;
    wire [31:0] rd_data;

    reg [31:0] reg_file [31:0]; /* 32 registers, 32-bit wide */

    integer i;
    /* Initialize register file */
    initial begin
        for (i=0; i<32; i = i+1) begin
            reg_file[i] = i;
        end
    end

    assign rs1_data = reg_file[rs1];
    assign rs2_data = reg_file[rs2];

    always @(posedge clk) begin
        if(write_en) begin
            reg_file[rd] = rd_data;
        end
    end
    alu alu_unit(.in1 (rs1_data), .in2(rs2_data), .alu_control (alu_control),
                 .out (rd_data), .zero_flag (zero_flag));


endmodule
