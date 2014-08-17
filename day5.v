// ex 13
`timescale 1ns/1ns

module jk_ff
    (
     J,K,
     CLK,
     Q,Q_N   
    
     );
input J,K,CLK;
output Q,Q_N;

reg    q,q_n;

always @(posedge CLK)
    begin
    if(J!=K)
        begin
        q   <= J;
        q_n <= K;               
        end
    else if (J==1 && K==1)
        begin
        q   <= !q;
        q_n <= !q_n;        
        end     
    end

assign Q    = q;
assign Q_N  = q_n;

endmodule

// ex 14

module check_pattern
    (
     clk,
     usb_clr,
     wr_asm
     );
input       clk;
input[3:0]  usb_clr;
output      wr_asm;

reg [3:0]   value = 4'hb;
reg         wr_asm;  // sticky

always @(posedge clk or negedge rst_)
    begin
    if(usb_clr == value)
        wr_asm <= 1'b1;
    else
        wr_asm <= 1'b0; 	
    end

endmodule

// ex 15
module check_bus
	(
	 data_in,
	 clk,
	 data_ready,
	 check
	 );

input [11:0] data_in;
input 		 clk;
input 		 data_ready;

output 		 check;



endmodule
