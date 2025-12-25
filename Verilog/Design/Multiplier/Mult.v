module multiplier (
    input A0, A1, A2, A3,
    input B0, B1, B2, B3,
    output out0, out1, out2, out3, out4, out5, out6, out7
);

    wire pp00, pp01, pp02, pp03;
    wire pp10, pp11, pp12, pp13;
    wire pp20, pp21, pp22, pp23;
    wire pp30, pp31, pp32, pp33;
    
    assign pp00 = A0 & B0;
    assign pp01 = A1 & B0;
    assign pp02 = A2 & B0;
    assign pp03 = A3 & B0;
    
    assign pp10 = A0 & B1;
    assign pp11 = A1 & B1;
    assign pp12 = A2 & B1;
    assign pp13 = A3 & B1;
    
    assign pp20 = A0 & B2;
    assign pp21 = A1 & B2;
    assign pp22 = A2 & B2;
    assign pp23 = A3 & B2;
    
    assign pp30 = A0 & B3;
    assign pp31 = A1 & B3;
    assign pp32 = A2 & B3;
    assign pp33 = A3 & B3;
    
    wire s11, s12, s13;
    wire c11, c12, c13, c14;
    
    wire s21, s22, s23;
    wire c21, c22, c23, c24;
    
    wire c31, c32, c33;
    
    assign out0 = pp00;
    
    full_adder fa1 (.A(pp01), .B(pp10), .Cin(gnd), .out(out1), .cout(c11));
    full_adder fa11 (.A(pp02), .B(pp11), .Cin(c11), .out(s11), .cout(c12));
    full_adder fa12 (.A(pp03), .B(pp12), .Cin(c12), .out(s12), .cout(c13));
    full_adder fa13 (.A(pp13), .B(gnd), .Cin(c13), .out(s13), .cout(c14));
    
    full_adder fa2 (.A(s11), .B(pp20), .Cin(gnd), .out(out2), .cout(c21));
    full_adder fa21 (.A(s12), .B(pp21), .Cin(c21), .out(s21), .cout(c22));
    full_adder fa22 (.A(s13), .B(pp22), .Cin(c22), .out(s22), .cout(c23));
    full_adder fa23 (.A(c14), .B(pp23), .Cin(c23), .out(s23), .cout(c24));
    
    full_adder fa3 (.A(s21), .B(pp30), .Cin(gnd), .out(out3), .cout(c31));
    full_adder fa31 (.A(s22), .B(pp31), .Cin(c31), .out(out4), .cout(c32));
    full_adder fa32 (.A(s23), .B(pp32), .Cin(c32), .out(out5), .cout(c33));
    full_adder fa33 (.A(c24), .B(pp33), .Cin(c33), .out(out6), .cout(out7));

endmodule