module shifting_circuit (
    input wire [3:0] A,
    input wire [1:0] S,
    output wire [7:0] Y
);

assign Y[4] = Y[3];
assign Y[5] = Y[4];
assign Y[6] = Y[5];
assign Y[7] = Y[6];

mux41 mux_instance3 (
    .A0(A[3]), 
    .A1(A[3]),
    .A2(A[3]),
    .A3(A[3]), 
    .S0(S[0]),
    .S1(S[1]),
    .out(Y[3])
);

mux41 mux_instance2 (
    .A0(A[2]), 
    .A1(A[3]),
    .A2(A[3]),
    .A3(A[3]),  
    .S0(S[0]),
    .S1(S[1]),
    .out(Y[2])
);

mux41 mux_instance1 (
    .A0(A[1]), 
    .A1(A[2]),
    .A2(A[3]),
    .A3(A[3]), 
    .S0(S[0]),
    .S1(S[1]),
    .out(Y[1])
);

mux41 mux_instance0 (
    .A0(A[0]), 
    .A1(A[1]),
    .A2(A[2]),
    .A3(A[3]), 
    .S0(S[0]),
    .S1(S[1]),
    .out(Y[0])
);

endmodule