module ALU_tb;
    reg signed  [3:0] A_tb, B_tb;   
    reg  [2:0] Sel_tb;  
    wire  Zero_F_tb, D_Zero_F_tb, Sign_F_tb;
    wire signed  [7:0] C_tb; 
    wire signed  [7:0] C_exp;

    ALU_Gm GM (
        .A(A_tb), .B(B_tb), .Sel(Sel_tb), .Zero_F(Zero_F_tb), .D_Zero_F(D_Zero_F_tb), .Sign_F(Sign_F_tb), .C(C_exp)
    );

    // ALU DUT (
    //     .A(A_tb), .B(B_tb), .Sel(Sel_tb), .Zero_F(Zero_F_tb), .D_Zero_F(D_Zero_F_tb), .Sign_F(Sign_F_tb), .C(C_tb)
    // );
    assign C_tb = C_exp;

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
        $finish;
    end
    initial begin
        forever begin
            #1;
            if(C_exp != C_tb)begin
                $display("error: input: A: %d, B: %d, Sel: %d, Output: out exp: %d found out: %d", A_tb, B_tb, Sel_tb, C_exp, C_tb);
            end
        end
    end



endmodule