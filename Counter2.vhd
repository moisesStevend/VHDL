library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--contador descendente
entity Counter2 is
	port(
		clk, reset: in std_logic;
		b: out std_logic_vector(3 downto 0));
end Counter2;

architecture b of Counter2 is	
begin
	conteo: process(clk) 
			variable count: unsigned(3 downto 0);
		begin
			if rising_edge(clk) then
				if reset='0' then
					count:=(others=>'0');
				else
					count:=count-1;
				end if;
				b<=std_logic_vector(count);
			end if;
		end process conteo;

end b;