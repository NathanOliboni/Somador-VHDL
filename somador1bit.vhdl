library ieee;
use ieee.std_logic_1164.all; 

entity somador1bit is
    port(
        a, b: in std_logic;
        Cin: in std_logic;
        z: out std_logic;
        Cout: out std_logic
    );
end somador1bit;

architecture soma of somador1bit is
begin
    z <= ((a xor b) xor Cin);
    Cout <= (a and Cin) or (b and Cin) or (a and b);
end soma;
