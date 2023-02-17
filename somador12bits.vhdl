library ieee;
use ieee.std_logic_1164.all;

entity somador12bits is
    port (
        a12, b12 : in std_logic_vector(11 downto 0);
        Cin12 : in std_logic;
        z12 : out std_logic_vector(11 downto 0);
        Cout12 : out std_logic
    );
end somador12bits;

architecture soma of somador12bits is

component somador4bits is
    port(
        a4,b4: in std_logic_vector(3 downto 0);
        Cin4: in std_logic;
        z4: out std_logic_vector(3 downto 0);
        Cout4: out std_logic
    );
end component;

    signal s_Cout12bits : std_logic_vector(2 downto 0);
    signal s_Cin12bits : std_logic_vector(1 downto 0);
    
begin
    u_soma1 : somador4bits port map(a12(3 downto 0), b12(3 downto 0), Cin12, z12(3 downto 0), s_Cout12bits(0));
    s_Cin12bits(0) <= s_Cout12bits(0);
    
    u_soma2 : somador4bits port map(a12(7 downto 4), b12(7 downto 4), s_Cin12bits(0), z12(7 downto 4), s_Cout12bits(1));
    s_Cin12bits(1) <= s_Cout12bits(1);
    
    u_soma3 : somador4bits port map(a12(11 downto 8), b12(11 downto 8), s_Cin12bits(1), z12(11 downto 8), s_Cout12bits(2));
    Cout12 <= s_Cout12bits(2);
    
end architecture;
