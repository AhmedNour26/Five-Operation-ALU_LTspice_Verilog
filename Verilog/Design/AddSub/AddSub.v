module AddSub(
    input A0, A1, A2, A3,
    input B0, B1, B2, B3,
    input Cin,
    output out0, out1, out2, out3, out4, out5, out6, out7
);

    wire w1, w2, w3, w4, w5, w6, w7, w8;
    wire w9, w10, w11, w12, w13, w14, w15, w16;

    assign w1 = B0 ^ Cin;
    assign w2 = B1 ^ Cin;
    assign w3 = B2 ^ Cin;
    assign w4 = B3 ^ Cin;
    assign w5 = B3 ^ Cin;
    assign w6 = B3 ^ Cin;
    assign w7 = B3 ^ Cin;
    assign w8 = B3 ^ Cin;

    full_adder inst1 (.A(A0), .B(w1), .Cin(Cin), .out(out0), .cout(w9));
    full_adder inst2 (.A(A1), .B(w2), .Cin(w9),  .out(out1), .cout(w10));
    full_adder inst3 (.A(A2), .B(w3), .Cin(w10), .out(out2), .cout(w11));
    full_adder inst4 (.A(A3), .B(w4), .Cin(w11), .out(out3), .cout(w12));
    full_adder inst5 (.A(A3), .B(w5), .Cin(w12), .out(out4), .cout(w13));
    full_adder inst6 (.A(A3), .B(w6), .Cin(w13), .out(out5), .cout(w14));
    full_adder inst7 (.A(A3), .B(w7), .Cin(w14), .out(out6), .cout(w15));
    full_adder inst8 (.A(A3), .B(w8), .Cin(w15), .out(out7), .cout(w16));

endmodule