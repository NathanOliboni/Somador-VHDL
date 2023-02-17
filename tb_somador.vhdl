library ieee;
use ieee.std_logic_1164.all;

entity tb_somador is
end entity;

architecture soma of tb_somador is
    component mux2x12
        port (
            c0 : in std_logic_vector(11 downto 0);
            c1 : in std_logic_vector(11 downto 0);
            sel : in std_logic;
            zmux : out std_logic_vector(11 downto 0)
        );
    end component;

    component somador12bits
        port (
            a12, b12 : in std_logic_vector(11 downto 0);
            Cin12 : in std_logic;
            z12 : out std_logic_vector(11 downto 0);
            Cout12 : out std_logic
        );
    end component;
    
    component overflow is -- COMO EU INSIRO ISSO AQUI
    port (
        a, b, z: in std_logic;
        overflw : out std_logic
    );
    end component;
    
    
    signal sc1, sc0, szmux: std_logic_vector(11 downto 0);
    signal sa12, sb12, sz12 : std_logic_vector(11 downto 0);
    signal s_OP, s_Cin12, s_Cout12, s_over : std_logic;
    
    
    
begin

    sc1 <= not sb12;
    
    u_mux: mux2x12 port map(sb12(11 downto 0), sc1(11 downto 0), s_OP, szmux(11 downto 0));
    
    u_somador: somador12bits port map(sa12(11 downto 0), szmux(11 downto 0), s_OP, sz12(11 downto 0), s_Cout12);
    
    u_overflow: overflow port map(sa12(11), sb12(11), sz12(11), s_over);
    
    u_teste: process
    	begin
    		sa12<= x"000";
		sc0<=x"FFF";
		s_OP<= '0';
		wait for 4 ns;
				
		sa12<= x"000";
		sc0<=x"FFF";
		s_OP<= '1';
		wait for 4 ns;
				
		wait;
	end process;
end architecture;
     


	
