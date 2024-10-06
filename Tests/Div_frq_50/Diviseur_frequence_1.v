module Diviseur_frequence_1(Clk, Frq);
parameter DIV = 49;
parameter REG_SIZE = 8;
parameter POLARITY = 1;
parameter PR = 25;

input Clk;
output Frq;
reg Frq;

reg[REG_SIZE:0] fronts;

always @(negedge(Clk))
begin

	if (fronts < DIV)
	begin
		fronts <= fronts + 1;
	end
	else
	begin
		fronts <= 0;
	end
	
	if (fronts < PR)
	begin
		Frq <= POLARITY;
	end
	else
	begin
		Frq <= ~POLARITY;
	end
end

endmodule