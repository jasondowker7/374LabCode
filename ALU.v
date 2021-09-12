module ALU (outputLOW, outputHI, CarryOut, ALU_CONTROL, A, B);
input signed [31:0] A; 
input signed [31:0] B; 
input [3:0] ALU_CONTROL; 
output  [31:0] outputLOW, outputHI;  

parameter [3:0] 	ADD = 4'b0000,
			SUB = 4'b0001,
			MUL = 4'b0010,
			DIV = 4'b0011,
			AND = 4'b0100,
			OR  = 4'b0101,
			NEG = 4'b0110,
			NOT = 4'b0111,
			LSR = 4'b1000,
			LSL = 4'b1001,
			RL =  4'b1010,
			RR =  4'b1011;
	
	wire [63:0] mult_res;
	wire [31:0] ror_res, rol_res;
	reg [31:0] RLOW, RHI;
	assign outputLOW = RLOW;
	assign outputHI = RHI; 
	
	boothmult mult(mult_result, A, B);
	rightRotate rr(rr_result, A, B);
	leftRotate lr(rl_result, A, B);

always @(*)
begin
	case(ALU_CONTROL)
	ADD: begin //Addition
		RLOW = A+B; 
	end
	
	SUB: begin //Subtraction
		RLOW = A-B; 
	end
	
	MUL: begin //Multiplication
		RLOW = mult_result[31:0]; 
		RHI = mult_result[63:32];
	end
	
	DIV: begin //Division
		RHI <= A % B
		RLOW <= (A-RHI)/B;
	end
	
	AND: begin //Logical AND
		RLOW = A & B; 
	end
	
	OR: begin //Logical OR
		RLOW = A | B; 
	end
	
	NEG: begin //Logical Negation
		RLOW = ~B + 1; 
	end
	NOT: begin
		RLOW = ~B;
	end
	LSR: begin //Logical Shift Right
		RLOW = A >> B; 
		
	end
	
	LSL: begin //Logical Shift Left
		RLOW = A << B; 
		
	end
	
	RL: begin //Rotate Left
		RLOW = rl_result; 
		
	end
	
	RR: begin //Rotate Right
		RLOW = rr_result;
		
	end
		
	default: begin
	RLOW = 16'b0; 
	end
	endcase
end
endmodule //ALU