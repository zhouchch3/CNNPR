module loop_count #(
  parameter DATA_WIDTH = 4
)
(
    input  clk,
    input  reset,
    input  reset2,
    input  count_condition,
    input  [ DATA_WIDTH   - 1 : 0 ] max,
    input  [ DATA_WIDTH   - 1 : 0 ] stride,
    output reg [ DATA_WIDTH   - 1 : 0 ] count 
    );
  always @(posedge clk or negedge reset) begin : proc_count
      if(~reset || reset2 ) begin
          count <= 0;
      end else if( count_condition )
        if (count < max )
            count <= count + stride;
        else
            count <= 0;
  end

endmodule // loop_count