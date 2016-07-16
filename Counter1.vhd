library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--contador ascendente
entity Counter1 is
	port(
		clk, reset: in std_logic;
		a: out std_logic_vector(3 downto 0));
end Counter1;

architecture b of Counter1 is	
begin
	conteo: process(clk) 
			variable count: unsigned(3 downto 0);
		begin
			if rising_edge(clk) then
				if reset='0' then
					count:=(others=>'0');
				else
					count:=count+1;
				end if;
				a<=std_logic_vector(count);
			end if;
		end process conteo;

end b;