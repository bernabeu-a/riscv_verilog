/*
 *
 *
 *
 */

`include "../fill_instr/fill_instr.v"

module fetch(
    input clk,
    input reset,
    output [31:0] instr);

    reg [31:0] pc = 32'b0;

    /* Initialize instruction memory */
    fill_instr fill_instr_unit(.pc (pc), .reset (reset), .instr (instr));

    always @(posedge clk or posedge reset)begin
        if(reset == 1) pc <= 0;
        else pc <= pc +4;
    end
endmodule
