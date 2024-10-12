library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port(
        a, b, cin: in std_logic;
        sum, cout: out std_logic
    );
end entity full_adder;

architecture full_adder_arch of full_adder is
    component half_adder
        port(
            a, b: in std_logic;
            sum, carry: out std_logic
        );
    end component half_adder;
    signal sum1,cout1,cout2 : std_logic; 
begin
    first_adder: half_adder port map(a,b,sum1,cout1);
    second_adder: half_adder port map(sum1,cin,sum,cout2);
    cout <= cout1 or cout2;
end architecture full_adder_arch;
