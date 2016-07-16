 library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiContador is
	port(
		clk,reset: in std_logic;
		selector: in std_logic_vector(1 downto 0);
		salida: out std_logic_vector(7 downto 0));
end multiContador;

architecture b of multiContador is
	component mux is
		port(
		a,b,c,d: in std_logic_vector(3 downto 0);
		sel: in std_logic_vector(1 downto 0);
		salida: out std_logic_vector(3 downto 0));
	end component;
	
	component Counter1 is --ascendente
		port(
		clk, reset: in std_logic;
		a: out std_logic_vector(3 downto 0));
	end component;
	
	component Counter2 is --descendente
	port(
		clk, reset: in std_logic;
		b: out std_logic_vector(3 downto 0));
	end component;
	
	component Counter3 is --cont par
	port(
		clk, reset: in std_logic;
		c: out std_logic_vector(3 downto 0));
	end component;
	
	component Counter4 is -- cont octava
	port(
		clk, reset: in std_logic;
		d: out std_logic_vector(3 downto 0));
	end component;
	
	component ConversorBCD is
	port(
		entrada_bcd: in std_logic_vector(3 downto 0);
		sal7_seg: out std_logic_vector(7 downto 0));
	end component;
--------------------------------------------------
	signal Counter1_s: std_logic_vector(3 downto 0);
	signal Counter2_s: std_logic_vector(3 downto 0);
	signal Counter3_s: std_logic_vector(3 downto 0);
	signal Counter4_s: std_logic_vector(3 downto 0);
	signal entrada_bcd_S: std_logic_vector(3 downto 0);
begin
	cont1: Counter1 port map(clk=> clk, reset=> reset,
							a=>Counter1_s);
	cont2: Counter2 port map(clk=> clk, reset=> reset,
							b=>Counter2_s);
	cont3: Counter3 port map(clk=> clk, reset=> reset,
							c=>Counter3_s);
	cont4: Counter4 port map(clk=> clk, reset=> reset,
							d=>Counter4_s);							
	mux_p: mux port map(a=>Counter1_s, b=>Counter2_s,
						c=>Counter3_s,d=>Counter4_s,
						sel=>selector, salida=>entrada_bcd_S);
    conv_p: ConversorBCD port map(entrada_bcd=>entrada_bcd_S,
								sal7_seg=>salida);							

end b;