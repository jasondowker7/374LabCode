module boothmult(result, A, B);
output [32*2-1:0] result;
input signed [31:0] A, B;

	reg [2:0] cc[(32 / 2)-1:0];
	reg [32:0] pp[(32 / 2)-1:0];
	reg [32*2-1:0] spp[(32 / 2)-1:0];
	reg [32*2-1:0] prod;

	wire [32:0] inv_A;
	integer kk,ii;

	assign inv_A = {~A[31], ~A} + 1;

	always @ (A or B or inv_A)
	begin
		cc[0] = {B[1],B[0],1'b0};

		for(kk=1;kk<(32 / 2);kk=kk+1)
			cc[kk] = {B[2*kk+1], B[2*kk], B[2*kk-1]};

		for(kk=0;kk<(32 / 2);kk=kk+1)
		begin
			case(cc[kk])
				3'b001 , 3'b010 : pp[kk] = {A[32-1],A};
				3'b011 : pp[kk] = {A,1'b0};
				3'b100 : pp[kk] = {inv_A[32-1:0],1'b0};
				3'b101 , 3'b110 : pp[kk] = inv_A;
				default : pp[kk] = 0;
			endcase

			spp[kk] = $signed(pp[kk]);

			for(ii=0;ii<kk;ii=ii+1)
				spp[kk] = {spp[kk],2'b00}; //multiply by 2 to the power x or shifting operation
		end

		prod = spp[0];

		for(kk=1;kk<(32 / 2);kk=kk+1)
			prod = prod + spp[kk];
	end

	assign result = prod;

endmodule