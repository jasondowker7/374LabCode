module regMDR(clr, clk, MDRin, Mdatain, MDRread, busMuxOut, MDRout);

input clr;
input clk;
input MDRin, MDRread;
input [31:0] busMuxOut, Mdatain;
output reg [31:0] MDRout;
always @(posedge clk or posedge clr)
		if(clr)
			MDRout = 0; 
		else if(MDRread)
			MDRout = busMuxOut;
		else
			MDRout = Mdatain;
endmodule