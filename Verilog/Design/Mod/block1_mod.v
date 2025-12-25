module block1_mod (
    input A,B,Cin,N,
    output D,Cout,R
);
    full_adder X1 (
        .A(A),
        .B(B),
        .Cin(Cin),
        .out(D),
        .cout(Cout)
    );
    
    mux21 X2 (
        .A(D),     
        .B(A),                  
        .S(N),                 
        .out(R)                
    );

endmodule
