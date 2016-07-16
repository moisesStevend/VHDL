library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity trama is
	port(
		clk, rst: in std_logic;
		x: in std_logic;
		led: out std_logic);
end trama;

architecture b of trama is
	type estados is (d0,d1,d2,d3,d4);
	signal edo_p, edo_f: estados;
	signal s_reg,s_next: std_logic;
	constant clave: std_logic_vector(4 downto 0):="10101";--esta es la trama que llega
begin
	clock: process(clk)
		begin
			if rising_edge(clk) then
				if rst='0' then
					s_reg<='0';
					edo_p<=d0;
				else
					s_reg<=s_next;
					edo_p<=edo_f;
				end if;
			end if; 
		end process clock;
----------------------------------------------------	
	trama_p: process(edo_p,s_reg,x)
		begin
			edo_f<=edo_p;
			s_next<=s_reg;
			
			case edo_p is
				when d0 =>
					s_next<='0';
					if (x=clave(0)) then
						edo_f<=d1;
					end if;
				when d1 =>
					if x=clave(1) then 
						edo_f<=d2;
					else
						edo_f<=d0;
					end if;
				when d2 =>
					if x=clave(2) then
						edo_f<=d3;
					else	
						edo_f<=d0;
					end if;
				when d3 =>
					if x=clave(3) then
						edo_f<=d4;
					else
						edo_f<=d0;
					end if;
				when d4 =>
					if x=clave(4) then
						edo_f<=d0;
						s_next<='1';
					end if;
			end case;		
		end process trama_p;
-----------------------------------------------------	
	led<=s_reg;
end b;