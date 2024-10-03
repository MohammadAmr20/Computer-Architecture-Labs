library ieee;
use ieee.std_logic_1164.all;

entity part_d_tb is
end entity part_d_tb;

architecture testbench of part_d_tb is
    component part_d
        port(
            S1,S0,CinD: in std_logic;
            A : in std_logic_vector(7 downto 0);
            FD: out std_logic_vector(7 downto 0);
            CoutD: out std_logic
        );
    end component part_d;

    signal S1, S0, CoutD,CinD: std_logic;
    signal A,FD : std_logic_vector(7 downto 0);
begin
    UUT: part_d port map(S1, S0,CinD,A, FD, CoutD);

    process
    begin
        S1 <= '0';
        S0 <= '0';
        A <= "11110000";
        CinD <= '0';
        wait for 10 ns;
        assert(FD = "01111000" and CoutD = '0') report "Test 1 failed" severity error;

        S1 <= '0';
        S0 <= '1';
        wait for 10 ns;
        assert(FD = "01111000" and CoutD = '0') report "Test 2 failed" severity error;
        
        
        S1 <= '1';
        S0 <= '0';
        A <= "11110000";
        wait for 10 ns;
        assert(FD = "01111000" and CoutD = '0') report "Test 3 failed" severity error;
        
        S1 <= '1';
        S0 <= '1';
        A <= "11110000";
        wait for 10 ns;
        assert(FD = "11111000" and CoutD = '0') report "Test 4 failed" severity error;

        S1 <= '1';
        S0 <= '0';
        A <= "11110000";
        CinD <= '1';
        wait for 10 ns;
        assert(FD = "11111000" and CoutD = '0') report "Test 5 failed" severity error;
        wait;
    end process;
end architecture testbench;