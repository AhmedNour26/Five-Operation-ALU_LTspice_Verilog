module full_adder(
    input A, B, Cin,
    output out, cout
);
    wire w1, w2, w3;
    assign w1 = A ^ B;
    assign out = w1 ^ Cin;
    assign w2 = w1 & Cin;
    assign w3 = A & B;
    assign cout = w2 | w3;

endmodule