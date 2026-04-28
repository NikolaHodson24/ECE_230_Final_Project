//StopWatch: Modulo-60 Counter

module stopwatch(
    input clk, rst, en,
    output [5:0]state,
    output out
    );
    
    wire carry1;
    wire carry2;
    wire carry3;
    wire carry4;
    wire carry5;
    
    wire y1;
    wire y2;
    wire y3;
    wire y4;
    wire y5;
    wire y6;
    
    wire q[5:0];
    
    full_adder add_one(
        .A(q[0]),
        .B(1'b1),
        .Y(y1),
        .carry_in(1'b0),
        .carry_out(carry1)
    );
    
    DFlipFlop flip_one(
        .clock(clk),
        .D(y1),
        .reset(rst),
        .Q(q[0]),
        .enable(en) 
    );
    
    full_adder add_two(
        .A(q[1]),
        .B(1'b0),
        .Y(y2),
        .carry_in(carry1),
        .carry_out(carry2)
    );
    
    DFlipFlop flip_two(
        .clock(clk),
        .D(y2),
        .reset(rst),
        .Q(q[1]),
        .enable(en)  
    );
    
    full_adder add_three(
        .A(q[2]),
        .B(1'b0),
        .Y(y3),
        .carry_in(carry2),
        .carry_out(carry3)
    );
    
    DFlipFlop flip_three(
        .clock(clk),
        .D(y3),
        .reset(rst),
        .Q(q[2]),
        .enable(en)  
    );

    full_adder add_four(
        .A(q[3]),
        .B(1'b0),
        .Y(y3),
        .carry_in(carry2),
        .carry_out(carry4)
    );
    
    DFlipFlop flip_four(
        .clock(clk),
        .D(y3),
        .reset(rst),
        .Q(q[3]),
        .enable(en)  
    );

    full_adder add_five(
        .A(q[4]),
        .B(1'b0),
        .Y(y5),
        .carry_in(carry4),
        .carry_out(carry5)
    );
    
    DFlipFlop flip_five(
        .clock(clk),
        .D(y5),
        .reset(rst),
        .Q(q[4]),
        .enable(en)  
    );

    full_adder add_six(
        .A(q[5]),
        .B(1'b0),
        .Y(y6),
        .carry_in(carry5),
        .carry_out()
    );
    
    DFlipFlop flip_six(
        .clock(clk),
        .D(y6),
        .reset(rst),
        .Q(q[5]),
        .enable(en)  
    );
    
    wire res;
    
    assign res = (q[0] & q[1] & ~q[2] & q[3] & q[4] & q[5]) | rst;
    
    wire in = res;
    
    DFlipFlop final(
       .D(in),
       .reset(rst),
       .clock(clock),
       .Q(out)
    );
    
    assign state[0] = q[0];
    assign state[1] = q[1];
    assign state[2] = q[2];
    assign state[3] = q[3];
    assign state[4] = q[4];
    assign state[5] = q[5];
    
    
endmodule
