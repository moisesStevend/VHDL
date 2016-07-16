library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
--contador de pares
entity Counter4 is
	port(
		clk, reset: in std_logic;
		d: out std_logic_vector(3 downto 0));
end Counter4;

architecture b of Counter4 is	
begin
	conteo: process(clk) 
			variable count: unsigned(3 downto 0);
			variable count2: unsigned(3 downto 0);
		begin
			if rising_edge(clk) then
				if reset='0' then
					count:=(others=>'0');
				else
					--count:=count+1;
					if (to_integer(count) mod 8)=0 then
						count2:=count;
					end if;	
					count:=count+1;
				end if;
				d<=std_logic_vector(count2);
			end if;
		end process conteo;

end b;