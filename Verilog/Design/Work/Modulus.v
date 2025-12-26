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
    assign D_by_zero_f = d;
    wire [7:0] w;

    sign_mux x2(
        .A(A),
        .Sel(A[3]),
        .out(w[3:0])
    );
    sign_mux x3(
        .A(B),
        .Sel(B[3]),
        .out(w[7:4])
    );
    wire [3:0] ww;
    Reminder_b x1(
        .A(w[3:0]),
        .B(w[7:4]),
        .out(ww[3:0])
    );
    wire [3:0] www;
    sign_mux x4(
        .A(ww[3:0]),
        .Sel(A[3]),
        .out(www[3:0])
    );
    wire [3:0] wwww;
    
    mux21 x5(
        .A(www[0]),
        .B(0),
        .S(d),
        .out(wwww[0])
    );
    mux21 x6(
        .A(www[1]),
        .B(0),
        .S(d),
        .out(wwww[1])
    );
    mux21 x7(
        .A(www[2]),
        .B(0),
        .S(d),
        .out(wwww[2])
    );
    mux21 x8(
        .A(www[3]),
        .B(0),
        .S(d),
        .out(wwww[3])
    );
    AddSub x13(
        .A0(wwww[0]),
        .A1(wwww[1]),
        .A2(wwww[2]),
        .A3(wwww[3]),
        .B0(0),
        .B1(0),
        .B2(0),
        .B3(0),
        .Cin(0),
        .out0(out[0]),
        .out1(out[1]),
        .out2(out[2]),
        .out3(out[3]),
        .out4(out[4]),
        .out5(out[5]),
        .out6(out[6]),
        .out7(out[7])
    );
    
endmodule