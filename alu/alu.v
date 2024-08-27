/*
 *
 *
 *
 */
module alu(
    input[31:0] in1,
    input[31:0] in2,
    input[3:0] alu_control,
    output reg [31:0] out,
    output reg zero_flag);


    always@(*)begin
        case(alu_control)
            4'b0000: out = in1 & in2;
            4'b0001: out = in1 | in2;
            4'b0010: out = in1 + in2;
            4'b0011: out = in1 << in2;
            4'b0100: out = in1 - in2;
            4'b0101: out = in1 >> in2;
            4'b0110: out = in1 * in2;
            4'b0111: out  = in1 ^ in2;
            4'b1000: begin
                if(in1 < in2) out = 1;
                else out = 0;
            end
        endcase
        if(out == 0) zero_flag = 1'b1;
        else zero_flag = 1'b0;
    end
endmodule
