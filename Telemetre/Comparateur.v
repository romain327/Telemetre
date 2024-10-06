module Comparateur(Distance, CmdLED);

input[7:0] Distance;

output CmdLED;
reg CmdLED;

always @(Distance)
begin
	if (Distance < 15)
	begin
		CmdLED <= 1;
	end
	else
	begin
		CmdLED <= 0;
	end
end

endmodule