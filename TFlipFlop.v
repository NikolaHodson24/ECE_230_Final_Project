module TFlipFlop(
    input T , clock,
    output Q ,NotQ
    );
    
    wire D;
    
    mux try(
        .A(Q),
        .B(NotQ),
        .sel(T),
        .en(1),
        .out(D)
    );
    
    DFlipFlop trial(
        .D(D),
        .clock(clock),
        .Q(Q),
        .NotQ(NotQ)
    );
    
endmodule