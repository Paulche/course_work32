module top (
  input         clk,    // Clock
  input         rst_n,  // Asynchronous reset active low

  input         data,
  output  [2:0] out
  );
	
	divider divider0( .clk(clk),
					.rst_n(rst_n),
					.data(data),
					.previous(out),
					.out(out));

endmodule
