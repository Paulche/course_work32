module divider (
	input     	clk,      // Clock
	input     	rst_n,    // Asynchronous reset active low
	input     	data,
	input [2:0]	previous,

	output [2:0] out
	);
		
	reg [2:0]  clk_cnt;
	reg        overflow;
	reg [2:0]  sum;

	assign out = sum + overflow;

	always_ff @(posedge clk or negedge rst_n) begin
		if(~rst_n) begin
			sum <= 0;
			overflow <= 0;
			clk_cnt <= 1;
		end else begin     
			if(data) begin
				if((previous + clk_cnt) == 3'b111) begin
					overflow <= 0;
					sum <= 0;
				end else begin
					{overflow,sum} <= previous + clk_cnt; 
				end      
			end
			
			case(clk_cnt)
				1 : clk_cnt <= 2;
				2 : clk_cnt <= 4;
				4 : clk_cnt <= 1;
			endcase
		end
	end

endmodule
