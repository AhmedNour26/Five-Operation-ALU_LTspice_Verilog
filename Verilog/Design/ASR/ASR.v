module ASR(
    input wire [3:0] A,
    input wire [3:0] B,
    output wire [7:0] Y
);
wire [1:0] S;
selectors selector_instance (
    .B(B),
    .S(S)
);
shifting_circuit shifting_instance (
    .A(A),
    .S(S),
    .Y(Y)
);

endmodule