module ALU_tb;
    reg  [3:0] A_tb, B_tb;   
    reg  [2:0] Sel_tb;  
    wire  [7:0] C_tb; 
    wire  Zero_F_tb, D_Zero_F_tb, Sign_F_tb;
    wire  [7:0] C_exp;
    wire  Zero_F_exp, D_Zero_F_exp, Sign_F_exp;
    integer error_count; 

    ALU_Gm GM (
        .A(A_tb), .B(B_tb), .Sel(Sel_tb), .Zero_F(Zero_F_exp), .D_Zero_F(D_Zero_F_exp), .Sign_F(Sign_F_exp), .C(C_exp)
    );

    ALU_top DUT (
        .A(A_tb), .B(B_tb), .Sel(Sel_tb), .Zero_Flag(Zero_F_tb), .DZ_Flag(D_Zero_F_tb), .Sign_flag(Sign_F_tb), .out(C_tb)
    );

    initial begin
        forever begin
            #128 A_tb[0] = ~A_tb[0];
        end
    end
    initial begin
       forever begin
            #64 A_tb[1] = ~A_tb[1];
        end 
    end
    initial begin
       forever begin
            #32 A_tb[2] = ~A_tb[2];
        end 
    end
    initial begin
        forever begin
            #16 A_tb[3] = ~A_tb[3];
        end
    end
    initial begin
        forever begin
            #8 B_tb[0] = ~B_tb[0];
        end
    end
    initial begin
        forever begin
            #4 B_tb[1] = ~B_tb[1];
        end
    end
    initial begin
        forever begin
            #2 B_tb[2] = ~B_tb[2];
        end
    end
    initial begin
        forever begin
            #1 B_tb[3] = ~B_tb[3];
        end
    end
    initial begin
        error_count = 0;

        A_tb   = 0;
        B_tb   = 0;
        Sel_tb = 0;
        #128; 
        A_tb   = 0;
        B_tb   = 0;
        Sel_tb = 1;
        #128; 
        A_tb   = 0;
        B_tb   = 0;
        Sel_tb = 2;
        #128;
        A_tb   = 0;
        B_tb   = 0;
        Sel_tb = 3;
        #128;
        A_tb   = 0;
        B_tb   = 0;
        Sel_tb = 4;
        #128; 

        $display("Test done with %d errors out of 640 test case",error_count);
        $finish;
    end
    initial begin
        forever begin
            #1;
            if(C_exp !== C_tb || Sign_F_exp !== Sign_F_tb || D_Zero_F_exp !== D_Zero_F_tb || Zero_F_exp !== Zero_F_tb)begin
                $display("error: input: A: %h, B: %h, Sel: %h, Output: out exp: %h found: %h, sign exp: %h found: %h, Dz exp: %h found: %h, Zero exp: %h found: %h", A_tb, B_tb, Sel_tb, C_exp, C_tb, Sign_F_exp, Sign_F_tb, D_Zero_F_exp, D_Zero_F_tb, Zero_F_exp, Zero_F_tb);
                error_count = error_count + 1;
            end
        end
    end



endmodule