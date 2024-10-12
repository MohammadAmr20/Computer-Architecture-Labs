library ieee;
use ieee.std_logic_1164.all;

entity part_b_tb is
end entity part_b_tb;

architecture testbench of part_b_tb is
    component part_b
        generic(
            bits: integer := 8
        );
        port(
            S1,S0: in std_logic;
            A,B : in std_logic_vector(bits-1 downto 0);
            FB: out std_logic_vector(bits-1 downto 0);
            CoutB: out std_logic
        );
    end component part_b;
    signal S1, S0, CoutB: std_logic;
    signal A,B,FB : std_logic_vector(7 downto 0);
    begin
        UUT: part_b generic map(8) port map(S1, S0,A, B,  FB, CoutB);

    process
    begin
        S1 <= '0';
        S0 <= '0';
        A <= "11110000";
        B <= "10110000";
        wait for 10 ns;
        assert(FB = "01000000" and CoutB = '0') report "Test 1 failed" severity error;

        S1 <= '0';
        S0 <= '1';
        A <= "00000000";
        B <= "00001011";
        wait for 10 ns;
        assert(FB = "11111111" and CoutB = '0') report "Test 2 failed" severity error;
        
        
        S1 <= '1';
        S0 <= '0';
        A <= "11110000";
        B <= "10110000";
        wait for 10 ns;
        assert(FB = "11110000" and CoutB = '0') report "Test 3 failed" severity error;
        
        S1 <= '1';
        S0 <= '1';
        A <= "11110000";
        wait for 10 ns;
        assert(FB = "00001111" and CoutB = '0') report "Test 4 failed" severity error;
        wait;
    end process;
end architecture testbench;