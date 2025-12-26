`timescale 1ns / 1ps

module ASR_TB;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;

    // Outputs
    wire [7:0] Y;

    // Instantiate the Unit Under Test (UUT)
    ASR uut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    // Variables for self-checking
    reg [7:0] expected_Y;
    reg [1:0] shift_amt;
    integer fail_count = 0;

    initial begin
        // Initialize Inputs
        A = 0;
        B = 0;

        // Wait 100 ns for global reset to finish
        #100;

        $display("Starting Self-Checking Testbench for ASR Module");
        $display("------------------------------------------------");

        // Test Case 1: A=4 (0100), B=0 -> Shift 0
        run_test(4'b0100, 4'b0000, 1);

        // Test Case 2: A=4 (0100), B=1 -> Shift 1
        run_test(4'b0100, 4'b0001, 2);

        // Test Case 3: A=4 (0100), B=2 -> Shift 2
        run_test(4'b0100, 4'b0010, 3);

        // Test Case 4: A=4 (0100), B=3 -> Shift 3
        run_test(4'b0100, 4'b0011, 4);

        // Test Case 5: A=4 (0100), B=5 -> Shift 3 (Saturation)
        run_test(4'b0100, 4'b0101, 5);

        // Test Case 6: A=-4 (1100), B=0 -> Shift 0
        run_test(4'b1100, 4'b0000, 6);

        // Test Case 7: A=-4 (1100), B=1 -> Shift 1
        run_test(4'b1100, 4'b0001, 7);

        // Test Case 8: A=-4 (1100), B=2 -> Shift 2
        run_test(4'b1100, 4'b0010, 8);

        // Test Case 9: A=-4 (1100), B=3 -> Shift 3
        run_test(4'b1100, 4'b0011, 9);

        // Test Case 10: A=-8 (1000), B=1 -> Shift 1
        run_test(4'b1000, 4'b0001, 10);

        $display("------------------------------------------------");
        if (fail_count == 0)
            $display("All test cases PASSED.");
        else
            $display("%0d test cases FAILED.", fail_count);
        
        $stop;
    end

    task run_test;
        input [3:0] in_A;
        input [3:0] in_B;
        input integer test_num;
        begin
            A = in_A;
            B = in_B;
            
            // Calculate expected output based on selectors.v logic
            if (in_B[3] | in_B[2])
                shift_amt = 2'b11;
            else
                shift_amt = in_B[1:0];
            
            // Arithmetic shift right with sign extension
            // Construct 8-bit sign-extended version of A first
            expected_Y = $signed({{4{in_A[3]}}, in_A}) >>> shift_amt;

            #10; // Wait for output to settle

            if (Y !== expected_Y) begin
                $display("Test Case %0d FAILED", test_num);
                $display("  Inputs: A = %b, B = %b", in_A, in_B);
                $display("  Expected Y = %b, Got Y = %b", expected_Y, Y);
                fail_count = fail_count + 1;
            end else begin
                $display("Test Case %0d PASSED: A=%b, B=%b -> Y=%b", test_num, in_A, in_B, Y);
            end
        end
    endtask

endmodule
