library ieee;
use ieee.std_logic_1164.all;

entity part_a_tb is
end entity part_a_tb;

architecture part_a_tb_arch of part_a_tb is
    component part_a
    generic(
        bits: integer  := 8
    );
    port(
        S1,S0,cin: in std_logic;
        A,B : in std_logic_vector(7 downto 0);
        FA: out std_logic_vector(7 downto 0);
        coutA: out std_logic
    );
    end component part_a;

    signal a,b,FA: std_logic_vector(7 downto 0);
    signal S1,S0,cin,cout: std_logic;

    begin
    UUT: part_a generic map(8) port map(S1,S0,cin,a,b,FA,cout);
    process
    begin
        S1 <= '0';
        S0 <= '0';
        cin <= '0';
        a <= x"F0";
        b <= x"B0";
        wait for 10 ns;
        S0 <= '1';
        wait for 10 ns;
        S1 <= '1';
        S0 <= '0';
        wait for 10 ns;
        S0 <= '1';
        wait for 10 ns;
        S1 <= '0';
        S0 <= '0';
        cin <= '1';
        wait for 10 ns;
        S0 <= '1';
        wait for 10 ns;
        S1 <= '1';
        S0 <= '0';
        wait for 10 ns;
        S0 <= '1';
        wait for 10 ns;
        wait;
    end process;
end architecture part_a_tb_arch;