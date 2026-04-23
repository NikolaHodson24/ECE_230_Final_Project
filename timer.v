//Timer: Mod-60 downcounter with synchronous load
module timer(
    input clk,
    input rst,
    input en,               //Enables or Disables clock
    input load,             //If load=1, load the counter with "load_value"
    input [5:0] load_value, //Value to load into counter register. Counter will then start counting from this value
    output [5:0] state     //6-bits to represent the highest number 59
);

wire D[5:0];
wire Q[5:0];
wire isZero;

wire enable = en & ~isZero;

assign isZero = (~Q[0] & ~Q[1] & ~Q[2] & ~Q[3] & ~Q[4] & ~Q[5]) & ~load;

assign D[0] = load ? load_value[0] : ~Q[0] ; //Q0 toggles every clock cycle
assign D[1] = load ? load_value[1] : Q[1] ^ ~Q[0] ; //Q1 toggles when Q0 = 0.
assign D[2] = load ? load_value[2] : Q[2] ^ (~Q[0] & ~Q[1]); //Q2 toggles when Q0 = 0 and Q1 = 0
assign D[3] = load ? load_value[3] : Q[3] ^ (~Q[0] & ~Q[1] & ~Q[2]);
assign D[4] = load ? load_value[4] : Q[4] ^ (~Q[0] & ~Q[1] & ~Q[2] & ~Q[3]);
assign D[5] = load ? load_value[5] : Q[5] ^ (~Q[0] & ~Q[1] & ~Q[2] & ~Q[3] & ~Q[4]);

DFlipFlop flip0(
    .D(D[0]),
    .enable(enable),
    .reset(rst),
    .clock(clk),
    .Q(Q[0])
    );
    
    DFlipFlop flip1(
    .D(D[1]),
    .enable(enable),
    .reset(rst),
    .clock(clk),
    .Q(Q[1])
    );
    
    DFlipFlop flip2(
    .D(D[2]),
    .enable(enable),
    .reset(rst),
    .clock(clk),
    .Q(Q[2])
    );
    
    DFlipFlop flip3(
    .D(D[3]),
    .enable(enable),
    .reset(rst),
    .clock(clk),
    .Q(Q[3])
    );
    
    DFlipFlop flip4(
    .D(D[4]),
    .enable(enable),
    .reset(rst),
    .clock(clk),
    .Q(Q[4])
    );
    
    DFlipFlop flip5(
    .D(D[5]),
    .enable(enable),
    .reset(rst),
    .clock(clk),
    .Q(Q[5])
    );
    
    assign state[0] = Q[0];
    assign state[1] = Q[1];
    assign state[2] = Q[2];
    assign state[3] = Q[3];
    assign state[4] = Q[4];
    assign state[5] = Q[5];

endmodule