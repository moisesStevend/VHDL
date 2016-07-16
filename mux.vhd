library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux is
	port(
		a,b,c,d: in std_logic_vector(3 downto 0);
		sel: in std_logic_vector(1 downto 0);
		salida: out std_logic_vector(3 downto 0));
end mux;

architecture b of mux is
begin
	with sel select
		salida <= a when "00",
				  b when "01",
				  c when "10",
				  d when "11",
				  (others=>'Z') when others;

end b;