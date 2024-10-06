module Compteur(Clk, Mesure, Nb);
input Mesure,Clk;
output[7:0] Nb;
reg[7:0] Nb;
reg[31:0] temp;

always @(negedge(Mesure))
begin
		Nb = temp / 147; //division par 147
		if(Nb < 6)
		begin
			Nb = 6;
		end
		if(Nb > 254)
		begin
			Nb = 254;
		end
end

always @(negedge(Clk))
begin
        if (Mesure)
        begin
                temp <= temp +1;
        end
        else
        begin
                temp <=0;
        end
end
endmodule