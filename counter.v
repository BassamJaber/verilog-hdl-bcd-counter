module counter (clock,reset,count,up,down,carryBCD,borrowBCD);
output [3:0] count;
output carryBCD,borrowBCD;
input clock , reset,up,down;
reg [3:0] count;
reg carryBCD;
reg borrowBCD;
always @(posedge clock or negedge reset)
if(~reset)
count=4'b0000;
else if(up & (count == 4'b1001))
     begin
     count=4'b0000;
     carryBCD<=1'b1;
     end
     else if(up)
          begin
          count=count+1;
          carryBCD<=1'b0;
          end
          else if(down & (count == 4'b0000))
                begin
                count=4'b1001;
                borrowBCD<=1'b1;
                end
                else if(down)
                     begin
                     count=count-1;
                     borrowBCD<=1'b0;
                     end
                     
endmodule
