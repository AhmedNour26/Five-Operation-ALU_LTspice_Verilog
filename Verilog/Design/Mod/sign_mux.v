module sign_mux (
    input [3:0] A, 
    input Sel,
    output [3:0] out
);
    wire w0,w1,w2,w3;
    AddSub x1(
        .A0(~A[0]), .A1(~A[1]), .A2(~A[2]), .A3(~A[3]), .B0(1), .B1(0), .B2(0), .B3(0), .cin(0),
        .out0(w0), .out1(w1), .out2(w2), .out3(w3)
    );
    mux21 x6(
        .A(A[0]), .B(w0), .S(Sel&1), out(out[0])
    );
    mux21 x5(
        .A(A[1]), .B(w1), .S(Sel&1), out(out[1])
    );
    mux21 x4(
        .A(A[2]), .B(w2), .S(Sel&1), out(out[2])
    );
    mux21 x2(
        .A(A[3]), .B(w3), .S(Sel&1), out(out[3])
    );
endmodule 