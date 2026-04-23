module JKFlipFlop(
    input J , K , clock,
    output Q , NotQ
    );
    
    wire D = J & NotQ | ~K &Q ;
    
    DFlipFlop trial(
        .D(D),
        .clock(clock),
        .Q(Q),
        .NotQ(NotQ)
    );
    
    
endmodule