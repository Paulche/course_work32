module top_tb;
  reg     clk,rst_n;
  reg     data;
  reg [2:0] out;

    // Clock 
  initial begin
    clk = 0;
    forever #1 clk = ~clk;
  end
  
  top kursach( .clk(clk),
               .rst_n(rst_n),
               .data(data),
               .out(out));
    // Reset
  initial begin
    rst_n  = 1;
               
    #9 rst_n  = 0;
    #1 rst_n  = 1;
    #100 $finish;
  end
  
  // Test0   
  //initial begin
  //  data = 1;
  //end
  
  // Test2
  initial begin 
    #10 data = 1;
    #2 data = 0;
    #2 data = 1;
    #2 data = 0;
    #2 data = 0;
    #2 data = 1;
    #2 data = 0;
    #2 data = 1;
  end
    
  // Dump waves
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, top_tb);
  end
endmodule


