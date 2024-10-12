library ieee;
use ieee.std_logic_1164.all;

entity half_adder_tb is
end entity half_adder_tb;

architecture half_adder_tb_arch of half_adder_tb is
    component half_adder
        port(
            a, b: in std_logic;
            sum, carry: out std_logic
        );
    end component half_adder;

    signal a, b, sum, carry: std_logic;
begin
    UUT: half_adder port map(a, b, sum, carry);

    process
    begin
        a <= '0';
        b <= '0';
        wait for 10 ns;
        a <= '0';
        b <= '1';
        wait for 10 ns;
        a <= '1';
        b <= '0';
        wait for 10 ns;
        a <= '1';
        b <= '1';
        wait for 10 ns;
        wait;
    end process;
end architecture half_adder_tb_arch;
