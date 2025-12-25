module Modulus(
    input [3:0] A,B,
    output [7:0] out , 
    output D_by_zero_f
);
    wire a,b,c,d;
    assign a=B[0]|B[1];
    assign b=B[2]|B[3];
    assign c=a|b;
    assign d=~c;
    assign D_by_zero_f=d;
    wire [7:0] w;
    sign_mux x2(
        .A[0](A[0]),
        .A[1](A[1]),
        .A[2](A[2]),
        .A[3](A[3]),
        .Sel(A[3]),
        .out[0](w[0]),
        .out[1](w[1]),
        .out[2](w[2]),
        .out[3](w[3])
    );
    sign_mux x3(
        .A[0](B[0]),
        .A[1](B[1]),
        .A[2](B[2]),
        .A[3](B[3]),
        .Sel(B[3]),
        .out[0](w[4]),
        .out[1](w[5]),
        .out[2](w[6]),
        .out[3](w[7])
    );
    wire [3:0] ww;
    Reminder_b x1(
        .A[0](w[0]),
        .A[1](w[1]),
        .A[2](w[2]),
        .A[3](w[3]),
        .B[0](w[4]),
        .B[1](w[5]),
        .B[2](w[6]),
        .B[3](w[7]),
        .out[0](ww[0]),
        .out[1](ww[1]),
        .out[2](ww[2]),
        .out[3](ww[3])
    );
    wire [3:0] www;
    sign_mux x4(
        .A[0](ww[0]),
        .A[1](ww[1]),
        .A[2](ww[2]),
        .A[3](ww[3]),
        .Sel(A[3]),
        .out[0](www[0]),
        .out[1](www[1]),
        .out[2](www[2]),
        .out[3](www[3])
    );
    wire [3:0] wwww;
    mux21 x5(
        .A(www[0]),
        .B(0),
        .S(d),
        ,out(wwww[0])
    );
    mux21 x6(
        .A(www[1]),
        .B(0),
        .S(d),
        ,out(wwww[1])
    );
    mux21 x7(
        .A(www[2]),
        .B(0),
        .S(d),
        ,out(wwww[2])
    );
    mux21 x8(
        .A(www[3]),
        .B(0),
        .S(d),
        ,out(wwww[3])
    );
    Reminder_b x13(
        .A[0](wwww[0]),
        .A[1](wwww[1]),
        .A[2](wwww[2]),
        .A[3](wwww[3]),
        .B[0](0),
        .B[1](0),
        .B[2](0),
        .B[3](0),
        .out[0](out[0]),
        .out[1](out[1]),
        .out[2](out[2]),
        .out[3](out[3]),
        .out[4](out[4]),
        .out[5](out[5]),
        .out[6](out[6]),
        .out[7](out[7])
    );
    
endmodule