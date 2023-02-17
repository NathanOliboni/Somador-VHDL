library ieee;
use ieee.std_logic_1164.all;
  
        --multiplexador de 2 canais com 6 bits por canal 
entity mux2x12 is
    port (
        c0  : in std_logic_vector(11 downto 0);
        c1  : in std_logic_vector(11 downto 0);
        sel : in std_logic;
        zmux   : out std_logic_vector(11 downto 0)
    );
end mux2x12;

architecture comuta of mux2x12 is
begin
        --atribuição condicional
    zmux <= c0 when sel = '0' else
    c1 when sel = '1' else (others => 'Z') after 12 ns; --Z = Alta impedância onde se assume qualquer valor

end architecture;
