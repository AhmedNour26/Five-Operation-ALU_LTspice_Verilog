module ALU_Gm(
    input  signed [3:0] A, B,
    input  [2:0] Sel,

    output signed [7:0] C,
    output Zero_F,
    output D_Zero_F,
    output Sign_F
);
    wire [7:0] C_temp;
    assign C_temp =
        (Sel == 0) ? $signed(A) + $signed(B) :
        (Sel == 1) ? $signed(A) - $signed(B) :
        (Sel == 2) ? $signed(A) * $signed(B) :
        (Sel == 3) ? ((B == 0) ? 0 : $signed(A % B)) :
                        $signed(A) >>> $unsigned(B);

    assign C = {C_temp[3], C_temp[3], C_temp[3], C_temp[3], C_temp[3:0]};
    assign Zero_F   = (C == 0);
    assign D_Zero_F = (Sel == 3 && B == 0);
    assign Sign_F   = C[7];

endmodule
