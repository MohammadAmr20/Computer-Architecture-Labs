library ieee;
use ieee.std_logic_1164.all;

entity n_bit_adder_tb is
end entity n_bit_adder_tb;

architecture n_bit_adder_tb_arch of n_bit_adder_tb is
    component n_bit_adder
        generic(
            n: integer := 8
        );
        port(
            a, b: in std_logic_vector(n-1 downto 0);
            cin: in std_logic;
            sum: out std_logic_vector(n-1 downto 0);
            cout: out std_logic
        );
    end component n_bit_adder;

    signal a, b,sum: std_logic_vector(7 downto 0);
    signal cin: std_logic;
    signal cout: std_logic;
begin
    UUT: n_bit_adder generic map(8) port map(a, b, cin, sum, cout);

    process
    begin
        a <= x"F0";
        b <= x"0F";
        cin <= '0';
        wait for 10 ns;
        a <= x"23";
        b <= x"54";
        cin <= '1';
        wait for 10 ns;
        a <= x"FF";
        b <= x"FF";
        cin <= '1';
        wait for 10 ns;
        a <= x"42";
        b <= x"A5";
        cin <= '0';
        wait for 10 ns;
        wait;
    end process;
end architecture n_bit_adder_tb_arch;
