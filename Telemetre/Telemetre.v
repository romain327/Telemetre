module Telemetre(Clk, Mesure, CmdLED, Aff7SegCent, Aff7SegDiz, Aff7SegUnit);

input Clk; // Clock du FPGA cadencée à 50MHz
input Mesure;

output CmdLED;
output[0:6] Aff7SegCent, Aff7SegDiz, Aff7SegUnit;
wire[0:6] Aff7SegCent, Aff7SegDiz, Aff7SegUnit;

wire Clk1MHz, Clk20Hz;
wire[7:0] Distance;
wire[3:0] Centaine, Dizaine, Unite;

Diviseur_frequence #(49, 8, 1, 25) Diviseur_frequence_1MHz(Clk, Clk1MHz);
Diviseur_frequence #(2499999, 22, 1, 1250000) Diviseur_frequence_20Hz(Clk, Clk20Hz);
Compteur Compteur(Clk1MHz, Mesure, Distance);
Convertisseur_bin_to_bcd Conv_bin_to_bcd(Distance, Clk20Hz, Centaine, Dizaine, Unite);
Comparateur Comp(Distance, CmdLED);
Transcodeur_7_Seg Transcodeur_Centaine(Centaine, Aff7SegCent);
Transcodeur_7_Seg Transcodeur_Dizaine(Dizaine, Aff7SegDiz);
Transcodeur_7_Seg Transcodeur_Unite(Unite, Aff7SegUnit);

endmodule