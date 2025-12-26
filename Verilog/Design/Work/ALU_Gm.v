module ALU_Gm(
    input  signed [3:0] A, B,
    input  [2:0] Sel,

    output signed [7:0] C,
    output Zero_F,
    output D_Zero_F,
    output Sign_F
);

    reg signed [7:0] C_reg;

    always @(*) begin
        case (Sel)
            0: C_reg = A + B;                 
            1: C_reg = A - B;                 
            2: C_reg = A * B;                 
            3: C_reg = (B == 0) ? 8'sd0 : A % B; 
            4: C_reg = A >>> B;        
            default: C_reg = 0;   
        endcase
    end

    assign C        = C_reg;
    assign Zero_F   = (C_reg == 0);
    assign D_Zero_F = (Sel == 3 && B == 0);
    assign Sign_F   = C_reg[7];

endmodule
