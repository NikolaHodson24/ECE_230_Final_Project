module DFlipFlop(
    input D , clock, enable, reset,
    output reg Q ,
    output NotQ
    );
    
    initial begin
        Q <= 0;
    end
    
    always @(posedge clock or posedge reset) begin
        if(reset)Q <= 1'b0;
        else
        if (enable) Q <= D;
    end

    assign NotQ = ~Q;
   
endmodule