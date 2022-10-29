module count_10(
    input wire rst,
    input wire clk,
    input wire en,
    output reg [3:0] count,
    output wire co
);
    always @ (posedge clk) 
	begin
        if (rst) 
		begin   //ÇåÁã
            count <= 4'b0;
        end
        else if (en) 
		begin   
            if (count == 4'd9)   //
			begin
                count <= 4'b0;
            end
            else 
			begin
                count <= count + 1'b1;
            end
        end
    end
    
    assign co = count[0]&count[3];
endmodule