/*
 *
 *
 *
 */

module decode(
    input [6:0] func7,
    input [2:0] func3,
    input [6:0] opcode,
    output reg [3:0] alu_control,
    output reg write_en);

    always @(func3 or func7 or opcode) begin
        if (opcode == 7'b0110011) begin /* R-type instr */
            write_en = 1;
            case (func3)
                3'b000: begin
                    if(func7 == 0) alu_control = 4'b0010; /* AND */
                    else if (func7 == 32) alu_control = 4'b0100; /* SUB */
                end
                3'b001: alu_control = 4'b0011; /* SLL */
                3'b010: alu_control = 4'b0110; /* MUL */
                3'b100: alu_control = 4'b0111; /* XOR */
                3'b101: alu_control = 4'b0101; /* SRL */
                3'b110: alu_control = 4'b0001; /* OR */
                3'b111: alu_control = 4'b0000; /* AND */
            endcase
        end
    end

endmodule
