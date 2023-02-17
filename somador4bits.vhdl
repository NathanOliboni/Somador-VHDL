library ieee;
use ieee.std_logic_1164.all; 

entity somador4bits is
    port(
        a4,b4: in std_logic_vector(3 downto 0);
        Cin4: in std_logic;
        z4: out std_logic_vector(3 downto 0);
        Cout4: out std_logic
    );
end somador4bits;

architecture soma of somador4Bits is
    component somador1bit
    port (
        a, b: in std_logic;
        Cin: in std_logic;
        z: out std_logic;
        Cout: out std_logic
    );
    end component;

    signal s_Cin4bits: std_logic_vector(2 downto 0);
    signal s_Cout4bits: std_logic_vector(3 downto 0);
begin
    u_soma1: somador1bit port map(a4(0),b4(0),Cin4,z4(0),s_Cout4bits(0));
    s_Cin4bits(0) <= s_Cout4bits(0);
    
    u_soma2: somador1bit port map(a4(1),b4(1),s_Cin4bits(0),z4(1),s_Cout4bits(1));
    s_Cin4bits(1) <= s_Cout4bits(1);
    
    u_soma3: somador1bit port map(a4(2),b4(2),s_Cin4bits(1),z4(2),s_Cout4bits(2));
    s_Cin4bits(2) <= s_Cout4bits(2);
    
    u_soma4: somador1bit port map(a4(3),b4(3),s_Cin4bits(2),z4(3),s_Cout4bits(3));
    Cout4 <= s_Cout4bits(3);
    
end architecture;
