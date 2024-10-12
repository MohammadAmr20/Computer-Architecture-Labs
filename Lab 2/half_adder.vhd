library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
    port(
        a, b: in std_logic;
        sum, carry: out std_logic
    );
end entity half_adder;

architecture half_adder_arch of half_adder is
begin
    sum <= a xor b;
    carry <= a and b;
end architecture half_adder_arch;
