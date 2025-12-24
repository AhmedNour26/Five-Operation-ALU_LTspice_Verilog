module mux41 ( 
    input A0, A1, A2, A3, S0, S1
    output out
);
    wire w1, w2;
    mux21 inst1 (.A(A0), .B(A1), .S(S0), .out(w1));
    mux21 inst2 (.A(A2), .B(A3), .S(S0), .out(w2));
    mux21 inst2 (.A(w1), .B(w2), .S(S1), .out(out));
endmodule