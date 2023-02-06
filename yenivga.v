`timescale 1ns / 1ps

module yenivga(

	 input Start,
    input Zeros,
    input Ones,
	 input clk,	 // 50 MHz
    output o_hsync,      // horizontal sync
    output o_vsync,         // vertical sync 
    output reg clk25MHz,
    output  [7:0] vgacolour
);

	reg [9:0] counter_x = 0;  // horizontal counter
	reg [9:0] counter_y = 0;  // vertical counter
	reg [7:0] colour = 0;
	reg [7:0] redzero [0:1599];
	reg [7:0] redone [0:1599];
	reg [7:0] redtwo [0:1599];
	reg [7:0] redthree [0:1599];
	reg [7:0] bluezero [0:1599];
	reg [7:0] blueone [0:1599];
	reg [7:0] bluetwo [0:1599];
	reg [7:0] bluethree [0:1599];
	reg [7:0] yellowzero [0:1599];
	reg [7:0] yellowone [0:1599];
	reg [7:0] yellowtwo [0:1599];
	reg [7:0] yellowthree [0:1599];
	reg [7:0] greenzero [0:1599];
	reg [7:0] greenone [0:1599];
	reg [7:0] greentwo [0:1599];
	reg [7:0] greenthree [0:1599];
	reg [7:0] redread0 [0:3199];
	reg [7:0] blueread0 [0:3199];
	reg [7:0] greenread0 [0:3199];
	reg [7:0] yellowread0 [0:3199];
	reg [7:0] redread1 [0:3199];
	reg [7:0] blueread1 [0:3199];
	reg [7:0] greenread1 [0:3199];
	reg [7:0] yellowread1 [0:3199];
	reg [7:0] redread2 [0:3199];
	reg [7:0] blueread2 [0:3199];
	reg [7:0] greenread2 [0:3199];
	reg [7:0] yellowread2 [0:3199];
	reg [7:0] redread3 [0:3199];
	reg [7:0] blueread3 [0:3199];
	reg [7:0] greenread3 [0:3199];
	reg [7:0] yellowread3 [0:3199];
	reg [7:0] T [0:1599];
	reg [7:0] D [0:1599];
	reg [7:0] R [0:1599];
	reg [7:0] ONE [0:399];
	reg [7:0] TWO [0:399];
	reg [7:0] THREE [0:399];
	reg [7:0] FOUR [0:399];
	reg [7:0] FIVE [0:399];
	reg [7:0] SIX [0:399];
	reg [7:0] SEVEN [0:399];
	reg [7:0] EIGHT [0:399];
	reg [7:0] NINE [0:399];
	reg [7:0] ZERO [0:399];
	reg [7:0] TOTAL [0:3199];
	reg [7:0] Bf1 [0:1599];
	reg [7:0] Bf2 [0:1599];
	reg [7:0] Bf3 [0:1599];
	reg [7:0] Bf4 [0:1599];
	wire [11:0] bf1;
   wire [11:0] bf2;
   wire [11:0] bf3;
   wire [11:0] bf4;
   wire [3:0] Depth1;
   wire [3:0] Depth2;
   wire [3:0] Depth3;
   wire [3:0] Depth4;
   wire [3:0] Read;
	wire [7:0] Total_Received;
	wire [7:0] Total_Transmitted;
	wire [7:0] Total_Dropped;
	wire [6:0] Received_bf1;
	wire [6:0] Transmitted_bf1;
	wire [6:0] Dropped_bf1;
	wire [6:0] Received_bf2;
	wire [6:0] Transmitted_bf2;
	wire [6:0] Dropped_bf2;
	wire [6:0] Received_bf3;
	wire [6:0] Transmitted_bf3;
	wire [6:0] Dropped_bf3;
	wire [6:0] Received_bf4;
	wire [6:0] Transmitted_bf4;
	wire [6:0] Dropped_bf4;
	
	son d1(clk,Start,Zeros,Ones,bf1,Depth1, bf2,Depth2, bf3, Depth3, bf4,Depth4,Read,Total_Received,Total_Transmitted,Total_Dropped,
Received_bf1,Transmitted_bf1,Dropped_bf1,Received_bf2,Transmitted_bf2,Dropped_bf2,Received_bf3,Transmitted_bf3,Dropped_bf3,Received_bf4,
Transmitted_bf4,Dropped_bf4);
	initial begin 
	$readmemh("redzero.list",redzero);
	$readmemh("redone.list",redone);
	$readmemh("redtwo.list",redtwo);
	$readmemh("redthree.list",redthree);
	$readmemh("bluezero.list",bluezero);
	$readmemh("blueone.list",blueone);
	$readmemh("bluetwo.list",bluetwo);
	$readmemh("bluethree.list",bluethree);
	$readmemh("yellowzero.list",yellowzero);
	$readmemh("yellowone.list",yellowone);
	$readmemh("yellowtwo.list",yellowtwo);
	$readmemh("yellowthree.list",yellowthree);
	$readmemh("greenzero.list",greenzero);
	$readmemh("greenone.list",greenone);
	$readmemh("greentwo.list",greentwo);
	$readmemh("greenthree.list",greenthree);
	$readmemh("Read0b.list",blueread0);
	$readmemh("Read1b.list",blueread1);
	$readmemh("Read2b.list",blueread2);
	$readmemh("Read3b.list",blueread3);
	$readmemh("Read0g.list",greenread0);
	$readmemh("Read1g.list",greenread1);
	$readmemh("Read2g.list",greenread2);
	$readmemh("Read3g.list",greenread3);
	$readmemh("Read0r.list",redread0);
	$readmemh("Read1r.list",redread1);
	$readmemh("Read2r.list",redread2);
	$readmemh("Read3r.list",redread3);
	$readmemh("Read0y.list",yellowread0);
	$readmemh("Read1y.list",yellowread1);
	$readmemh("Read2y.list",yellowread2);
	$readmemh("Read3y.list",yellowread3);
	$readmemh("ZERO.list",ZERO);
	$readmemh("ONE.list",ONE);
	$readmemh("TWO.list",TWO);
	$readmemh("THREE.list",THREE);
	$readmemh("FOUR.list",FOUR);
	$readmemh("FIVE.list",FIVE);
	$readmemh("SIX.list",SIX);
	$readmemh("SEVEN.list",SEVEN);
	$readmemh("EIGHT.list",EIGHT);
	$readmemh("NINE.list",NINE);
	$readmemh("T.list",T);
	$readmemh("D.list",D);
	$readmemh("R.list",R);
	$readmemh("TOTAL.list",TOTAL);
	$readmemh("Bf1.list",Bf1);
	$readmemh("Bf2.list",Bf2);
	$readmemh("Bf3.list",Bf3);
	$readmemh("Bf4.list",Bf4);
	
	
	end
	
	
	always @(posedge clk)begin
		clk25MHz <= ~clk25MHz;
	end
	
//counter sequence
always @(posedge clk25MHz)  // horizontal counter
		begin 
			if (counter_x < 799)
				counter_x <= counter_x + 1;  // horizontal counter (including off-screen horizontal 160 pixels) total of 800 pixels 
			else
				counter_x <= 0;              
		end  // always 
	
	always @ (posedge clk25MHz)  // vertical counter
		begin 
			if (counter_x == 799)  // only counts up 1 count after horizontal finishes 800 counts
				begin
					if (counter_y < 525)  // vertical counter (including off-screen vertical 45 pixels) total of 525 pixels
						counter_y <= counter_y + 1;
					else
						counter_y <= 0;              
				end  // if (counter_x...
		end  // always
//counter sequence end
//horizontal sync and vertical sync
	assign o_hsync = (counter_x >= 0 && counter_x < 96) ? 1:0;  // hsync high for 96 counts                                                 
	assign o_vsync = (counter_y >= 0 && counter_y < 2) ? 1:0;   // vsync high for 2 counts
//horizontal sync and vertical sync end
always @ (posedge clk) begin //pattern

// bufferbox
if (counter_x >=174 && counter_x <=383 && counter_y >=152 && counter_y <=461) begin
			//vertical black line 1
			if (counter_x >=174 && counter_x <=183 && counter_y >=152 && counter_y <=461) begin
			colour<=8'b0;
			end// end vertical black line 1
			//vertical black line 2
			if (counter_x >=374 && counter_x <=383 && counter_y >=152 && counter_y <=461) begin
			colour<=8'b0;
			end// end vertical black line 2
			//horizontal black line 1
			if (counter_x >=184 && counter_x <=373 && counter_y >=152 && counter_y <=161) begin
			colour<=8'b0;
			end// end horizontal black line 1
			//horizontal black line 2
			if (counter_x >=184 && counter_x <=373 && counter_y >=452 && counter_y <=461) begin
			colour<=8'b0;
			end// end horizontal black line 2
	if (counter_x >=184 && counter_x <=223) begin	//buffer 1 start
	// buffer 1 Depth6
			if (counter_x >=184 && counter_x <=223 && counter_y >=162 && counter_y <=201) begin 
			if (Depth1 == 6)begin
				if (bf1[11:10]==0)begin
					colour <= redzero[({counter_x-184}*40+counter_y-162)];
				end
				if (bf1[11:10]==1)begin
					colour <= redone[({counter_x-184}*40+counter_y-162)];
				end
				if (bf1[11:10]==2)begin
					colour <= redtwo[({counter_x-184}*40+counter_y-162)];
				end
				if (bf1[11:10]==3)begin
					colour <= redthree[({counter_x-184}*40+counter_y-162)];
				end
			end
			else if(Depth1<6)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=184 && counter_x <=223 && counter_y >=202 && counter_y <=211)begin
			colour<=8'b0;
			end
			// buffer 1 Depth5
			if (counter_x >=184 && counter_x <=223 && counter_y >=212 && counter_y <=251) begin 
			if (Depth1 >= 5)begin
				if (bf1[9:8]==0)begin
					colour <= redzero[({counter_x-184}*40+counter_y-212)];
				end
				if (bf1[9:8]==1)begin
					colour <= redone[({counter_x-184}*40+counter_y-212)];
				end
				if (bf1[9:8]==2)begin
					colour <= redtwo[({counter_x-184}*40+counter_y-212)];
				end
				if (bf1[9:8]==3)begin
					colour <= redthree[({counter_x-184}*40+counter_y-212)];
				end
			end
			else if(Depth1<5)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=184 && counter_x <=223 && counter_y >=252 && counter_y <=261)begin
			colour<=8'b0;
			end
			// buffer 1 Depth4
			if (counter_x >=184 && counter_x <=223 && counter_y >=262 && counter_y <=301) begin
			if (Depth1 >= 4)begin
				if (bf1[7:6]==0)begin
					colour <= redzero[({counter_x-184}*40+counter_y-262)];
				end
				if (bf1[7:6]==1)begin
					colour <= redone[({counter_x-184}*40+counter_y-262)];
				end
				if (bf1[7:6]==2)begin
					colour <= redtwo[({counter_x-184}*40+counter_y-262)];
				end
				if (bf1[7:6]==3)begin
					colour <= redthree[({counter_x-184}*40+counter_y-262)];
				end
			end
			else if(Depth1<4)begin
			colour<=8'b11111111;			
			end
			end
			// black line between depths
			if (counter_x >=184 && counter_x <=223 && counter_y >=302 && counter_y <=311)begin
			colour<=8'b0;
			end
			// buffer 1 Depth3
			if (counter_x >=184 && counter_x <=223 && counter_y >=312 && counter_y <=351) begin 
			if (Depth1 >= 3)begin
				if (bf1[5:4]==0)begin
					colour <= redzero[({counter_x-184}*40+counter_y-312)];
				end
				if (bf1[5:4]==1)begin
					colour <= redone[({counter_x-184}*40+counter_y-312)];
				end
				if (bf1[5:4]==2)begin
					colour <= redtwo[({counter_x-184}*40+counter_y-312)];
				end
				if (bf1[5:4]==3)begin
					colour <= redthree[({counter_x-184}*40+counter_y-312)];
				end
			end
			else if(Depth1<3)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=184 && counter_x <=223 && counter_y >=352 && counter_y <=361)begin
			colour<=8'b0;
			end
			// buffer 1 Depth2
			if (counter_x >=184 && counter_x <=223 && counter_y >=362 && counter_y <=401) begin 
			if (Depth1 >= 2)begin
				if (bf1[3:2]==0)begin
					colour <= redzero[({counter_x-184}*40+counter_y-362)];
				end
				if (bf1[3:2]==1)begin
					colour <= redone[({counter_x-184}*40+counter_y-362)];
				end
				if (bf1[3:2]==2)begin
					colour <= redtwo[({counter_x-184}*40+counter_y-362)];
				end
				if (bf1[3:2]==3)begin
					colour <= redthree[({counter_x-184}*40+counter_y-362)];
				end
			end
			else if(Depth1<2)begin
			colour<=8'b11111111;			
			end
			end
			// black line between depths
			if (counter_x >=184 && counter_x <=223 && counter_y >=402 && counter_y <=411)begin
			colour<=8'b0;
			end
			// buffer 1 Depth1
			if (counter_x >=184 && counter_x <=223 && counter_y >=412 && counter_y <=451) begin 
			if (Depth1 >= 1)begin
				if (bf1[1:0]==0)begin
					colour <= redzero[({counter_x-184}*40+counter_y-412)];
				end
				if (bf1[1:0]==1)begin
					colour <= redone[({counter_x-184}*40+counter_y-412)];
				end
				if (bf1[1:0]==2)begin
					colour <= redtwo[({counter_x-184}*40+counter_y-412)];
				end
				if (bf1[1:0]==3)begin
					colour <= redthree[({counter_x-184}*40+counter_y-412)];
				end
			end
			else if(Depth1<1)begin
			colour<=8'b11111111;
			end
			end
	end//end of buffer 1
			//black line between buffer1 and buffer 2
			if (counter_x >=224 && counter_x <=233 && counter_y >=162 && counter_y <=451) begin
				colour<=8'b0;
			end //end of the black line between buffer1 and buffer 2
	if (counter_x >=234 && counter_x <=273) begin	//buffer 2 start
			// buffer 2 Depth6
			if (counter_x >=234 && counter_x <=273 && counter_y >=162 && counter_y <=201) begin 
			if (Depth2 == 6)begin
				if (bf2[11:10]==0)begin
					colour <= bluezero[({counter_x-234}*40+counter_y-162)];
				end
				if (bf2[11:10]==1)begin
					colour <= blueone[({counter_x-234}*40+counter_y-162)];
				end
				if (bf2[11:10]==2)begin
					colour <= bluetwo[({counter_x-234}*40+counter_y-162)];
				end
				if (bf2[11:10]==3)begin
					colour <= bluethree[({counter_x-234}*40+counter_y-162)];
				end
			end
			else if(Depth2<6)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=234 && counter_x <=273 && counter_y >=202 && counter_y <=211)begin
			colour<=8'b0;
			end
			// buffer 2 Depth5
			if (counter_x >=234 && counter_x <=273 && counter_y >=212 && counter_y <=251) begin 
			if (Depth2 >= 5)begin
				if (bf2[9:8]==0)begin
					colour <= bluezero[({counter_x-234}*40+counter_y-212)];
				end
				if (bf2[9:8]==1)begin
					colour <= blueone[({counter_x-234}*40+counter_y-212)];
				end
				if (bf2[9:8]==2)begin
					colour <= bluetwo[({counter_x-234}*40+counter_y-212)];
				end
				if (bf2[9:8]==3)begin
					colour <= bluethree[({counter_x-234}*40+counter_y-212)];
				end
			end
			else if(Depth2<5)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=234 && counter_x <=273 && counter_y >=252 && counter_y <=261)begin
			colour<=8'b0;
			end
			// buffer 2 Depth4
			if (counter_x >=234 && counter_x <=273 && counter_y >=262 && counter_y <=301) begin 
			if (Depth2 >= 4)begin
				if (bf2[7:6]==0)begin
					colour <= bluezero[({counter_x-234}*40+counter_y-262)];
				end
				if (bf2[7:6]==1)begin
					colour <= blueone[({counter_x-234}*40+counter_y-262)];
				end
				if (bf2[7:6]==2)begin
					colour <= bluetwo[({counter_x-234}*40+counter_y-262)];
				end
				if (bf2[7:6]==3)begin
					colour <= bluethree[({counter_x-234}*40+counter_y-262)];
				end
			end
			else if(Depth2<4)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=234 && counter_x <=273 && counter_y >=302 && counter_y <=311)begin
			colour<=8'b0;
			end
			// buffer 2 Depth3
			if (counter_x >=234 && counter_x <=273 && counter_y >=312 && counter_y <=351) begin 
			if (Depth2 >= 3)begin
				if (bf2[5:4]==0)begin
					colour <= bluezero[({counter_x-234}*40+counter_y-312)];
				end
				if (bf2[5:4]==1)begin
					colour <= blueone[({counter_x-234}*40+counter_y-312)];
				end
				if (bf2[5:4]==2)begin
					colour <= bluetwo[({counter_x-234}*40+counter_y-312)];
				end
				if (bf2[5:4]==3)begin
					colour <= bluethree[({counter_x-234}*40+counter_y-312)];
				end
			end
			else if(Depth2<3)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=234 && counter_x <=273 && counter_y >=352 && counter_y <=361)begin
			colour<=8'b0;
			end
			// buffer 2 Depth2
			if (counter_x >=234 && counter_x <=273 && counter_y >=362 && counter_y <=401) begin 
			if (Depth2 >= 2)begin
				if (bf2[3:2]==0)begin
					colour <= bluezero[({counter_x-234}*40+counter_y-362)];
				end
				if (bf2[3:2]==1)begin
					colour <= blueone[({counter_x-234}*40+counter_y-362)];
				end
				if (bf2[3:2]==2)begin
					colour <= bluetwo[({counter_x-234}*40+counter_y-362)];
				end
				if (bf2[3:2]==3)begin
					colour <= bluethree[({counter_x-234}*40+counter_y-362)];
				end
			end
			else if(Depth2<2)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=234 && counter_x <=273 && counter_y >=402 && counter_y <=411)begin
			colour<=8'b0;
			end
			// buffer 2 Depth1
			if (counter_x >=234 && counter_x <=273 && counter_y >=412 && counter_y <=451) begin 
			if (Depth2 >= 1)begin
				if (bf2[1:0]==0)begin
					colour <= bluezero[({counter_x-234}*40+counter_y-412)];
				end
				if (bf2[1:0]==1)begin
					colour <= blueone[({counter_x-234}*40+counter_y-412)];
				end
				if (bf2[1:0]==2)begin
					colour <= bluetwo[({counter_x-234}*40+counter_y-412)];
				end
				if (bf2[1:0]==3)begin
					colour <= bluethree[({counter_x-234}*40+counter_y-412)];
				end
			end
			else if(Depth2<1)begin
			colour<=8'b11111111;
			end
			end
	end//end of buffer 2
			//black line between buffer2 and buffer 3
			if (counter_x >=274 && counter_x <=283 && counter_y >=162 && counter_y <=451) begin
				colour<=8'b0;
			end //end of the black line between buffer2 and buffer 3
	if (counter_x >=284 && counter_x <=323) begin	//buffer 3 start
	// buffer 3 Depth6
			if (counter_x >=284 && counter_x <=323 && counter_y >=162 && counter_y <=201) begin 
			if (Depth3 == 6)begin
				if (bf3[11:10]==0)begin
					colour <= yellowzero[({counter_x-284}*40+counter_y-162)];
				end
				if (bf3[11:10]==1)begin
					colour <= yellowone[({counter_x-284}*40+counter_y-162)];
				end
				if (bf3[11:10]==2)begin
					colour <= yellowtwo[({counter_x-284}*40+counter_y-162)];
				end
				if (bf3[11:10]==3)begin
					colour <= yellowthree[({counter_x-284}*40+counter_y-162)];
				end
			end
			else if(Depth3<6)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=284 && counter_x <=323 && counter_y >=202 && counter_y <=211)begin
			colour<=8'b0;
			end
			// buffer 3 Depth5
			if (counter_x >=284 && counter_x <=323 && counter_y >=212 && counter_y <=251) begin 
			if (Depth3 >= 5)begin
				if (bf3[9:8]==0)begin
					colour <= yellowzero[({counter_x-284}*40+counter_y-212)];
				end
				if (bf3[9:8]==1)begin
					colour <= yellowone[({counter_x-284}*40+counter_y-212)];
				end
				if (bf3[9:8]==2)begin
					colour <= yellowtwo[({counter_x-284}*40+counter_y-212)];
				end
				if (bf3[9:8]==3)begin
					colour <= yellowthree[({counter_x-284}*40+counter_y-212)];
				end
			end
			else if(Depth3<5)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=284 && counter_x <=323 && counter_y >=252 && counter_y <=261)begin
			colour<=8'b0;
			end
			// buffer 3 Depth4
			if (counter_x >=284 && counter_x <=323 && counter_y >=262 && counter_y <=301) begin 
			if (Depth3 >= 4)begin
				if (bf3[7:6]==0)begin
					colour <= yellowzero[({counter_x-284}*40+counter_y-262)];
				end
				if (bf3[7:6]==1)begin
					colour <= yellowone[({counter_x-284}*40+counter_y-262)];
				end
				if (bf3[7:6]==2)begin
					colour <= yellowtwo[({counter_x-284}*40+counter_y-262)];
				end
				if (bf3[7:6]==3)begin
					colour <= yellowthree[({counter_x-284}*40+counter_y-262)];
				end
			end
			else if(Depth3<4)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=284 && counter_x <=323 && counter_y >=302 && counter_y <=311)begin
			colour<=8'b0;
			end
			// buffer 3 Depth3
			if (counter_x >=284 && counter_x <=323 && counter_y >=312 && counter_y <=351) begin 
			if (Depth3 >= 3)begin
				if (bf3[5:4]==0)begin
					colour <= yellowzero[({counter_x-284}*40+counter_y-312)];
				end
				if (bf3[5:4]==1)begin
					colour <= yellowone[({counter_x-284}*40+counter_y-312)];
				end
				if (bf3[5:4]==2)begin
					colour <= yellowtwo[({counter_x-284}*40+counter_y-312)];
				end
				if (bf3[5:4]==3)begin
					colour <= yellowthree[({counter_x-284}*40+counter_y-312)];
				end
			end
			else if(Depth3<3)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=284 && counter_x <=323 && counter_y >=352 && counter_y <=361)begin
			colour<=8'b0;
			end
			// buffer 3 Depth2
			if (counter_x >=284 && counter_x <=323 && counter_y >=362 && counter_y <=401) begin 
			if (Depth3 >= 2)begin
				if (bf3[3:2]==0)begin
					colour <= yellowzero[({counter_x-284}*40+counter_y-362)];
				end
				if (bf3[3:2]==1)begin
					colour <= yellowone[({counter_x-284}*40+counter_y-362)];
				end
				if (bf3[3:2]==2)begin
					colour <= yellowtwo[({counter_x-284}*40+counter_y-362)];
				end
				if (bf3[3:2]==3)begin
					colour <= yellowthree[({counter_x-284}*40+counter_y-362)];
				end
			end
			else if(Depth3<2)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=284 && counter_x <=323 && counter_y >=402 && counter_y <=411)begin
			colour<=8'b0;
			end
			// buffer 3 Depth1
			if (counter_x >=284 && counter_x <=323 && counter_y >=412 && counter_y <=451) begin 
			if (Depth3 >= 1)begin
				if (bf3[1:0]==0)begin
					colour <= yellowzero[({counter_x-284}*40+counter_y-412)];
				end
				if (bf3[1:0]==1)begin
					colour <= yellowone[({counter_x-284}*40+counter_y-412)];
				end
				if (bf3[1:0]==2)begin
					colour <= yellowtwo[({counter_x-284}*40+counter_y-412)];
				end
				if (bf3[1:0]==3)begin
					colour <= yellowthree[({counter_x-284}*40+counter_y-412)];
				end
			end
			else if(Depth3<1)begin
			colour<=8'b11111111;
			end
			end
	end//end of buffer 3
			//black line between buffer3 and buffer 4
			if (counter_x >=324 && counter_x <=333 && counter_y >=162 && counter_y <=451) begin
				colour<=8'b0;
			end //end of the black line between buffer3 and buffer 4
	if (counter_x >=334 && counter_x <=373) begin	//buffer 4 start
			// buffer 4 Depth6
			if (counter_x >=334 && counter_x <=373 && counter_y >=162 && counter_y <=201) begin 
			if (Depth4 >= 6)begin
				if (bf4[11:10]==0)begin
					colour <= greenzero[({counter_x-334}*40+counter_y-162)];
				end
				if (bf4[11:10]==1)begin
					colour <= greenone[({counter_x-334}*40+counter_y-162)];
				end
				if (bf4[11:10]==2)begin
					colour <= greentwo[({counter_x-334}*40+counter_y-162)];
				end
				if (bf4[11:10]==3)begin
					colour <= greenthree[({counter_x-334}*40+counter_y-162)];
				end
			end
			else if(Depth4<6)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=334 && counter_x <=373 && counter_y >=202 && counter_y <=211)begin
			colour<=8'b0;
			end
			// buffer 4 Depth5
			if (counter_x >=334 && counter_x <=373 && counter_y >=212 && counter_y <=251) begin 
			if (Depth4 >= 5)begin
				if (bf4[9:8]==0)begin
					colour <= greenzero[({counter_x-334}*40+counter_y-212)];
				end
				if (bf4[9:8]==1)begin
					colour <= greenone[({counter_x-334}*40+counter_y-212)];
				end
				if (bf4[9:8]==2)begin
					colour <= greentwo[({counter_x-334}*40+counter_y-212)];
				end
				if (bf4[9:8]==3)begin
					colour <= greenthree[({counter_x-334}*40+counter_y-212)];
				end
			end
			else if(Depth4<5)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=334 && counter_x <=373 && counter_y >=252 && counter_y <=261)begin
			colour<=8'b0;
			end
			// buffer 4 Depth4
			if (counter_x >=334 && counter_x <=373 && counter_y >=262 && counter_y <=301) begin 
			if (Depth4 >= 4)begin
				if (bf4[7:6]==0)begin
					colour <= greenzero[({counter_x-334}*40+counter_y-262)];
				end
				if (bf4[7:6]==1)begin
					colour <= greenone[({counter_x-334}*40+counter_y-262)];
				end
				if (bf4[7:6]==2)begin
					colour <= greentwo[({counter_x-334}*40+counter_y-262)];
				end
				if (bf4[7:6]==3)begin
					colour <= greenthree[({counter_x-334}*40+counter_y-262)];
				end
			end
			else if(Depth4<4)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=334 && counter_x <=373 && counter_y >=302 && counter_y <=311)begin
			colour<=8'b0;
			end
			// buffer 4 Depth3
			if (counter_x >=334 && counter_x <=373 && counter_y >=312 && counter_y <=351) begin 
			if (Depth4 >= 3)begin
				if (bf4[5:4]==0)begin
					colour <= greenzero[({counter_x-334}*40+counter_y-312)];
				end
				if (bf4[5:4]==1)begin
					colour <= greenone[({counter_x-334}*40+counter_y-312)];
				end
				if (bf4[5:4]==2)begin
					colour <= greentwo[({counter_x-334}*40+counter_y-312)];
				end
				if (bf4[5:4]==3)begin
					colour <= greenthree[({counter_x-334}*40+counter_y-312)];
				end
			end
			else if(Depth4<3)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=334 && counter_x <=373 && counter_y >=352 && counter_y <=361)begin
			colour<=8'b0;
			end
			// buffer 4 Depth2
			if (counter_x >=334 && counter_x <=373 && counter_y >=362 && counter_y <=401) begin 
			if (Depth4 >= 2)begin
				if (bf4[3:2]==0)begin
					colour <= greenzero[({counter_x-334}*40+counter_y-362)];
				end
				if (bf4[3:2]==1)begin
					colour <= greenone[({counter_x-334}*40+counter_y-362)];
				end
				if (bf4[3:2]==2)begin
					colour <= greentwo[({counter_x-334}*40+counter_y-362)];
				end
				if (bf4[3:2]==3)begin
					colour <= greenthree[({counter_x-334}*40+counter_y-362)];
				end
			end
			else if(Depth4<2)begin
			colour<=8'b11111111;
			end
			end
			// black line between depths
			if (counter_x >=334 && counter_x <=373 && counter_y >=402 && counter_y <=411)begin
			colour<=8'b0;
			end
			// buffer 4 Depth1
			if (counter_x >=334 && counter_x <=373 && counter_y >=412 && counter_y <=451) begin 
			if (Depth4 >= 1)begin
				if (bf4[1:0]==0)begin
					colour <= greenzero[({counter_x-334}*40+counter_y-412)];
				end
				if (bf4[1:0]==1)begin
					colour <= greenone[({counter_x-334}*40+counter_y-412)];
				end
				if (bf4[1:0]==2)begin
					colour <= greentwo[({counter_x-334}*40+counter_y-412)];
				end
				if (bf4[1:0]==3)begin
					colour <= greenthree[({counter_x-334}*40+counter_y-412)];
				end
			end
			else if(Depth4<1)begin
			colour<=8'b11111111;
			end
	end//enf of buffer 4
end//end of buffer box
end
else begin //outside the box
	colour<=8'b11111111;
end
//read
if (counter_x >=229 && counter_x <=328 && counter_y >=62 && counter_y <=121)begin
			//read left black line 
			if (counter_x >=229 && counter_x <=238 && counter_y >=62 && counter_y <=121) begin
				colour<=8'b0;
			end //end of the read left black line
			//read right black line 
			if (counter_x >=319 && counter_x <=328 && counter_y >=62 && counter_y <=121) begin
				colour<=8'b0;
			end //end of the read right black line
			// read upper black line 
			if (counter_x >=239 && counter_x <=318 && counter_y >=62 && counter_y <=71) begin
				colour<=8'b0;
			end //end of the read upper black line
			// read bottom black line 
			if (counter_x >=239 && counter_x <=318 && counter_y >=112 && counter_y <=121) begin
				colour<=8'b0;
			end //end of the read bottom black line
			
			else if (counter_x >=239 && counter_x <=318 && counter_y >=72 && counter_y <=111)begin
				if(Read[3:2] == 2'b00)begin
	if(Read[1:0] == 2'b00 )begin
	
	colour <= redread0[({counter_x-239}*40+counter_y-72)];
	
	end//Read[1:0]==2'b00
	if(Read[1:0] == 2'b01 )begin
	
	colour <= redread1[({counter_x-239}*40+counter_y-72)];
	
	end//Read[1:0]==2'b01
	if(Read[1:0] == 2'b10 )begin
	
	colour <= redread2[({counter_x-239}*40+counter_y-72)];
	
	end//Read[1:0]==2'b10
	if(Read[1:0] == 2'b11 )begin
	
	colour <= redread3	[({counter_x-239}*40+counter_y-72)];
	
	end//Read[1:0]==2'b11
end//read[3:2]=0

else if (Read[3:2] == 2'b01)begin
	if(Read[1:0] == 2'b00 )begin
	
	colour <= blueread0[({counter_x-239}*40+counter_y-72)];
	
	end//Read[1:0]==2'b00
	if(Read[1:0] == 2'b01 )begin
	
	colour <= blueread1[({counter_x-239}*40+counter_y-72)];
	
	end//Read[1:0]==2'b01
	if(Read[1:0] == 2'b10 )begin
	
	colour <= blueread2[({counter_x-239}*40+counter_y-72)];
	
	end//Read[1:0]==2'b10
	if(Read[1:0] == 2'b11 )begin
	
	colour <= blueread3[({counter_x-239}*40+counter_y-72)];
	
	end//Read[1:0]==2'b11
end //Read[3:2]==1

else if (Read[3:2]== 2'b10)begin
	if(Read[1:0] == 2'b00 )begin
	
	colour <= yellowread0[({counter_x-239}*40+counter_y-72)];
	
	end//Read[1:0]==2'b00
	if(Read[1:0] == 2'b01 )begin
	
	colour <= yellowread1[({counter_x-239}*40+counter_y-72)];
	
	end//Read[1:0]==2'b01
	if(Read[1:0] == 2'b10 )begin
	
	colour <= yellowread2[({counter_x-239}*40+counter_y-72)];
	
	end//Read[1:0]==2'b10
	if(Read[1:0] == 2'b11 )begin
	
	colour <= yellowread3[({counter_x-239}*40+counter_y-72)];
	
	end//Read[1:0]==2'b11
end // Read[3:2] == 2

else if (Read[3:2]==2'b11)begin
	if(Read[1:0] == 2'b00 )begin
	
	colour <= greenread0[({counter_x-239}*40+counter_y-72)];
	
	end//Read[1:0]==2'b00
	if(Read[1:0] == 2'b01 )begin
	
	colour <= greenread1[({counter_x-239}*40+counter_y-72)];
	
	end//Read[1:0]==2'b01
	if(Read[1:0] == 2'b10 )begin
	
	colour <= greenread2[({counter_x-239}*40+counter_y-72)];
	
	end//Read[1:0]==2'b10
	if(Read[1:0] == 2'b11 )begin
	
	colour <= greenread3[({counter_x-239}*40+counter_y-72)];
	
	end//Read[1:0]==2'b11
end//Read[3:2] == 3
				
				else  begin 
				colour<=8'b11111111;
				end
			end
end // read end

//bilal
//start T
            if (counter_x >=584 && counter_x <=623 && counter_y >=122 && counter_y <=161)begin
            
				colour <= T[({counter_x-584}*40+counter_y-122)];
				
            end
//end T

//start R
            if (counter_x >=504 && counter_x <=543 && counter_y >=122 && counter_y <=161)begin
            
				colour <= R[({counter_x-504}*40+counter_y-122)];
				
            end
//end R

//start D
            if (counter_x >=664 && counter_x <=703 && counter_y >=122 && counter_y <=161)begin
            
				colour <= D[({counter_x-664}*40+counter_y-122)];				
				
            end
//end D

//start bf1
            if (counter_x >=434 && counter_x <=473 && counter_y >=172 && counter_y <=211)begin
            
				colour <= Bf1[({counter_x-434}*40+counter_y-172)];				
				
            end
//end bf1

//start bf1-R1
            if (counter_x >=504 && counter_x <=523 && counter_y >=182 && counter_y <=201)begin
            
					if((Received_bf1-(Received_bf1 %10))/10 == 0)begin
						 colour <= ZERO[({counter_x-504}*20+counter_y-182)];
					end

					else if((Received_bf1-(Received_bf1 %10))/10 == 1)begin
						 colour <= ONE[({counter_x-504}*20+counter_y-182)];
					end

					else if((Received_bf1-(Received_bf1 %10))/10 == 2)begin
						 colour <= TWO[({counter_x-504}*20+counter_y-182)];
					end

					else if((Received_bf1-(Received_bf1 %10))/10 == 3)begin
						 colour <= THREE[({counter_x-504}*20+counter_y-182)];
					end

					else if((Received_bf1-(Received_bf1 %10))/10 == 4)begin
						 colour <= FOUR[({counter_x-504}*20+counter_y-182)];
					end

					else if((Received_bf1-(Received_bf1 %10))/10 == 5)begin
						 colour <= FIVE[({counter_x-504}*20+counter_y-182)];
					end

					else if((Received_bf1-(Received_bf1 %10))/10 == 6)begin
						 colour <= SIX[({counter_x-504}*20+counter_y-182)];
					end

					else if((Received_bf1-(Received_bf1 %10))/10 == 7)begin
						 colour <= SEVEN[({counter_x-504}*20+counter_y-182)];
					end

					else if((Received_bf1-(Received_bf1 %10))/10 == 8)begin
						 colour <= EIGHT[({counter_x-504}*20+counter_y-182)];
					end

					else if((Received_bf1-(Received_bf1 %10))/10 == 9)begin
						 colour <= NINE[({counter_x-504}*20+counter_y-182)];
					end
				
            end
//end bf1-R1


//start bf1-R2
            if (counter_x >=524 && counter_x <=543 && counter_y >=182 && counter_y <=201)begin
            
					if(Received_bf1 %10 == 0)begin
						 colour <= ZERO[({counter_x-524}*20+counter_y-182)];
					end

					else if(Received_bf1 %10 == 1)begin
						 colour <= ONE[({counter_x-524}*20+counter_y-182)];
					end

					else if(Received_bf1 %10 == 2)begin
						 colour <= TWO[({counter_x-524}*20+counter_y-182)];
					end

					else if(Received_bf1 %10 == 3)begin
						 colour <= THREE[({counter_x-524}*20+counter_y-182)];
					end

					else if(Received_bf1 %10 == 4)begin
						 colour <= FOUR[({counter_x-524}*20+counter_y-182)];
					end

					else if(Received_bf1 %10 == 5)begin
						 colour <= FIVE[({counter_x-524}*20+counter_y-182)];
					end

					else if(Received_bf1 %10 == 6)begin
						 colour <= SIX[({counter_x-524}*20+counter_y-182)];
					end

					else if(Received_bf1 %10 == 7)begin
						 colour <= SEVEN[({counter_x-524}*20+counter_y-182)];
					end

					else if(Received_bf1 %10 == 8)begin
						 colour <= EIGHT[({counter_x-524}*20+counter_y-182)];
					end

					else if(Received_bf1 %10 == 9)begin
						 colour <= NINE[({counter_x-524}*20+counter_y-182)];
					end
				
            end
//end bf1-R2

//start bf1-T1
            if (counter_x >=584 && counter_x <=603 && counter_y >=182 && counter_y <=201)begin
            
					if((Transmitted_bf1-(Transmitted_bf1 %10))/10 == 0)begin
						 colour <= ZERO[({counter_x-584}*20+counter_y-182)];
					end

					else if((Transmitted_bf1-(Transmitted_bf1 %10))/10 == 1)begin
						 colour <= ONE[({counter_x-584}*20+counter_y-182)];
					end

					else if((Transmitted_bf1-(Transmitted_bf1 %10))/10 == 2)begin
						 colour <= TWO[({counter_x-584}*20+counter_y-182)];
					end

					else if((Transmitted_bf1-(Transmitted_bf1 %10))/10 == 3)begin
						 colour <= THREE[({counter_x-584}*20+counter_y-182)];
					end

					else if((Transmitted_bf1-(Transmitted_bf1 %10))/10 == 4)begin
						 colour <= FOUR[({counter_x-584}*20+counter_y-182)];
					end

					else if((Transmitted_bf1-(Transmitted_bf1 %10))/10 == 5)begin
						 colour <= FIVE[({counter_x-584}*20+counter_y-182)];
					end

					else if((Transmitted_bf1-(Transmitted_bf1 %10))/10 == 6)begin
						 colour <= SIX[({counter_x-584}*20+counter_y-182)];
					end

					else if((Transmitted_bf1-(Transmitted_bf1 %10))/10 == 7)begin
						 colour <= SEVEN[({counter_x-584}*20+counter_y-182)];
					end

					else if((Transmitted_bf1-(Transmitted_bf1 %10))/10 == 8)begin
						 colour <= EIGHT[({counter_x-584}*20+counter_y-182)];
					end

					else if((Transmitted_bf1-(Transmitted_bf1 %10))/10 == 9)begin
						 colour <= NINE[({counter_x-584}*20+counter_y-182)];
					end
				
            end
//end bf1-T1


//start bf1-T2
            if (counter_x >=604 && counter_x <=623 && counter_y >=182 && counter_y <=201)begin
            
					if(Transmitted_bf1 %10 == 0)begin
						 colour <= ZERO[({counter_x-604}*20+counter_y-182)];
					end

					else if(Transmitted_bf1 %10 == 1)begin
						 colour <= ONE[({counter_x-604}*20+counter_y-182)];
					end

					else if(Transmitted_bf1 %10 == 2)begin
						 colour <= TWO[({counter_x-604}*20+counter_y-182)];
					end

					else if(Transmitted_bf1 %10 == 3)begin
						 colour <= THREE[({counter_x-604}*20+counter_y-182)];
					end

					else if(Transmitted_bf1 %10 == 4)begin
						 colour <= FOUR[({counter_x-604}*20+counter_y-182)];
					end

					else if(Transmitted_bf1 %10 == 5)begin
						 colour <= FIVE[({counter_x-604}*20+counter_y-182)];
					end

					else if(Transmitted_bf1 %10 == 6)begin
						 colour <= SIX[({counter_x-604}*20+counter_y-182)];
					end

					else if(Transmitted_bf1 %10 == 7)begin
						 colour <= SEVEN[({counter_x-604}*20+counter_y-182)];
					end

					else if(Transmitted_bf1 %10 == 8)begin
						 colour <= EIGHT[({counter_x-604}*20+counter_y-182)];
					end

					else if(Transmitted_bf1 %10 == 9)begin
						 colour <= NINE[({counter_x-604}*20+counter_y-182)];
					end
				
            end
//end bf1-T2

//start bf1-D1
            if (counter_x >=664 && counter_x <=683 && counter_y >=182 && counter_y <=201)begin
            
					if((Dropped_bf1-(Dropped_bf1 %10))/10 == 0)begin
						 colour <= ZERO[({counter_x-664}*20+counter_y-182)];
					end

					else if((Dropped_bf1-(Dropped_bf1 %10))/10 == 1)begin
						 colour <= ONE[({counter_x-664}*20+counter_y-182)];
					end

					else if((Dropped_bf1-(Dropped_bf1 %10))/10 == 2)begin
						 colour <= TWO[({counter_x-664}*20+counter_y-182)];
					end

					else if((Dropped_bf1-(Dropped_bf1 %10))/10 == 3)begin
						 colour <= THREE[({counter_x-664}*20+counter_y-182)];
					end

					else if((Dropped_bf1-(Dropped_bf1 %10))/10 == 4)begin
						 colour <= FOUR[({counter_x-664}*20+counter_y-182)];
					end

					else if((Dropped_bf1-(Dropped_bf1 %10))/10 == 5)begin
						 colour <= FIVE[({counter_x-664}*20+counter_y-182)];
					end

					else if((Dropped_bf1-(Dropped_bf1 %10))/10 == 6)begin
						 colour <= SIX[({counter_x-664}*20+counter_y-182)];
					end

					else if((Dropped_bf1-(Dropped_bf1 %10))/10 == 7)begin
						 colour <= SEVEN[({counter_x-664}*20+counter_y-182)];
					end

					else if((Dropped_bf1-(Dropped_bf1 %10))/10 == 8)begin
						 colour <= EIGHT[({counter_x-664}*20+counter_y-182)];
					end

					else if((Dropped_bf1-(Dropped_bf1 %10))/10 == 9)begin
						 colour <= NINE[({counter_x-664}*20+counter_y-182)];
					end
				
            end
//end bf1-D1


//start bf1-D2
            if (counter_x >=684 && counter_x <=703 && counter_y >=182 && counter_y <=201)begin
            
						if(Dropped_bf1 %10 == 0)begin
						 colour <= ZERO[({counter_x-684}*20+counter_y-182)];
					end

					else if(Dropped_bf1 %10 == 1)begin
						 colour <= ONE[({counter_x-684}*20+counter_y-182)];
					end

					else if(Dropped_bf1 %10 == 2)begin
						 colour <= TWO[({counter_x-684}*20+counter_y-182)];
					end

					else if(Dropped_bf1 %10 == 3)begin
						 colour <= THREE[({counter_x-684}*20+counter_y-182)];
					end

					else if(Dropped_bf1 %10 == 4)begin
						 colour <= FOUR[({counter_x-684}*20+counter_y-182)];
					end

					else if(Dropped_bf1 %10 == 5)begin
						 colour <= FIVE[({counter_x-684}*20+counter_y-182)];
					end

					else if(Dropped_bf1 %10 == 6)begin
						 colour <= SIX[({counter_x-684}*20+counter_y-182)];
					end

					else if(Dropped_bf1 %10 == 7)begin
						 colour <= SEVEN[({counter_x-684}*20+counter_y-182)];
					end

					else if(Dropped_bf1 %10 == 8)begin
						 colour <= EIGHT[({counter_x-684}*20+counter_y-182)];
					end

					else if(Dropped_bf1 %10 == 9)begin
						 colour <= NINE[({counter_x-684}*20+counter_y-182)];
					end
				
            end
//end bf1-D2

//start bf2
            if (counter_x >=434 && counter_x <=473 && counter_y >=222 && counter_y <=261)begin
            
				colour <= Bf2[({counter_x-434}*40+counter_y-222)];							
				
            end
//end bf2

//start bf2-R1
            if (counter_x >=504 && counter_x <=523 && counter_y >=232 && counter_y <=251)begin
            
					if((Received_bf2-(Received_bf2 %10))/10 == 0)begin
						 colour <= ZERO[({counter_x-504}*20+counter_y-232)];
					end

					else if((Received_bf2-(Received_bf2 %10))/10 == 1)begin
						 colour <= ONE[({counter_x-504}*20+counter_y-232)];
					end

					else if((Received_bf2-(Received_bf2 %10))/10 == 2)begin
						 colour <= TWO[({counter_x-504}*20+counter_y-232)];
					end

					else if((Received_bf2-(Received_bf2 %10))/10 == 3)begin
						 colour <= THREE[({counter_x-504}*20+counter_y-232)];
					end

					else if((Received_bf2-(Received_bf2 %10))/10 == 4)begin
						 colour <= FOUR[({counter_x-504}*20+counter_y-232)];
					end

					else if((Received_bf2-(Received_bf2 %10))/10 == 5)begin
						 colour <= FIVE[({counter_x-504}*20+counter_y-232)];
					end

					else if((Received_bf2-(Received_bf2 %10))/10 == 6)begin
						 colour <= SIX[({counter_x-504}*20+counter_y-232)];
					end

					else if((Received_bf2-(Received_bf2 %10))/10 == 7)begin
						 colour <= SEVEN[({counter_x-504}*20+counter_y-232)];
					end

					else if((Received_bf2-(Received_bf2 %10))/10 == 8)begin
						 colour <= EIGHT[({counter_x-504}*20+counter_y-232)];
					end

					else if((Received_bf2-(Received_bf2 %10))/10 == 9)begin
						 colour <= NINE[({counter_x-504}*20+counter_y-232)];
					end
				
            end
//end bf2-R1


//start bf2-R2
            if (counter_x >=524 && counter_x <=543 && counter_y >=232 && counter_y <=251)begin
            
						if(Received_bf2 %10 == 0)begin
						 colour <= ZERO[({counter_x-524}*20+counter_y-232)];
					end

					else if(Received_bf2 %10 == 1)begin
						 colour <= ONE[({counter_x-524}*20+counter_y-232)];
					end

					else if(Received_bf2 %10 == 2)begin
						 colour <= TWO[({counter_x-524}*20+counter_y-232)];
					end

					else if(Received_bf2 %10 == 3)begin
						 colour <= THREE[({counter_x-524}*20+counter_y-232)];
					end

					else if(Received_bf2 %10 == 4)begin
						 colour <= FOUR[({counter_x-524}*20+counter_y-232)];
					end

					else if(Received_bf2 %10 == 5)begin
						 colour <= FIVE[({counter_x-524}*20+counter_y-232)];
					end

					else if(Received_bf2 %10 == 6)begin
						 colour <= SIX[({counter_x-524}*20+counter_y-232)];
					end

					else if(Received_bf2 %10 == 7)begin
						 colour <= SEVEN[({counter_x-524}*20+counter_y-232)];
					end

					else if(Received_bf2 %10 == 8)begin
						 colour <= EIGHT[({counter_x-524}*20+counter_y-232)];
					end

					else if(Received_bf2 %10 == 9)begin
						 colour <= NINE[({counter_x-524}*20+counter_y-232)];
					end
				
            end
//end bf2-R2

//start bf2-T1
            if (counter_x >=584 && counter_x <=603 && counter_y >=232 && counter_y <=251)begin
            
					if((Transmitted_bf2-(Transmitted_bf2 %10))/10 == 0)begin
						 colour <= ZERO[({counter_x-584}*20+counter_y-232)];
					end

					else if((Transmitted_bf2-(Transmitted_bf2 %10))/10 == 1)begin
						 colour <= ONE[({counter_x-584}*20+counter_y-232)];
					end

					else if((Transmitted_bf2-(Transmitted_bf2 %10))/10 == 2)begin
						 colour <= TWO[({counter_x-584}*20+counter_y-232)];
					end

					else if((Transmitted_bf2-(Transmitted_bf2 %10))/10 == 3)begin
						 colour <= THREE[({counter_x-584}*20+counter_y-232)];
					end

					else if((Transmitted_bf2-(Transmitted_bf2 %10))/10 == 4)begin
						 colour <= FOUR[({counter_x-584}*20+counter_y-232)];
					end

					else if((Transmitted_bf2-(Transmitted_bf2 %10))/10 == 5)begin
						 colour <= FIVE[({counter_x-584}*20+counter_y-232)];
					end

					else if((Transmitted_bf2-(Transmitted_bf2 %10))/10 == 6)begin
						 colour <= SIX[({counter_x-584}*20+counter_y-232)];
					end

					else if((Transmitted_bf2-(Transmitted_bf2 %10))/10 == 7)begin
						 colour <= SEVEN[({counter_x-584}*20+counter_y-232)];
					end

					else if((Transmitted_bf2-(Transmitted_bf2 %10))/10 == 8)begin
						 colour <= EIGHT[({counter_x-584}*20+counter_y-232)];
					end

					else if((Transmitted_bf2-(Transmitted_bf2 %10))/10 == 9)begin
						 colour <= NINE[({counter_x-584}*20+counter_y-232)];
					end
				
            end
//end bf2-T1


//start bf2-T2
            if (counter_x >=604 && counter_x <=623 && counter_y >=232 && counter_y <=251)begin
            
					if(Transmitted_bf2 %10 == 0)begin
						 colour <= ZERO[({counter_x-604}*20+counter_y-232)];
					end

					else if(Transmitted_bf2 %10 == 1)begin
						 colour <= ONE[({counter_x-604}*20+counter_y-232)];
					end

					else if(Transmitted_bf2 %10 == 2)begin
						 colour <= TWO[({counter_x-604}*20+counter_y-232)];
					end

					else if(Transmitted_bf2 %10 == 3)begin
						 colour <= THREE[({counter_x-604}*20+counter_y-232)];
					end

					else if(Transmitted_bf2 %10 == 4)begin
						 colour <= FOUR[({counter_x-604}*20+counter_y-232)];
					end

					else if(Transmitted_bf2 %10 == 5)begin
						 colour <= FIVE[({counter_x-604}*20+counter_y-232)];
					end

					else if(Transmitted_bf2 %10 == 6)begin
						 colour <= SIX[({counter_x-604}*20+counter_y-232)];
					end

					else if(Transmitted_bf2 %10 == 7)begin
						 colour <= SEVEN[({counter_x-604}*20+counter_y-232)];
					end

					else if(Transmitted_bf2 %10 == 8)begin
						 colour <= EIGHT[({counter_x-604}*20+counter_y-232)];
					end

					else if(Transmitted_bf2 %10 == 9)begin
						 colour <= NINE[({counter_x-604}*20+counter_y-232)];
					end
				
            end
//end bf2-T2

//start bf2-D1
            if (counter_x >=664 && counter_x <=683 && counter_y >=232 && counter_y <=251)begin
            
					if((Dropped_bf2-(Dropped_bf2 %10))/10 == 0)begin
						 colour <= ZERO[({counter_x-664}*20+counter_y-232)];
					end

					else if((Dropped_bf2-(Dropped_bf2 %10))/10 == 1)begin
						 colour <= ONE[({counter_x-664}*20+counter_y-232)];
					end

					else if((Dropped_bf2-(Dropped_bf2 %10))/10 == 2)begin
						 colour <= TWO[({counter_x-664}*20+counter_y-232)];
					end

					else if((Dropped_bf2-(Dropped_bf2 %10))/10 == 3)begin
						 colour <= THREE[({counter_x-664}*20+counter_y-232)];
					end

					else if((Dropped_bf2-(Dropped_bf2 %10))/10 == 4)begin
						 colour <= FOUR[({counter_x-664}*20+counter_y-232)];
					end

					else if((Dropped_bf2-(Dropped_bf2 %10))/10 == 5)begin
						 colour <= FIVE[({counter_x-664}*20+counter_y-232)];
					end

					else if((Dropped_bf2-(Dropped_bf2 %10))/10 == 6)begin
						 colour <= SIX[({counter_x-664}*20+counter_y-232)];
					end

					else if((Dropped_bf2-(Dropped_bf2 %10))/10 == 7)begin
						 colour <= SEVEN[({counter_x-664}*20+counter_y-232)];
					end

					else if((Dropped_bf2-(Dropped_bf2 %10))/10 == 8)begin
						 colour <= EIGHT[({counter_x-664}*20+counter_y-232)];
					end

					else if((Dropped_bf2-(Dropped_bf2 %10))/10 == 9)begin
						 colour <= NINE[({counter_x-664}*20+counter_y-232)];
					end
				
            end
//end bf2-D1


//start bf2-D2
            if (counter_x >=684 && counter_x <=703 && counter_y >=232 && counter_y <=251)begin
            
					if(Dropped_bf2 %10 == 0)begin
						 colour <= ZERO[({counter_x-684}*20+counter_y-232)];
					end

					else if(Dropped_bf2 %10 == 1)begin
						 colour <= ONE[({counter_x-684}*20+counter_y-232)];
					end

					else if(Dropped_bf2 %10 == 2)begin
						 colour <= TWO[({counter_x-684}*20+counter_y-232)];
					end

					else if(Dropped_bf2 %10 == 3)begin
						 colour <= THREE[({counter_x-684}*20+counter_y-232)];
					end

					else if(Dropped_bf2 %10 == 4)begin
						 colour <= FOUR[({counter_x-684}*20+counter_y-232)];
					end

					else if(Dropped_bf2 %10 == 5)begin
						 colour <= FIVE[({counter_x-684}*20+counter_y-232)];
					end

					else if(Dropped_bf2 %10 == 6)begin
						 colour <= SIX[({counter_x-684}*20+counter_y-232)];
					end

					else if(Dropped_bf2 %10 == 7)begin
						 colour <= SEVEN[({counter_x-684}*20+counter_y-232)];
					end

					else if(Dropped_bf2 %10 == 8)begin
						 colour <= EIGHT[({counter_x-684}*20+counter_y-232)];
					end

					else if(Dropped_bf2 %10 == 9)begin
						 colour <= NINE[({counter_x-684}*20+counter_y-232)];
					end
				
            end
//end bf2-D2

//start bf3
            if (counter_x >=434 && counter_x <=473 && counter_y >=272 && counter_y <=311)begin
            
				colour <= Bf3[({counter_x-434}*40+counter_y-272)];							
				
            end
//end bf3

//start bf3-R1
            if (counter_x >=504 && counter_x <=523 && counter_y >=282 && counter_y <=301)begin
            
					if((Received_bf3-(Received_bf3 %10))/10 == 0)begin
						 colour <= ZERO[({counter_x-504}*20+counter_y-282)];
					end

					else if((Received_bf3-(Received_bf3 %10))/10 == 1)begin
						 colour <= ONE[({counter_x-504}*20+counter_y-282)];
					end

					else if((Received_bf3-(Received_bf3 %10))/10 == 2)begin
						 colour <= TWO[({counter_x-504}*20+counter_y-282)];
					end

					else if((Received_bf3-(Received_bf3 %10))/10 == 3)begin
						 colour <= THREE[({counter_x-504}*20+counter_y-282)];
					end

					else if((Received_bf3-(Received_bf3 %10))/10 == 4)begin
						 colour <= FOUR[({counter_x-504}*20+counter_y-282)];
					end

					else if((Received_bf3-(Received_bf3 %10))/10 == 5)begin
						 colour <= FIVE[({counter_x-504}*20+counter_y-282)];
					end

					else if((Received_bf3-(Received_bf3 %10))/10 == 6)begin
						 colour <= SIX[({counter_x-504}*20+counter_y-282)];
					end

					else if((Received_bf3-(Received_bf3 %10))/10 == 7)begin
						 colour <= SEVEN[({counter_x-504}*20+counter_y-282)];
					end

					else if((Received_bf3-(Received_bf3 %10))/10 == 8)begin
						 colour <= EIGHT[({counter_x-504}*20+counter_y-282)];
					end

					else if((Received_bf3-(Received_bf3 %10))/10 == 9)begin
						 colour <= NINE[({counter_x-504}*20+counter_y-282)];
					end
				
            end
//end bf3-R1


//start bf3-R2
            if (counter_x >=524 && counter_x <=543 && counter_y >=282 && counter_y <=301)begin
            
					if(Received_bf3 %10 == 0)begin
						 colour <= ZERO[({counter_x-524}*20+counter_y-282)];
					end

					else if(Received_bf3 %10 == 1)begin
						 colour <= ONE[({counter_x-524}*20+counter_y-282)];
					end

					else if(Received_bf3 %10 == 2)begin
						 colour <= TWO[({counter_x-524}*20+counter_y-282)];
					end

					else if(Received_bf3 %10 == 3)begin
						 colour <= THREE[({counter_x-524}*20+counter_y-282)];
					end

					else if(Received_bf3 %10 == 4)begin
						 colour <= FOUR[({counter_x-524}*20+counter_y-282)];
					end

					else if(Received_bf3 %10 == 5)begin
						 colour <= FIVE[({counter_x-524}*20+counter_y-282)];
					end

					else if(Received_bf3 %10 == 6)begin
						 colour <= SIX[({counter_x-524}*20+counter_y-282)];
					end

					else if(Received_bf3 %10 == 7)begin
						 colour <= SEVEN[({counter_x-524}*20+counter_y-282)];
					end

					else if(Received_bf3 %10 == 8)begin
						 colour <= EIGHT[({counter_x-524}*20+counter_y-282)];
					end

					else if(Received_bf3 %10 == 9)begin
						 colour <= NINE[({counter_x-524}*20+counter_y-282)];
					end
				
            end
//end bf3-R2

//start bf3-T1
            if (counter_x >=584 && counter_x <=603 && counter_y >=282 && counter_y <=301)begin
            
					if((Transmitted_bf3-(Transmitted_bf3 %10))/10 == 0)begin
						 colour <= ZERO[({counter_x-584}*20+counter_y-282)];
					end

					else if((Transmitted_bf3-(Transmitted_bf3 %10))/10 == 1)begin
						 colour <= ONE[({counter_x-584}*20+counter_y-282)];
					end

					else if((Transmitted_bf3-(Transmitted_bf3 %10))/10 == 2)begin
						 colour <= TWO[({counter_x-584}*20+counter_y-282)];
					end

					else if((Transmitted_bf3-(Transmitted_bf3 %10))/10 == 3)begin
						 colour <= THREE[({counter_x-584}*20+counter_y-282)];
					end

					else if((Transmitted_bf3-(Transmitted_bf3 %10))/10 == 4)begin
						 colour <= FOUR[({counter_x-584}*20+counter_y-282)];
					end

					else if((Transmitted_bf3-(Transmitted_bf3 %10))/10 == 5)begin
						 colour <= FIVE[({counter_x-584}*20+counter_y-282)];
					end

					else if((Transmitted_bf3-(Transmitted_bf3 %10))/10 == 6)begin
						 colour <= SIX[({counter_x-584}*20+counter_y-282)];
					end

					else if((Transmitted_bf3-(Transmitted_bf3 %10))/10 == 7)begin
						 colour <= SEVEN[({counter_x-584}*20+counter_y-282)];
					end

					else if((Transmitted_bf3-(Transmitted_bf3 %10))/10 == 8)begin
						 colour <= EIGHT[({counter_x-584}*20+counter_y-282)];
					end

					else if((Transmitted_bf3-(Transmitted_bf3 %10))/10 == 9)begin
						 colour <= NINE[({counter_x-584}*20+counter_y-282)];
					end
				
            end
//end bf3-T1


//start bf3-T2
            if (counter_x >=604 && counter_x <=623 && counter_y >=282 && counter_y <=301)begin
            
					if(Transmitted_bf3 %10 == 0)begin
						 colour <= ZERO[({counter_x-604}*20+counter_y-282)];
					end

					else if(Transmitted_bf3 %10 == 1)begin
						 colour <= ONE[({counter_x-604}*20+counter_y-282)];
					end

					else if(Transmitted_bf3 %10 == 2)begin
						 colour <= TWO[({counter_x-604}*20+counter_y-282)];
					end

					else if(Transmitted_bf3 %10 == 3)begin
						 colour <= THREE[({counter_x-604}*20+counter_y-282)];
					end

					else if(Transmitted_bf3 %10 == 4)begin
						 colour <= FOUR[({counter_x-604}*20+counter_y-282)];
					end

					else if(Transmitted_bf3 %10 == 5)begin
						 colour <= FIVE[({counter_x-604}*20+counter_y-282)];
					end

					else if(Transmitted_bf3 %10 == 6)begin
						 colour <= SIX[({counter_x-604}*20+counter_y-282)];
					end

					else if(Transmitted_bf3 %10 == 7)begin
						 colour <= SEVEN[({counter_x-604}*20+counter_y-282)];
					end

					else if(Transmitted_bf3 %10 == 8)begin
						 colour <= EIGHT[({counter_x-604}*20+counter_y-282)];
					end

					else if(Transmitted_bf3 %10 == 9)begin
						 colour <= NINE[({counter_x-604}*20+counter_y-282)];
					end
				
            end
//end bf1-T2

//start bf3-D1
            if (counter_x >=664 && counter_x <=683 && counter_y >=282 && counter_y <=301)begin
            
					if((Dropped_bf3-(Dropped_bf3 %10))/10 == 0)begin
						 colour <= ZERO[({counter_x-664}*20+counter_y-282)];
					end

					else if((Dropped_bf3-(Dropped_bf3 %10))/10 == 1)begin
						 colour <= ONE[({counter_x-664}*20+counter_y-282)];
					end

					else if((Dropped_bf3-(Dropped_bf3 %10))/10 == 2)begin
						 colour <= TWO[({counter_x-664}*20+counter_y-282)];
					end

					else if((Dropped_bf3-(Dropped_bf3 %10))/10 == 3)begin
						 colour <= THREE[({counter_x-664}*20+counter_y-282)];
					end

					else if((Dropped_bf3-(Dropped_bf3 %10))/10 == 4)begin
						 colour <= FOUR[({counter_x-664}*20+counter_y-282)];
					end

					else if((Dropped_bf3-(Dropped_bf3 %10))/10 == 5)begin
						 colour <= FIVE[({counter_x-664}*20+counter_y-282)];
					end

					else if((Dropped_bf3-(Dropped_bf3 %10))/10 == 6)begin
						 colour <= SIX[({counter_x-664}*20+counter_y-282)];
					end

					else if((Dropped_bf3-(Dropped_bf3 %10))/10 == 7)begin
						 colour <= SEVEN[({counter_x-664}*20+counter_y-282)];
					end

					else if((Dropped_bf3-(Dropped_bf3 %10))/10 == 8)begin
						 colour <= EIGHT[({counter_x-664}*20+counter_y-282)];
					end

					else if((Dropped_bf3-(Dropped_bf3 %10))/10 == 9)begin
						 colour <= NINE[({counter_x-664}*20+counter_y-282)];
					end
				
            end
//end bf3-D1


//start bf3-D2
            if (counter_x >=684 && counter_x <=703 && counter_y >=282 && counter_y <=301)begin
            
					if(Dropped_bf3 %10 == 0)begin
						 colour <= ZERO[({counter_x-684}*20+counter_y-282)];
					end

					else if(Dropped_bf3 %10 == 1)begin
						 colour <= ONE[({counter_x-684}*20+counter_y-282)];
					end

					else if(Dropped_bf3 %10 == 2)begin
						 colour <= TWO[({counter_x-684}*20+counter_y-282)];
					end

					else if(Dropped_bf3 %10 == 3)begin
						 colour <= THREE[({counter_x-684}*20+counter_y-282)];
					end

					else if(Dropped_bf3 %10 == 4)begin
						 colour <= FOUR[({counter_x-684}*20+counter_y-282)];
					end

					else if(Dropped_bf3 %10 == 5)begin
						 colour <= FIVE[({counter_x-684}*20+counter_y-282)];
					end

					else if(Dropped_bf3 %10 == 6)begin
						 colour <= SIX[({counter_x-684}*20+counter_y-282)];
					end

					else if(Dropped_bf3 %10 == 7)begin
						 colour <= SEVEN[({counter_x-684}*20+counter_y-282)];
					end

					else if(Dropped_bf3 %10 == 8)begin
						 colour <= EIGHT[({counter_x-684}*20+counter_y-282)];
					end

					else if(Dropped_bf3 %10 == 9)begin
						 colour <= NINE[({counter_x-684}*20+counter_y-282)];
					end
				
            end
//end bf3-D2

//start bf4
            if (counter_x >=434 && counter_x <=473 && counter_y >=322 && counter_y <=361)begin
            
				colour <= Bf4[({counter_x-434}*40+counter_y-322)];							
				
            end
//end bf4

//start bf4-R1
            if (counter_x >=504 && counter_x <=523 && counter_y >=332 && counter_y <=351)begin
            
					if((Received_bf4-(Received_bf4 %10))/10 == 0)begin
						 colour <= ZERO[({counter_x-504}*20+counter_y-332)];
					end

					else if((Received_bf4-(Received_bf4 %10))/10 == 1)begin
						 colour <= ONE[({counter_x-504}*20+counter_y-332)];
					end

					else if((Received_bf4-(Received_bf4 %10))/10 == 2)begin
						 colour <= TWO[({counter_x-504}*20+counter_y-332)];
					end

					else if((Received_bf4-(Received_bf4 %10))/10 == 3)begin
						 colour <= THREE[({counter_x-504}*20+counter_y-332)];
					end

					else if((Received_bf4-(Received_bf4 %10))/10 == 4)begin
						 colour <= FOUR[({counter_x-504}*20+counter_y-332)];
					end

					else if((Received_bf4-(Received_bf4 %10))/10 == 5)begin
						 colour <= FIVE[({counter_x-504}*20+counter_y-332)];
					end

					else if((Received_bf4-(Received_bf4 %10))/10 == 6)begin
						 colour <= SIX[({counter_x-504}*20+counter_y-332)];
					end

					else if((Received_bf4-(Received_bf4 %10))/10 == 7)begin
						 colour <= SEVEN[({counter_x-504}*20+counter_y-332)];
					end

					else if((Received_bf4-(Received_bf4 %10))/10 == 8)begin
						 colour <= EIGHT[({counter_x-504}*20+counter_y-332)];
					end

					else if((Received_bf4-(Received_bf4 %10))/10 == 9)begin
						 colour <= NINE[({counter_x-504}*20+counter_y-332)];
					end
				
            end
//end bf4-R1


//start bf4-R2
            if (counter_x >=524 && counter_x <=543 && counter_y >=332 && counter_y <=351)begin
            
					if(Received_bf4 %10 == 0)begin
						 colour <= ZERO[({counter_x-524}*20+counter_y-332)];
					end

					else if(Received_bf4 %10 == 1)begin
						 colour <= ONE[({counter_x-524}*20+counter_y-332)];
					end

					else if(Received_bf4 %10 == 2)begin
						 colour <= TWO[({counter_x-524}*20+counter_y-332)];
					end

					else if(Received_bf4 %10 == 3)begin
						 colour <= THREE[({counter_x-524}*20+counter_y-332)];
					end

					else if(Received_bf4 %10 == 4)begin
						 colour <= FOUR[({counter_x-524}*20+counter_y-332)];
					end

					else if(Received_bf4 %10 == 5)begin
						 colour <= FIVE[({counter_x-524}*20+counter_y-332)];
					end

					else if(Received_bf4 %10 == 6)begin
						 colour <= SIX[({counter_x-524}*20+counter_y-332)];
					end

					else if(Received_bf4 %10 == 7)begin
						 colour <= SEVEN[({counter_x-524}*20+counter_y-332)];
					end

					else if(Received_bf4 %10 == 8)begin
						 colour <= EIGHT[({counter_x-524}*20+counter_y-332)];
					end

					else if(Received_bf4 %10 == 9)begin
						 colour <= NINE[({counter_x-524}*20+counter_y-332)];
					end
				
            end
//end bf4-R2

//start bf4-T1
            if (counter_x >=584 && counter_x <=603 && counter_y >=332 && counter_y <=351)begin
            
					if((Transmitted_bf4-(Transmitted_bf4 %10))/10 == 0)begin
						 colour <= ZERO[({counter_x-584}*20+counter_y-332)];
					end

					else if((Transmitted_bf4-(Transmitted_bf4 %10))/10 == 1)begin
						 colour <= ONE[({counter_x-584}*20+counter_y-332)];
					end

					else if((Transmitted_bf4-(Transmitted_bf4 %10))/10 == 2)begin
						 colour <= TWO[({counter_x-584}*20+counter_y-332)];
					end

					else if((Transmitted_bf4-(Transmitted_bf4 %10))/10 == 3)begin
						 colour <= THREE[({counter_x-584}*20+counter_y-332)];
					end

					else if((Transmitted_bf4-(Transmitted_bf4 %10))/10 == 4)begin
						 colour <= FOUR[({counter_x-584}*20+counter_y-332)];
					end

					else if((Transmitted_bf4-(Transmitted_bf4 %10))/10 == 5)begin
						 colour <= FIVE[({counter_x-584}*20+counter_y-332)];
					end

					else if((Transmitted_bf4-(Transmitted_bf4 %10))/10 == 6)begin
						 colour <= SIX[({counter_x-584}*20+counter_y-332)];
					end

					else if((Transmitted_bf4-(Transmitted_bf4 %10))/10 == 7)begin
						 colour <= SEVEN[({counter_x-584}*20+counter_y-332)];
					end

					else if((Transmitted_bf4-(Transmitted_bf4 %10))/10 == 8)begin
						 colour <= EIGHT[({counter_x-584}*20+counter_y-332)];
					end

					else if((Transmitted_bf4-(Transmitted_bf4 %10))/10 == 9)begin
						 colour <= NINE[({counter_x-584}*20+counter_y-332)];
					end
				
            end
//end bf4-T1


//start bf4-T2
            if (counter_x >=604 && counter_x <=623 && counter_y >=332 && counter_y <=351)begin
            
						if(Transmitted_bf4 %10 == 0)begin
						 colour <= ZERO[({counter_x-604}*20+counter_y-332)];
					end

					else if(Transmitted_bf4 %10 == 1)begin
						 colour <= ONE[({counter_x-604}*20+counter_y-332)];
					end

					else if(Transmitted_bf4 %10 == 2)begin
						 colour <= TWO[({counter_x-604}*20+counter_y-332)];
					end

					else if(Transmitted_bf4 %10 == 3)begin
						 colour <= THREE[({counter_x-604}*20+counter_y-332)];
					end

					else if(Transmitted_bf4 %10 == 4)begin
						 colour <= FOUR[({counter_x-604}*20+counter_y-332)];
					end

					else if(Transmitted_bf4 %10 == 5)begin
						 colour <= FIVE[({counter_x-604}*20+counter_y-332)];
					end

					else if(Transmitted_bf4 %10 == 6)begin
						 colour <= SIX[({counter_x-604}*20+counter_y-332)];
					end

					else if(Transmitted_bf4 %10 == 7)begin
						 colour <= SEVEN[({counter_x-604}*20+counter_y-332)];
					end

					else if(Transmitted_bf4 %10 == 8)begin
						 colour <= EIGHT[({counter_x-604}*20+counter_y-332)];
					end

					else if(Transmitted_bf4 %10 == 9)begin
						 colour <= NINE[({counter_x-604}*20+counter_y-332)];
					end
				
            end
//end bf4-T2

//start bf4-D1
            if (counter_x >=664 && counter_x <=683 && counter_y >=332 && counter_y <=351)begin
            
						if((Dropped_bf4-(Dropped_bf4 %10))/10 == 0)begin
						 colour <= ZERO[({counter_x-664}*20+counter_y-332)];
					end

					else if((Dropped_bf4-(Dropped_bf4 %10))/10 == 1)begin
						 colour <= ONE[({counter_x-664}*20+counter_y-332)];
					end

					else if((Dropped_bf4-(Dropped_bf4 %10))/10 == 2)begin
						 colour <= TWO[({counter_x-664}*20+counter_y-332)];
					end

					else if((Dropped_bf4-(Dropped_bf4 %10))/10 == 3)begin
						 colour <= THREE[({counter_x-664}*20+counter_y-332)];
					end

					else if((Dropped_bf4-(Dropped_bf4 %10))/10 == 4)begin
						 colour <= FOUR[({counter_x-664}*20+counter_y-332)];
					end

					else if((Dropped_bf4-(Dropped_bf4 %10))/10 == 5)begin
						 colour <= FIVE[({counter_x-664}*20+counter_y-332)];
					end

					else if((Dropped_bf4-(Dropped_bf4 %10))/10 == 6)begin
						 colour <= SIX[({counter_x-664}*20+counter_y-332)];
					end

					else if((Dropped_bf4-(Dropped_bf4 %10))/10 == 7)begin
						 colour <= SEVEN[({counter_x-664}*20+counter_y-332)];
					end

					else if((Dropped_bf4-(Dropped_bf4 %10))/10 == 8)begin
						 colour <= EIGHT[({counter_x-664}*20+counter_y-332)];
					end

					else if((Dropped_bf4-(Dropped_bf4 %10))/10 == 9)begin
						 colour <= NINE[({counter_x-664}*20+counter_y-332)];
					end
				
            end
//end bf4-D1


//start bf4-D2
            if (counter_x >=684 && counter_x <=703 && counter_y >=332 && counter_y <=351)begin
            
					if(Dropped_bf4 %10 == 0)begin
						 colour <= ZERO[({counter_x-684}*20+counter_y-332)];
					end

					else if(Dropped_bf4 %10 == 1)begin
						 colour <= ONE[({counter_x-684}*20+counter_y-332)];
					end

					else if(Dropped_bf4 %10 == 2)begin
						 colour <= TWO[({counter_x-684}*20+counter_y-332)];
					end

					else if(Dropped_bf4 %10 == 3)begin
						 colour <= THREE[({counter_x-684}*20+counter_y-332)];
					end

					else if(Dropped_bf4 %10 == 4)begin
						 colour <= FOUR[({counter_x-684}*20+counter_y-332)];
					end

					else if(Dropped_bf4 %10 == 5)begin
						 colour <= FIVE[({counter_x-684}*20+counter_y-332)];
					end

					else if(Dropped_bf4 %10 == 6)begin
						 colour <= SIX[({counter_x-684}*20+counter_y-332)];
					end

					else if(Dropped_bf4 %10 == 7)begin
						 colour <= SEVEN[({counter_x-684}*20+counter_y-332)];
					end

					else if(Dropped_bf4 %10 == 8)begin
						 colour <= EIGHT[({counter_x-684}*20+counter_y-332)];
					end

					else if(Dropped_bf4 %10 == 9)begin
						 colour <= NINE[({counter_x-684}*80+counter_y-332)];
					end
				
            end
//end bf4-D2

//start total
            if (counter_x >=414 && counter_x <=493 && counter_y >=372 && counter_y <=411)begin
            
				colour <= TOTAL[({counter_x-414}*40+counter_y-372)];							
				
            end
//end total

//start total-R1
            if (counter_x >=504 && counter_x <=523 && counter_y >=382 && counter_y <=401)begin
            
					if((Total_Received-(Total_Received %100))/100 == 0)begin
						 colour <= ZERO[({counter_x-504}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %100))/100 == 1)begin
						 colour <= ONE[({counter_x-504}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %100))/100 == 2)begin
						 colour <= TWO[({counter_x-504}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %100))/100 == 3)begin
						 colour <= THREE[({counter_x-504}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %100))/100 == 4)begin
						 colour <= FOUR[({counter_x-504}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %100))/100 == 5)begin
						 colour <= FIVE[({counter_x-504}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %100))/100 == 6)begin
						 colour <= SIX[({counter_x-504}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %100))/100 == 7)begin
						 colour <= SEVEN[({counter_x-504}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %100))/100 == 8)begin
						 colour <= EIGHT[({counter_x-504}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %100))/100 == 9)begin
						 colour <= NINE[({counter_x-504}*20+counter_y-382)];
					end
				
            end
//end total-R1


//start total-R2
            if (counter_x >=524 && counter_x <=543 && counter_y >=382 && counter_y <=401)begin
            
					if((Total_Received-(Total_Received %10))/10 == 0)begin
						 colour <= ZERO[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 1)begin
						 colour <= ONE[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 2)begin
						 colour <= TWO[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 3)begin
						 colour <= THREE[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 4)begin
						 colour <= FOUR[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 5)begin
						 colour <= FIVE[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 6)begin
						 colour <= SIX[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 7)begin
						 colour <= SEVEN[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 8)begin
						 colour <= EIGHT[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 9)begin
						 colour <= NINE[({counter_x-524}*20+counter_y-382)];
					end
					else if((Total_Received-(Total_Received %10))/10 == 10)begin
						 colour <= ZERO[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 11)begin
						 colour <= ONE[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 12)begin
						 colour <= TWO[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 13)begin
						 colour <= THREE[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 14)begin
						 colour <= FOUR[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 15)begin
						 colour <= FIVE[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 16)begin
						 colour <= SIX[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 17)begin
						 colour <= SEVEN[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 18)begin
						 colour <= EIGHT[({counter_x-524}*20+counter_y-382)];
					end

					else if((Total_Received-(Total_Received %10))/10 == 19)begin
						 colour <= NINE[({counter_x-524}*20+counter_y-382)];
					end
				
            end
//end total-R2

//start total-R3
            if (counter_x >=544 && counter_x <=563 && counter_y >=382 && counter_y <=401)begin
            
					if(Total_Received %10 == 0)begin
						colour <= ZERO[({counter_x-544}*20+counter_y-382)];
					end

					else if(Total_Received %10 == 1)begin
						colour <= ONE[({counter_x-544}*20+counter_y-382)];
					end

					else if(Total_Received %10 == 2)begin
						colour <= TWO[({counter_x-544}*20+counter_y-382)];
					end

					else if(Total_Received %10 == 3)begin
						colour <= THREE[({counter_x-544}*20+counter_y-382)];
					end

					else if(Total_Received %10 == 4)begin
						colour <= FOUR[({counter_x-544}*20+counter_y-382)];
					end

					else if(Total_Received %10 == 5)begin
						colour <= FIVE[({counter_x-544}*20+counter_y-382)];
					end

					else if(Total_Received %10 == 6)begin
						colour <= SIX[({counter_x-544}*20+counter_y-382)];
					end

					else if(Total_Received %10 == 7)begin
						colour <= SEVEN[({counter_x-544}*20+counter_y-382)];
					end

					else if(Total_Received %10 == 8)begin
						colour <= EIGHT[({counter_x-544}*20+counter_y-382)];
					end

					else if(Total_Received %10 == 9)begin
						colour <= NINE[({counter_x-544}*20+counter_y-382)];
					end
				
            end
//end total-R3

//start total-T1
            if (counter_x >=584 && counter_x <=603 && counter_y >=382 && counter_y <=401)begin
            
					if((Total_Transmitted-(Total_Transmitted %100))/100 == 0)begin
						 colour <= ZERO[({counter_x-584}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %100))/100 == 1)begin
						 colour <= ONE[({counter_x-584}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %100))/100 == 2)begin
						 colour <= TWO[({counter_x-584}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %100))/100 == 3)begin
						 colour <= THREE[({counter_x-584}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %100))/100 == 4)begin
						 colour <= FOUR[({counter_x-584}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %100))/100 == 5)begin
						 colour <= FIVE[({counter_x-584}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %100))/100 == 6)begin
						 colour <= SIX[({counter_x-584}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %100))/100 == 7)begin
						 colour <= SEVEN[({counter_x-584}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %100))/100 == 8)begin
						 colour <= EIGHT[({counter_x-584}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %100))/100 == 9)begin
						 colour <= NINE[({counter_x-584}*20+counter_y-382)];
					end
				
            end
//end total-T1


//start total-T2
            if (counter_x >=604 && counter_x <=623 && counter_y >=382 && counter_y <=401)begin
            
					if((Total_Transmitted-(Total_Transmitted %10))/10 == 0)begin
						 colour <= ZERO[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 1)begin
						 colour <= ONE[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 2)begin
						 colour <= TWO[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 3)begin
						 colour <= THREE[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 4)begin
						 colour <= FOUR[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 5)begin
						 colour <= FIVE[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 6)begin
						 colour <= SIX[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 7)begin
						 colour <= SEVEN[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 8)begin
						 colour <= EIGHT[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 9)begin
						 colour <= NINE[({counter_x-604}*20+counter_y-382)];
					end
					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 10)begin
						 colour <= ZERO[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 11)begin
						 colour <= ONE[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 12)begin
						 colour <= TWO[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 13)begin
						 colour <= THREE[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 14)begin
						 colour <= FOUR[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 15)begin
						 colour <= FIVE[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 16)begin
						 colour <= SIX[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 17)begin
						 colour <= SEVEN[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 18)begin
						 colour <= EIGHT[({counter_x-604}*20+counter_y-382)];
					end

					else if((Total_Transmitted-(Total_Transmitted %10))/10 == 19)begin
						 colour <= NINE[({counter_x-604}*20+counter_y-382)];
					end
				
            end
//end total-T2


//start total-T3
            if (counter_x >=624 && counter_x <=643 && counter_y >=382 && counter_y <=401)begin
            
					if(Total_Transmitted %10 == 0)begin
						 colour <= ZERO[({counter_x-624}*20+counter_y-382)];
					end

					else if(Total_Transmitted %10 == 1)begin
						 colour <= ONE[({counter_x-624}*20+counter_y-382)];
					end

					else if(Total_Transmitted %10 == 2)begin
						 colour <= TWO[({counter_x-624}*20+counter_y-382)];
					end

					else if(Total_Transmitted %10 == 3)begin
						 colour <= THREE[({counter_x-624}*20+counter_y-382)];
					end

					else if(Total_Transmitted %10 == 4)begin
						 colour <= FOUR[({counter_x-624}*20+counter_y-382)];
					end

					else if(Total_Transmitted %10 == 5)begin
						 colour <= FIVE[({counter_x-624}*20+counter_y-382)];
					end

					else if(Total_Transmitted %10 == 6)begin
						 colour <= SIX[({counter_x-624}*20+counter_y-382)];
					end

					else if(Total_Transmitted %10 == 7)begin
						 colour <= SEVEN[({counter_x-624}*20+counter_y-382)];
					end

					else if(Total_Transmitted %10 == 8)begin
						 colour <= EIGHT[({counter_x-624}*20+counter_y-382)];
					end

					else if(Total_Transmitted %10 == 9)begin
						 colour <= NINE[({counter_x-624}*20+counter_y-382)];
					end
				
            end
//end total-T3

//start total-D1
            if (counter_x >=664 && counter_x <=683 && counter_y >=382 && counter_y <=401)begin
            
					if((Total_Dropped-(Total_Dropped %100))/100 == 0)begin
						 colour <= ZERO[({counter_x-664}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %100))/100 == 1)begin
						 colour <= ONE[({counter_x-664}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %100))/100 == 2)begin
						 colour <= TWO[({counter_x-664}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %100))/100 == 3)begin
						 colour <= THREE[({counter_x-664}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %100))/100 == 4)begin
						 colour <= FOUR[({counter_x-664}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %100))/100 == 5)begin
						 colour <= FIVE[({counter_x-664}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %100))/100 == 6)begin
						 colour <= SIX[({counter_x-664}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %100))/100 == 7)begin
						 colour <= SEVEN[({counter_x-664}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %100))/100 == 8)begin
						 colour <= EIGHT[({counter_x-664}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %100))/100 == 9)begin
						 colour <= NINE[({counter_x-664}*20+counter_y-382)];
					end
				
            end
//end total-D1


//start total-D2
            if (counter_x >=684 && counter_x <=703 && counter_y >=382 && counter_y <=401)begin
            
					if((Total_Dropped-(Total_Dropped %10))/10 == 0)begin
						 colour <= ZERO[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 1)begin
						 colour <= ONE[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 2)begin
						 colour <= TWO[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 3)begin
						 colour <= THREE[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 4)begin
						 colour <= FOUR[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 5)begin
						 colour <= FIVE[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 6)begin
						 colour <= SIX[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 7)begin
						 colour <= SEVEN[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 8)begin
						 colour <= EIGHT[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 9)begin
						 colour <= NINE[({counter_x-684}*20+counter_y-382)];
					end
					else if((Total_Dropped-(Total_Dropped %10))/10 == 10)begin
						 colour <= ZERO[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 11)begin
						 colour <= ONE[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 12)begin
						 colour <= TWO[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 13)begin
						 colour <= THREE[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 14)begin
						 colour <= FOUR[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 15)begin
						 colour <= FIVE[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 16)begin
						 colour <= SIX[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 17)begin
						 colour <= SEVEN[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 18)begin
						 colour <= EIGHT[({counter_x-684}*20+counter_y-382)];
					end

					else if((Total_Dropped-(Total_Dropped %10))/10 == 19)begin
						 colour <= NINE[({counter_x-684}*20+counter_y-382)];
					end
				
            end
//end total-D2


//start total-D3
            if (counter_x >=704 && counter_x <=723 && counter_y >=382 && counter_y <=401)begin
            
					if(Total_Dropped %10 == 0)begin
						 colour <= ZERO[({counter_x-704}*20+counter_y-382)];
					end

					else if(Total_Dropped %10 == 1)begin
						 colour <= ONE[({counter_x-704}*20+counter_y-382)];
					end

					else if(Total_Dropped %10 == 2)begin
						 colour <= TWO[({counter_x-704}*20+counter_y-382)];
					end

					else if(Total_Dropped %10 == 3)begin
						 colour <= THREE[({counter_x-704}*20+counter_y-382)];
					end

					else if(Total_Dropped %10 == 4)begin
						 colour <= FOUR[({counter_x-704}*20+counter_y-382)];
					end

					else if(Total_Dropped %10 == 5)begin
						 colour <= FIVE[({counter_x-704}*20+counter_y-382)];
					end

					else if(Total_Dropped %10 == 6)begin
						 colour <= SIX[({counter_x-704}*20+counter_y-382)];
					end

					else if(Total_Dropped %10 == 7)begin
						 colour <= SEVEN[({counter_x-704}*20+counter_y-382)];
					end

					else if(Total_Dropped %10 == 8)begin
						 colour <= EIGHT[({counter_x-704}*20+counter_y-382)];
					end

					else if(Total_Dropped %10 == 9)begin
						 colour <= NINE[({counter_x-704}*20+counter_y-382)];
					end
				
            end
//end total-D3
//bilal end

end //always

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// color output assignments
	// only output the colors if the counters are within the adressable video time constraints
	assign vgacolour = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 514) ? colour : 8'd0;
	// end color output assignments
	
	endmodule
	