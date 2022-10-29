module count_60(
    input wire rst,
    input wire clk,
    input wire en,
    output wire [7:0] count,
    output wire co
);
    wire co10,co6,co10_j;
    wire [3:0] count10, count6;
    count_10 u_count_10(
    	.rst   (rst   ),
        .clk   (clk   ),
        .en    (en    ),
        .count (count10 ),
        .co    (co10_j    )
    );
    wire en_6;
    assign en_6=co10_j&en;
    count_6 u_count_6(
    	.rst   (rst   ),
        .clk   (clk   ),
        .en    (en_6    ),
        .count (count6 ),
        .co    (co6    )
    );
    assign co=en_6&co6;
    assign count= {count6,count10};
endmodule