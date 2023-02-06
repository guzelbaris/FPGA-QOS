module son(clk,Start,Zeros,Ones,bf1,Depth1,bf2,Depth2,bf3,Depth3,bf4,Depth4,read,Total_Received,Total_Transmitted,Total_Dropped,
Received_bf1,Transmitted_bf1,Dropped_bf1,Received_bf2,Transmitted_bf2,Dropped_bf2,Received_bf3,Transmitted_bf3,Dropped_bf3,Received_bf4,
Transmitted_bf4,Dropped_bf4);
 input clk,Start,Ones,Zeros;
 output reg [11:0] bf1;
 output reg [11:0] bf2;
 output reg [11:0] bf3;
 output reg [11:0] bf4;
 output reg [2:0] Depth1;
 output reg [2:0] Depth2;
 output reg [2:0] Depth3;
 output reg [2:0] Depth4;
 reg [2:0] Count0;
 reg Checker;
 reg Checker0;
 reg Checker1;
 reg [3:0] P;
 output reg [7:0] Total_Received;
 output reg [7:0] Total_Transmitted;
 output reg [7:0] Total_Dropped;
 output reg [6:0] Received_bf1;
 output reg [6:0] Transmitted_bf1;
 output reg [6:0] Dropped_bf1;
 output reg [6:0] Received_bf2;
 output reg [6:0] Transmitted_bf2;
 output reg [6:0] Dropped_bf2;
 output reg [6:0] Received_bf3;
 output reg [6:0] Transmitted_bf3;
 output reg [6:0] Dropped_bf3;
 output reg [6:0] Received_bf4;
 output reg [6:0] Transmitted_bf4;
 output reg [6:0] Dropped_bf4;
 reg [28:0] read_time;
 output reg [3:0] read;
  
  initial begin
  Depth1<=0;
  Depth2<=0;
  Depth3<=0;
  Depth4<=0;
  Count0<=0;
  Checker0<=1;
  Checker1<=1;
  read_time<=0;
  Received_bf1<=0;
  Transmitted_bf1<=0;
  Dropped_bf1<=0;
  Received_bf2<=0;
  Transmitted_bf2<=0;
  Dropped_bf2<=0;
  Received_bf3<=0;
  Transmitted_bf3<=0;
  Dropped_bf3<=0;
  Dropped_bf4<=0;
  Received_bf4<=0;
  Transmitted_bf4<=0;
  Dropped_bf4<=0;
  read<=0;
  Total_Received<=0;
  Total_Transmitted<=0;
  Total_Dropped<=0;
  end

  always@(posedge clk) 
  begin
  read_time<=read_time+29'd1;
  Total_Received<=Received_bf4+Received_bf3+Received_bf2+Received_bf1;
  Total_Transmitted<=Transmitted_bf4+Transmitted_bf3+Transmitted_bf2+Transmitted_bf1;
  Total_Dropped<=Dropped_bf4+Dropped_bf3+Dropped_bf2+Dropped_bf1;
	if (read_time==150000000) begin
	read_time<=0;
	if (Depth4==6)begin
	read<=bf4[1:0]+4'd12;
	bf4[11:10]<=0;
	bf4[9:8]<=bf4[11:10];
	bf4[7:6]<=bf4[9:8];
	bf4[5:4]<=bf4[7:6];
	bf4[3:2]<=bf4[5:4];
	bf4[1:0]<=bf4[3:2];
	Transmitted_bf4<=Transmitted_bf4+6'd1;
	Depth4<= Depth4-3'd1;
	end
	else if (Depth4==5)begin
	read<=bf4[1:0]+4'd12;
	bf4[9:8]<=0;
	bf4[7:6]<=bf4[9:8];
	bf4[5:4]<=bf4[7:6];
	bf4[3:2]<=bf4[5:4];
	bf4[1:0]<=bf4[3:2];
	Transmitted_bf4<=Transmitted_bf4+6'd1;
	Depth4<=Depth4-3'd1;
	end
	else if (Depth4==4 && Depth1==0 && Depth3==0 && Depth2==0)begin
	read<=bf4[1:0]+4'd12;
	bf4[7:6]<=0;
	bf4[5:4]<=bf4[7:6];
	bf4[3:2]<=bf4[5:4];
	bf4[1:0]<=bf4[3:2];
	Transmitted_bf4<=Transmitted_bf4+6'd1;
	Depth4<=Depth4-3'd1;
	end
	else if (Depth4==3 && Depth3==0 && Depth2==0 && Depth1==0)begin
	read<=bf4[1:0]+4'd12;
	bf4[5:4]<=0;
	bf4[3:2]<=bf4[5:4];
	bf4[1:0]<=bf4[3:2];
	Transmitted_bf4<=Transmitted_bf4+6'd1;
	Depth4<=Depth4-3'd1;
	end
	else if (Depth4==2 && Depth3==0 && Depth2==0 && Depth1==0)begin
	read<=bf4[1:0]+4'd12;
	bf4[3:2]<=0;
	bf4[1:0]<=bf4[3:2];
	Transmitted_bf4<=Transmitted_bf4+6'd1;
	Depth4<=Depth4-3'd1;
	end
	else if (Depth4==1 && Depth3==0 && Depth2==0 && Depth1==0)begin
	read<=bf4[1:0]+4'd12;
	bf4[1:0]<=0;
	Transmitted_bf4<=Transmitted_bf4+6'd1;
	Depth4<=Depth4-3'd1;
	end
	else if (Depth3==6)begin
	read<=bf3[1:0]+4'd8;
	bf3[11:10]<=0;
	bf3[9:8]<=bf3[11:10];
	bf3[7:6]<=bf3[9:8];
	bf3[5:4]<=bf3[7:6];
	bf3[3:2]<=bf3[5:4];
	bf3[1:0]<=bf3[3:2];
	Transmitted_bf3<=Transmitted_bf3+6'd1;
	Depth3<=Depth3-3'd1;
	end
	else if (Depth3==5)begin
	read<=bf3[1:0]+4'd8;
	bf3[9:8]<=0;
	bf3[7:6]<=bf3[9:8];
	bf3[5:4]<=bf3[7:6];
	bf3[3:2]<=bf3[5:4];
	bf3[1:0]<=bf3[3:2];
	Transmitted_bf3<=Transmitted_bf3+6'd1;
	Depth3<=Depth3-3'd1;
	end
	else if (Depth3==4 && Depth2==0 && Depth1==0)begin
	read<=bf3[1:0]+4'd8;
	bf3[7:6]<=0;
	bf3[5:4]<=bf3[7:6];
	bf3[3:2]<=bf3[5:4];
	bf3[1:0]<=bf3[3:2];
	Transmitted_bf3<=Transmitted_bf3+6'd1;
	Depth3<=Depth3-3'd1;
	end
	else if (Depth3==3 && Depth2==0 && Depth1==0)begin
	read<=bf3[1:0]+4'd8;
	bf3[5:4]<=0;
	bf3[3:2]<=bf3[5:4];
	bf3[1:0]<=bf3[3:2];
	Transmitted_bf3<=Transmitted_bf3+6'd1;
	Depth3<=Depth3-3'd1;
	end
	else if (Depth3==2 && Depth2==0 && Depth1==0)begin
	read<=bf3[1:0]+4'd8;
	bf3[3:2]<=0;
	bf3[1:0]<=bf3[3:2];
	Transmitted_bf3<=Transmitted_bf3+6'd1;
	Depth3<=Depth3-3'd1;
	end
	else if (Depth3==1 && Depth2==0 && Depth1==0)begin
	read<=bf3[1:0]+4'd8;
	bf3[1:0]<=0;
	Transmitted_bf3<=Transmitted_bf3+6'd1;
	Depth3<=Depth3-3'd1;
	end
	else if (Depth2==6)begin
	read<=bf2[1:0]+4'd4;
	bf2[11:10]<=0;
	bf2[9:8]<=bf2[11:10];
	bf2[7:6]<=bf2[9:8];
	bf2[5:4]<=bf2[7:6];
	bf2[3:2]<=bf2[5:4];
	bf2[1:0]<=bf2[3:2];
	Transmitted_bf2<=Transmitted_bf2+6'd1;
	Depth2<=Depth2-3'd1;
	end
	else if (Depth2==5)begin
	read<=bf2[1:0]+4'd4;
	bf2[9:8]<=0;
	bf2[7:6]<=bf2[9:8];
	bf2[5:4]<=bf2[7:6];
	bf2[3:2]<=bf2[5:4];
	bf2[1:0]<=bf2[3:2];
	Transmitted_bf2<=Transmitted_bf2+6'd1;
	Depth2<=Depth2-3'd1;
	end
	else if (Depth2==4 && Depth1==0)begin
	read<=bf2[1:0]+4'd4;
	bf2[7:6]<=0;
	bf2[5:4]<=bf2[7:6];
	bf2[3:2]<=bf2[5:4];
	bf2[1:0]<=bf2[3:2];
	Transmitted_bf2<=Transmitted_bf2+6'd1;
	Depth2<=Depth2-3'd1;
	end
	else if (Depth2==3 && Depth1==0)begin
	read<=bf2[1:0]+4'd4;
	bf2[5:4]<=0;
	bf2[3:2]<=bf2[5:4];
	bf2[1:0]<=bf2[3:2];
	Transmitted_bf2<=Transmitted_bf2+6'd1;
	Depth2<=Depth2-3'd1;
	end
	else if (Depth2==2 && Depth1==0)begin
	read<=bf2[1:0]+4'd4;
	bf2[3:2]<=0;
	bf2[1:0]<=bf2[3:2];
	Transmitted_bf2<=Transmitted_bf2+6'd1;
	Depth2<=Depth2-3'd1;
	end
	else if (Depth2==1 && Depth1==0)begin
	read<=bf2[1:0]+4'd4;
	bf2[1:0]<=0;
	Transmitted_bf2<=Transmitted_bf2+6'd1;
	Depth2<=Depth2-3'd1;
	end
	else if (Depth1==6)begin
	read<=bf1[1:0];
	bf1[11:10]<=0;
	bf1[9:8]<=bf1[11:10];
	bf1[7:6]<=bf1[9:8];
	bf1[5:4]<=bf1[7:6];
	bf1[3:2]<=bf1[5:4];
	bf1[1:0]<=bf1[3:2];
	Transmitted_bf1<=Transmitted_bf1+6'd1;
	Depth1<=Depth1-3'd1;
	end
	else if (Depth1==5)begin
	read<=bf1[1:0];
	bf1[9:8]<=0;
	bf1[7:6]<=bf1[9:8];
	bf1[5:4]<=bf1[7:6];
	bf1[3:2]<=bf1[5:4];
	bf1[1:0]<=bf1[3:2];
	Transmitted_bf1<=Transmitted_bf1+6'd1;
	Depth1<=Depth1-3'd1;
	end
	else if (Depth1==4)begin
	read<=bf1[1:0];
	bf1[7:6]<=0;
	bf1[5:4]<=bf1[7:6];
	bf1[3:2]<=bf1[5:4];
	bf1[1:0]<=bf1[3:2];
	Transmitted_bf1<=Transmitted_bf1+6'd1;
	Depth1<=Depth1-3'd1;
	end
	else if (Depth1==3)begin
	read<=bf1[1:0];
	bf1[5:4]<=0;
	bf1[3:2]<=bf1[5:4];
	bf1[1:0]<=bf1[3:2];
	Transmitted_bf1<=Transmitted_bf1+6'd1;
	Depth1<=Depth1-3'd1;
	end
	else if (Depth1==2)begin
	read<=bf1[1:0];
	bf1[3:2]<=0;
	bf1[1:0]<=bf1[3:2];
	Transmitted_bf1<=Transmitted_bf1+6'd1;
	Depth1<=Depth1-3'd1;
	end
	else if (Depth1==1)begin
	read<=bf1[1:0];
	bf1[1:0]<=0;
	Transmitted_bf1<=Transmitted_bf1+6'd1;
	Depth1<=Depth1-3'd1;
	end
	end
	
   if (read_time!=150000000 &&Start==0) begin
	Checker<=1;
	Count0<=0;
   Checker0<=1;
   Checker0<=1;
	end
	if (Checker==1) begin
        if (Count0==4) begin
		  Count0<=0;
		  Checker<=0;
            if (P[3:2]==0) begin
				Received_bf1<=Received_bf1+6'd1;
				if (Depth1==6)begin
				Dropped_bf1<=Dropped_bf1+6'd1;
            bf1[11:10]<=P[1:0];
				bf1[9:8]<=bf1[11:10];
				bf1[7:6]<=bf1[9:8];
				bf1[5:4]<=bf1[7:6];
				bf1[3:2]<=bf1[5:4];
				bf1[1:0]<=bf1[3:2];				
				end
				else if(Depth1==5)begin
            bf1[11:10]<=P[1:0];
				Depth1<=Depth1+3'd1;
				end
				else if(Depth1==4)begin
            bf1[9:8]<=P[1:0];
				Depth1<=Depth1+3'd1;
				end
				else if(Depth1==3)begin
            bf1[7:6]<=P[1:0];
				Depth1<=Depth1+3'd1;
				end
				else if(Depth1==2)begin
            bf1[5:4]<=P[1:0];
				Depth1<=Depth1+3'd1;
				end
				else if(Depth1==1)begin
            bf1[3:2]<=P[1:0];
				Depth1<=Depth1+3'd1;
				end
				else if(Depth1==0)begin
            bf1[1:0]<=P[1:0];
				Depth1<=Depth1+3'd1;
				end
            end 
				else if(P[3:2]==1) begin
				Received_bf2<=Received_bf2+6'd1;		
				if (Depth2==6)begin
				Dropped_bf2<=Dropped_bf2+6'd1;
            bf2[11:10]<=P[1:0];
				bf2[9:8]<=bf2[11:10];
				bf2[7:6]<=bf2[9:8];
				bf2[5:4]<=bf2[7:6];
				bf2[3:2]<=bf2[5:4];
				bf2[1:0]<=bf2[3:2];
				end
				else if(Depth2==5)begin				
            bf2[11:10]<=P[1:0];
            Depth2<=Depth2+3'd1;
				end
				else if(Depth2==4)begin				
            bf2[9:8]<=P[1:0];
            Depth2<=Depth2+3'd1;
				end
				else if(Depth2==3)begin				
            bf2[7:6]<=P[1:0];
            Depth2<=Depth2+3'd1;
				end
				else if(Depth2==2)begin				
            bf2[5:4]<=P[1:0];
            Depth2<=Depth2+3'd1;
				end
				else if(Depth2==1)begin				
            bf2[3:2]<=P[1:0];
            Depth2<=Depth2+3'd1;
				end
				else if(Depth2==0)begin				
            bf2[1:0]<=P[1:0];
            Depth2<=Depth2+3'd1;
				end
            end 
				else if(P[3:2]==2) begin
				Received_bf3<=Received_bf3+6'd1;		
				if (Depth3==6)begin
				Dropped_bf3<=Dropped_bf3+6'd1;
            bf3[11:10]<=P[1:0];
				bf3[9:8]<=bf3[11:10];
				bf3[7:6]<=bf3[9:8];
				bf3[5:4]<=bf3[7:6];
				bf3[3:2]<=bf3[5:4];
				bf3[1:0]<=bf3[3:2];
				end
				else if(Depth3==5)begin					
				bf3[11:10]<=P[1:0];
            Depth3<=Depth3+3'd1;
				end
				else if(Depth3==4)begin					
				bf3[9:8]<=P[1:0];
            Depth3<=Depth3+3'd1;
				end
				else if(Depth3==3)begin					
				bf3[7:6]<=P[1:0];
            Depth3<=Depth3+3'd1;
				end
				else if(Depth3==2)begin					
				bf3[5:4]<=P[1:0];
            Depth3<=Depth3+3'd1;
				end
				else if(Depth3==1)begin					
				bf3[3:2]<=P[1:0];
            Depth3<=Depth3+3'd1;
				end
				else if(Depth3==0)begin					
				bf3[1:0]<=P[1:0];
            Depth3<=Depth3+3'd1;
				end
            end 
				else if(P[3:2]==3) begin
				Received_bf4<=Received_bf4+6'd1;		
				if (Depth4==6)begin
				Dropped_bf4<=Dropped_bf4+6'd1;
            bf4[11:10]<=P[1:0];
				bf4[9:8]<=bf4[11:10];
				bf4[7:6]<=bf4[9:8];
				bf4[5:4]<=bf4[7:6];
				bf4[3:2]<=bf4[5:4];
				bf4[1:0]<=bf4[3:2];
				end
				else if(Depth4==5)begin	
            bf4[11:10]<=P[1:0];
            Depth4<=Depth4+3'd1;
				end
				else if(Depth4==4)begin	
            bf4[9:8]<=P[1:0];
            Depth4<=Depth4+3'd1;
				end
				else if(Depth4==3)begin	
            bf4[7:6]<=P[1:0];
            Depth4<=Depth4+3'd1;
				end
				else if(Depth4==2)begin	
            bf4[5:4]<=P[1:0];
            Depth4<=Depth4+3'd1;
				end
				else if(Depth4==1)begin	
            bf4[3:2]<=P[1:0];
            Depth4<=Depth4+3'd1;
				end
				else if(Depth4==0)begin	
            bf4[1:0]<=P[1:0];
            Depth4<=Depth4+3'd1;
				end
            end
				P<=0;
        end 
            else if (Count0<=3) begin
                if (Zeros==0 && Checker0==1)
                begin
					 Checker0<=0;
                Count0<=Count0+3'd1;
                P[0]<=0;
                P[1]<=P[0];
                P[2]<=P[1];
                P[3]<=P[2];
                end 
					 else if(Ones==0 && Checker1==1) begin
                Count0<=Count0+3'd1;
					 Checker1<=0;
                P[0]<=1;
                P[1]<=P[0];
                P[2]<=P[1];
                P[3]<=P[2];
                end
					 if (Zeros==1) begin
					 Checker0<=1;
					 end
					 if (Ones==1) begin
					 Checker1<=1;
					 end
            end

    end
end
					
endmodule 
