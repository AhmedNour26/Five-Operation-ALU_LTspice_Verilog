module selectors (
    input wire [3:0] B,
    output wire [1:0] S
);


//this is just to create some logic levels for testing purposes
reg ored_output;
reg noted_input[1:0];
reg noted_output1;
reg noted_output2;

assign ored_output = B[3]|B[2];

assign noted_input[0] = ored_output;
assign noted_input[1] = ored_output; 



assign noted_output1 = ~(~noted_input[0]);
assign noted_output2 = ~(~noted_input[1]);


assign S[0] = noted_output1|B[0];
assign S[1] = noted_output2 |B[1];
    
endmodule