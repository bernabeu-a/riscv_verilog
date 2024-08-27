/*
 *
 *
 *
 */
module fill_instr(
    input [31:0] pc,
    input reset,
    output [31:0] instr);

    reg [7:0] mem[31:0];
    assign instr = {mem[pc+3], mem[pc+2], mem[pc+1], mem[pc]};

    always @(reset)begin
        if (reset == 1) begin
            // Setting 32-bit instruction: add t1, s0,s1 => 0x00940333
            mem[3] = 8'h00;
            mem[2] = 8'h94;
            mem[1] = 8'h03;
            mem[0] = 8'h33;
            /* s0 = 8, s1 = 9, t1 = 6 */
            /* t1 <= 8+9 */
            // Setting 32-bit instruction: sub t2, s2, s3 => 0x413903b3
            mem[7] = 8'h41;
            mem[6] = 8'h39;
            mem[5] = 8'h03;
            mem[4] = 8'hb3;
            /* s2 = 18, s3 = 19, t2 = 7*/
            /* t2 <= -1 */
            // Setting 32-bit instruction: mul t0, s4, s5 => 0x035a02b3
            mem[11] = 8'h03;
            mem[10] = 8'h5a;
            mem[9] = 8'h02;
            mem[8] = 8'hb3;
            // Setting 32-bit instruction: xor t3, s6, s7 => 0x017b4e33
            mem[15] = 8'h01;
            mem[14] = 8'h7b;
            mem[13] = 8'h4e;
            mem[12] = 8'h33;
            // Setting 32-bit instruction: sll t4, s8, s9
            mem[19] = 8'h01;
            mem[18] = 8'h9c;
            mem[17] = 8'h1e;
            mem[16] = 8'hb3;
            // Setting 32-bit instruction: srl t5, s10, s11
            mem[23] = 8'h01;
            mem[22] = 8'hbd;
            mem[21] = 8'h5f;
            mem[20] = 8'h33;
            // Setting 32-bit instruction: and t6, a2, a3
            mem[27] = 8'h00;
            mem[26] = 8'hd6;
            mem[25] = 8'h7f;
            mem[24] = 8'hb3;
            // Setting 32-bit instruction: or a7, a4, a5
            mem[31] = 8'h00;
            mem[30] = 8'hf7;
            mem[29] = 8'h68;
            mem[28] = 8'hb3;
        end
    end
endmodule
