module bus(input R0out,R1out,R2out,R3out,R4out,R5out,R6out,R7out,R8out,R9out,R10out,
					  R11out,R12out,R13out,R14out,R15out,HIout,LOout,Zhighout,Zlowout,
					  PCout,MDRout,InPortout,Cout,
	  input[31:0] BusMuxIn_R0,BusMuxIn_R1,
					  BusMuxIn_R2,BusMuxIn_R3,BusMuxIn_R4,BusMuxIn_R5,BusMuxIn_R6,BusMuxIn_R7,
					  BusMuxIn_R8,BusMuxIn_R9,BusMuxIn_R10,BusMuxIn_R11,BusMuxIn_R12,BusMuxIn_R13,
					  BusMuxIn_R14,BusMuxIn_R15,BusMuxIn_HI,BusMuxIn_LO,BusMuxIn_ZHI,BusMuxIn_ZLO,
					  BusMuxIn_PC,BusMuxIn_MDR,BusMuxIn_InPort,BusMuxIn_C,
			 output [31:0] BusMuxOut 
);
	reg [31:0] internalOut;
	assign BusMuxOut = internalOut;

	always@(R0out,R1out,R2out,R3out,R4out,R5out,R6out,R7out,R8out,R9out,R10out,
					  R11out,R12out,R13out,R14out,R15out,HIout,LOout,Zhighout,Zlowout,
					  PCout,MDRout,InPortout,Cout,BusMuxIn_R0,BusMuxIn_R1,
					  BusMuxIn_R2,BusMuxIn_R3,BusMuxIn_R4,BusMuxIn_R5,BusMuxIn_R6,BusMuxIn_R7,
					  BusMuxIn_R8,BusMuxIn_R9,BusMuxIn_R10,BusMuxIn_R11,BusMuxIn_R12,BusMuxIn_R13,
					  BusMuxIn_R14,BusMuxIn_R15,BusMuxIn_HI,BusMuxIn_LO,BusMuxIn_ZHI,BusMuxIn_ZLO,
					  BusMuxIn_PC,BusMuxIn_MDR,BusMuxIn_InPort,BusMuxIn_C)
	
	begin
		if(R0out==1) internalOut = BusMuxIn_R0; else
		if(R1out==1) internalOut = BusMuxIn_R1; else
		if(R2out==1) internalOut = BusMuxIn_R2; else
		if(R3out==1) internalOut = BusMuxIn_R3; else
		if(R4out==1) internalOut = BusMuxIn_R4; else
		if(R5out==1) internalOut = BusMuxIn_R5; else
		if(R6out==1) internalOut = BusMuxIn_R6; else
		if(R7out==1) internalOut = BusMuxIn_R7; else
		if(R8out==1) internalOut = BusMuxIn_R8; else
		if(R9out==1) internalOut = BusMuxIn_R9; else
		if(R10out==1) internalOut = BusMuxIn_R10; else
		if(R11out==1) internalOut = BusMuxIn_R11; else
		if(R12out==1) internalOut = BusMuxIn_R12; else
		if(R13out==1) internalOut = BusMuxIn_R13; else
		if(R14out==1) internalOut = BusMuxIn_R14; else
		if(R15out==1) internalOut = BusMuxIn_R15; else
		if(HIout==1) internalOut = BusMuxIn_HI; else
		if(LOout==1) internalOut = BusMuxIn_LO; else
		if(Zhighout==1) internalOut = BusMuxIn_ZHI; else
		if(Zlowout==1) internalOut = BusMuxIn_ZLO; else
		if(PCout==1) internalOut = BusMuxIn_PC; else
		if(MDRout==1) internalOut = BusMuxIn_MDR; else
		if(InPortout==1) internalOut = BusMuxIn_InPort; else
		if(Cout==1) internalOut = BusMuxIn_C; else
		internalOut = 32'bx;
	end
endmodule
