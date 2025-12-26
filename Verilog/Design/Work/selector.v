module selectors (
    input wire [3:0] B,
    output wire [1:0] S
);

wire ored_output;

assign ored_output = B[3]|B[2];

assign S[0] = ored_output|B[0];
assign S[1] = ored_output |B[1];
    
endmodule 