module full_adder(
    input carry_in , A, B,
    output Y , carry_out
);

    assign Y = (A ^ B) ^ carry_in ;
    
    assign carry_out = carry_in & ( A | B ) | A & B ;
    

endmodule