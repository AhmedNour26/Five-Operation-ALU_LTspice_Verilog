module mux21(
    input A, B, S,
    output out
);
    wire w1, w2, w3;
    assign w1 = ~S;
    assign w2 = A & w1;
    assign w3 = B & S;
    assign out = w2 | w3;
endmodule