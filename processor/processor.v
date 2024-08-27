/*
 *
 *
 *
 */

`include "../fetch/fetch.v"
`include "../decode/decode.v"
`include "../execute/execute.v"

module processor(
    input clk,
    input reset,
    output zero_flag);

    wire [31:0] instr;
    wire [3:0] alu_control;
    wire write_en;

    wire [6:0] func7;
    wire [2:0] func3;
    wire [6:0] opcode;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [4:0] rd;

    assign func7 = instr[31:25];
    assign func3 = instr[14:12];
    assign opcode = instr[6:0];

    assign rs1 = instr[19:15];
    assign rs2 = instr[24:20];
    assign rd = instr[11:7];

    fetch fetch_unit(.clk (clk), .reset(reset), .instr (instr));
    decode decode_unit(.func7 (func7), .func3 (func3), .opcode (opcode),
                       .alu_control (alu_control), .write_en(write_en));
    execute execute_unit(.rs1 (rs1), .rs2 (rs2), .rd (rd), .alu_control (alu_control),
                         .write_en (write_en), .clk (clk), .reset (reset), .zero_flag (zero_flag));

endmodule
