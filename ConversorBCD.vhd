library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ConversorBCD is
	port(
		entrada_bcd: in std_logic_vector(3 downto 0);
		sal7_seg: out std_logic_vector(7 downto 0)
	);
end ConversorBCD;

architecture b of ConversorBCD is
begin
	with entrada_bcd select	
		sal7_seg <= not "01000000" when "0000",
					 "00000110" when "0001",
					 "01011011" when "0010",
					 "01001111" when "0011",
					 "01100110" when "0100",
					 "01101101" when "0101",
					 "01111101" when "0110",
					 "00000111" when "0111",
					 "01111111" when "1000",
					 "01100111" when "1001",
					 "01110110" when others;

end b;
