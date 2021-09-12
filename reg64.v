module reg64(input clr, clk, Zin, Zlowout, Zhighout, input[63:0] D, output reg [31:0] Zdatahigh, Zdatalow);
		always @(posedge clk or posedge clr)
			if(clr) begin
				Zdatalow=32'h00000000;
				Zdatahigh=32'h00000000;
			end
			else if(Zin)
				if(Zlowout)
					Zdatalow=D[31:0];
				else if(Zhighout)
					Zdatahigh=D[63:32];
endmodule
