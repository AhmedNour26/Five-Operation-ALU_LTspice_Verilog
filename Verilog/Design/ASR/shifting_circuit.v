module shifting_circuit (
    input wire [3:0] A,
    input wire [1:0] S,
    output wire [7:0] Y
);


wire Y3;

mux4x1 mux_instance3 (
    .A(A),
    .S(S),
    .Y(Y3)
);
assign Y[7:3] = {4{Y3}};

mux4x1 mux_instance2 (
    .A(A),
    .S(S),
    .Y(Y[2])
);
mux4x1 mux_instance1 (
    .A(A),
    .S(S),
    .Y(Y[1])
);
mux4x1 mux_instance0 (
    .A(A),
    .S(S),
    .Y(Y[0])
);

endmodule