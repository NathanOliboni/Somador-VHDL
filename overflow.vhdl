library ieee;
use ieee.std_logic_1164.all;

entity overflow is
    port (
        a, b, z: in std_logic;
        overflw : out std_logic
    );
end entity;

architecture over of overflow is
begin

    overflw <= ((not a and not b and z) or (a and b and not z));
    
end over;
