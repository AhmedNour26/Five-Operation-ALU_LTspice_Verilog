module Reminder_b (
    input [3:0] A, 
    input [3:0] B,
    output [3:0] out
);
    wire d1,d2,d3,d4;
    wire [2:0] cc1,cc2,cc3,cc4;
    wire [2:0] ra1,ra2,ra3;
    
    block1_mod x4(.A(0), .B(~B[3]), .Cin(cc1[0]), .D(d1),.N(d1), .Cout(), .R());
    block1_mod x3(.A(0), .B(~B[2]), .Cin(cc1[1]), .D(),.N(d1), .Cout(cc1[0]), .R(ra1[0]));
    block1_mod x2(.A(0), .B(~B[1]), .Cin(cc1[2]), .D(),.N(d1), .Cout(cc1[1]), .R(ra1[1]));
    block1_mod x1(.A(A[3]), .B(~B[0]), .Cin(1), .D(),.N(d1), .Cout(cc1[2]), .R(ra1[2]));

    block1_mod x12(.A(ra1[0]), .B(~B[3]), .Cin(cc2[0]), .D(d2),.N(d2), .Cout(), .R());
    block1_mod x11(.A(ra1[1]), .B(~B[2]), .Cin(cc2[1]), .D(),.N(d2), .Cout(cc2[0]), .R(ra2[0]));
    block1_mod x10(.A(ra1[2]), .B(~B[1]), .Cin(cc2[2]), .D(),.N(d2), .Cout(cc2[1]), .R(ra2[1]));
    block1_mod x9(.A(A[2]), .B(~B[0]), .Cin(1), .D(),.N(d2), .Cout(cc2[2]), .R(ra2[2]));

    block1_mod x16(.A(ra2[0]), .B(~B[3]), .Cin(cc3[0]), .D(d3),.N(d3), .Cout(), .R());
    block1_mod x15(.A(ra2[1]), .B(~B[2]), .Cin(cc3[1]), .D(),.N(d3), .Cout(cc3[0]), .R(ra3[0]));
    block1_mod x14(.A(ra2[2]), .B(~B[1]), .Cin(cc3[2]), .D(),.N(d3), .Cout(cc3[1]), .R(ra3[1]));
    block1_mod x13(.A(A[1]), .B(~B[0]), .Cin(1), .D(),.N(d3), .Cout(cc3[2]), .R(ra3[2]));

    block1_mod x20(.A(ra3[0]), .B(~B[3]), .Cin(cc4[0]), .D(d4),.N(d4), .Cout(), .R(out[3]));
    block1_mod x19(.A(ra3[1]), .B(~B[2]), .Cin(cc4[1]), .D(),.N(d4), .Cout(cc4[0]), .R(out[2]));
    block1_mod x18(.A(ra3[2]), .B(~B[1]), .Cin(cc4[2]), .D(),.N(d4), .Cout(cc4[1]), .R(out[1]));
    block1_mod x17(.A(A[0]), .B(~B[0]), .Cin(1), .D(),.N(d4), .Cout(cc4[2]), .R(out[0]));

endmodule
