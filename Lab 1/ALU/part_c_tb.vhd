library ieee;
use ieee.std_logic_1164.all;

entity part_c_tb is
end entity part_c_tb;

architecture testbench of part_c_tb is
    component part_c
        port(
            S1,S0,CinC: in std_logic;
            A : in std_logic_vector(7 downto 0);
            FC: out std_logic_vector(7 downto 0);
            CoutC: out std_logic
        );
    end component part_c;

    signal S1, S0, CoutC,CinC: std_logic;
    signal A,FC : std_logic_vector(7 downto 0);
begin
    UUT: part_c port map(S1, S0,CinC,A, FC, CoutC);

    process
    begin
        S1 <= '0';
        S0 <= '0';
        A <= "11110000";
        CinC <= '0';
        wait for 10 ns;
        assert(FC = "11100000" and CoutC = '1') report "Test 1 failed" severity error;

        S1 <= '0';
        S0 <= '1';
        wait for 10 ns;
        assert(FC = "11100001" and CoutC = '1') report "Test 2 failed" severity error;
        
        
        S1 <= '1';
        S0 <= '0';
        A <= "11110000";
        wait for 10 ns;
        assert(FC = "11100000" and CoutC = '1') report "Test 3 failed" severity error;
        
        S1 <= '1';
        S0 <= '1';
        A <= "11110000";
        wait for 10 ns;
        assert(FC = "00000000" and CoutC = '0') report "Test 4 failed" severity error;

        S1 <= '1';
        S0 <= '0';
        A <= "11110000";
        CinC <= '1';
        wait for 10 ns;
        assert(FC = "11100001" and CoutC = '1') report "Test 5 failed" severity error;

        wait;
    end process;
end architecture testbench;