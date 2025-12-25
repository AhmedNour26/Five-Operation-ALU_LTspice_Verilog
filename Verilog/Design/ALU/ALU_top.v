module ALU_top(
    input [3:0] A, B,
    input [2:0] Sel,
    output Sign_flag, DZ_Flag, Zero_Flag,
    output [7:0] out
);
    wire w1, w2, w3, w4, w5, cin, DZ_Flag_w, S0, S1, ws1, ws2, ws3, ws4, ws5, ws6, ws7;
    wire [7:0] out_as, out_mul, out_mod, out_asr;

    assign w1 = ~Sel[1];
    assign cin = w1 & Sel[0];

    AddSub inst0 (
        .A0(A[0]), .A1(A[1]), .A2(A[2]), .A3(A[3]), .B0(B[0]), .B1(B[1]), .B2(B[2]), .B3(B[3]), .Cin(cin), 
        .out0(out_as[0]), .out1(out_as[1]), .out2(out_as[2]), .out3(out_as[3]), .out4(out_as[4]), .out5(out_as[5]), 
        .out6(out_as[6]), .out7(out_as[7])
    );
    multiplier inst1 (
        .A0(A[0]), .A1(A[1]), .A2(A[2]), .A3(A[3]), .B0(B[0]), .B1(B[1]), .B2(B[2]), .B3(B[3]),
        .out0(out_mul[0]), .out1(out_mul[1]), .out2(out_mul[2]), .out3(out_mul[3]), .out4(out_mul[4]), .out5(out_mul[5]), 
        .out6(out_mul[6]), .out7(out_mul[7])
    );
    Modulus inst2 (
        .A0(A[0]), .A1(A[1]), .A2(A[2]), .A3(A[3]), .B0(B[0]), .B1(B[1]), .B2(B[2]), .B3(B[3]),
        .out0(out_mod[0]), .out1(out_mod[1]), .out2(out_mod[2]), .out3(out_mod[3]), .out4(out_mod[4]), .out5(out_mod[5]), 
        .out6(out_mod[6]), .out7(out_mod[7]), .D_by_Zero_f(DZ_Flag_w)
    );
    ASR inst3 (
        .A0(A[0]), .A1(A[1]), .A2(A[2]), .A3(A[3]), .B0(B[0]), .B1(B[1]), .B2(B[2]), .B3(B[3]),
        .out0(out_asr[0]), .out1(out_asr[1]), .out2(out_asr[2]), .out3(out_asr[3]), .out4(out_asr[4]), .out5(out_asr[5]), 
        .out6(out_asr[6]), .out7(out_asr[7])
    );

    assign w3 = ~Sel[0];
    assign w4 = w3 & Sel[1];
    assign S0 = w4 | Sel[2];
    assign w5 = Sel[0] & Sel[1];
    assign S1 = Sel[2] | w5;

    mux41 out0_inst (.A0(out_as[0]), .A1(out_mul[0]), .A2(out_mod[0]), .A3(out_as[0]), .S0(S0), .S1(S1), .out(out[0]));
    mux41 out1_inst (.A0(out_as[1]), .A1(out_mul[1]), .A2(out_mod[1]), .A3(out_as[1]), .S0(S0), .S1(S1), .out(out[1]));
    mux41 out2_inst (.A0(out_as[2]), .A1(out_mul[2]), .A2(out_mod[2]), .A3(out_as[2]), .S0(S0), .S1(S1), .out(out[2]));
    mux41 out3_inst (.A0(out_as[3]), .A1(out_mul[3]), .A2(out_mod[3]), .A3(out_as[3]), .S0(S0), .S1(S1), .out(out[3]));
    mux41 out4_inst (.A0(out_as[4]), .A1(out_mul[4]), .A2(out_mod[4]), .A3(out_as[4]), .S0(S0), .S1(S1), .out(out[4]));
    mux41 out5_inst (.A0(out_as[5]), .A1(out_mul[5]), .A2(out_mod[5]), .A3(out_as[5]), .S0(S0), .S1(S1), .out(out[5]));
    mux41 out6_inst (.A0(out_as[6]), .A1(out_mul[6]), .A2(out_mod[6]), .A3(out_as[6]), .S0(S0), .S1(S1), .out(out[6]));
    mux41 out7_inst (.A0(out_as[7]), .A1(out_mul[7]), .A2(out_mod[7]), .A3(out_as[7]), .S0(S0), .S1(S1), .out(out[7]));

    assign w2 = Sel[0] & Sel[1];
    mux21 inst4 (.A(0), .B(DZ_Flag_w), .S(w2), .out(DZ_Flag));

    assign Sign_flag = out[7];
    
    assign ws1 = out[0] | out[1];
    assign ws2 = out[2] | out[3];
    assign ws3 = out[4] | out[5];
    assign ws4 = out[6] | out[7];
    assign ws5 = ws1 | ws2;
    assign ws6 = ws3 | ws4;
    assign ws7 = ws5 |ws6;
    assign Zero_Flag = ~ws7;

endmodule