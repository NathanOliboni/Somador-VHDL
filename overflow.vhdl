library ieee;
use ieee.std_logic_1164.all;

entity overflow is
    port (
        a, b, z, op: in std_logic;
        overflw : out std_logic
    );
end entity;

architecture over of overflow is
begin

    overflw <= (a and b and not op) or (z and not op) after 12 ns; 
    
end over;
