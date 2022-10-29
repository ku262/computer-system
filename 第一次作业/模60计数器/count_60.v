module count_60(
    input wire rst,
    input wire clk,
    input wire en,
    output wire [6:0] count,
    output wire co
);
    wire co10,co6;
    wire [3:0] count10;
    wire [3:0] count6;
    count_10 u_count_10(
    	.rst   (rst   ),
        .clk   (clk   ),
        .en    (en    ),
        .count (count10),
        .co    (co10  )
    );
    assign co6 = en & co10;
    assign count = count6 * 10 + count10;
    count_6 u_count_6(
    	.rst   (rst   ),
        .clk   (clk   ),
        .en    (co10  ),
        .count (count6),
        .co    (co6    )
    );
    assign co = (count == 7'd59);
endmodule