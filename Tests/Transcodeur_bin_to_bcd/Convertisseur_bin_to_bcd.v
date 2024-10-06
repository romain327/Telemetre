module Convertisseur_bin_to_bcd(Distance, Clk, Centaine, Dizaine, Unite);

input[7:0] Distance;
//reg[7:0] Distance;
input Clk;

output[3:0] Centaine;
reg[3:0] Centaine;

output[3:0] Dizaine;
reg[3:0] Dizaine;

output[3:0] Unite;
reg[3:0] Unite;

reg[7:0] Temp;

always @(negedge(Clk))
begin
	Centaine = Distance / 100;
	Temp = Distance % 100;
	Dizaine = Temp / 10;
	Unite = Temp % 10;
end

endmodule