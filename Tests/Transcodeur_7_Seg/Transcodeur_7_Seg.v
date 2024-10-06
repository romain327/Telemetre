module Transcodeur_7_Seg(E,S);
parameter ANODE_CATHODE = 0; // 1 pour Anode, 0 pour Cathode

input[3:0] E;
output[0:6] S;
reg[0:6] int_S;

assign S = (ANODE_CATHODE == 0)?(~int_S):int_S;

always @(E)
begin
        case(E)
        0 : int_S<=7'b1111110;
        1 : int_S<=7'b0110000;
        2 : int_S<=7'b1101101;
        3 : int_S<=7'b1111001;
        4 : int_S<=7'b0110011;
        5 : int_S<=7'b1011011;
        6 : int_S<=7'b1011111;
        7 : int_S<=7'b1110000;
        8 : int_S<=7'b1111111;
        9 : int_S<=7'b1111011;
        endcase
end
endmodule