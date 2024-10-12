library ieee;
use ieee.std_logic_1164.all;
use work.parts_pkg.all;

entity alu_tb is
end entity alu_tb;

architecture alu_tb_arch of alu_tb is
    component alu is
        generic(
            bits: integer := 8
        );
        port(
            S3,S2,S1, S0, Cin: in std_logic;
            A, B: in std_logic_vector(bits-1 downto 0);
            F: out std_logic_vector(bits-1 downto 0);
            Cout: out std_logic
        );
    end component alu;
    signal S3, S2, S1, S0, Cin: std_logic;
    signal A, B, F: std_logic_vector(7 downto 0);
    signal Cout: std_logic;
begin
    UUT: alu generic map(8) port map(S3, S2, S1, S0, Cin, A, B, F, Cout);
    
    process
    begin
        S3 <= '0';S2 <= '1';S1 <= '0';S0 <= '0';A <= x"F0";B <= x"B0";
        wait for 10 ns;
        assert(F = x"40" and Cout = '0') report "Test 1 failed" severity error;
        
        S3 <= '0';S2 <= '1';S1 <= '0';S0 <= '1';A <= x"F0";B <= x"0B";
        wait for 10 ns;
        assert(F = x"FF" and Cout = '0') report "Test 2 failed" severity error;
        
        S3 <= '0';S2 <= '1';S1 <= '1';S0 <= '0';A <= x"F0";B <= x"B0";
        wait for 10 ns;
        assert(F = x"F0" and Cout = '0') report "Test 3 failed" severity error;

        S3 <= '0';S2 <= '1';S1 <= '1';S0 <= '1';A <= x"F0";
        wait for 10 ns;
        assert(F = x"0F" and Cout = '0') report "Test 4 failed" severity error;

        S3 <= '1';S2 <='0';S1 <= '0';S0 <= '0';A <= x"F0";
        wait for 10 ns;
        assert(F = x"E0" and Cout = '1') report "Test 5 failed" severity error;

        S3 <= '1';S2 <='0';S1 <= '0';S0 <= '1';A <= x"F0";
        wait for 10 ns;
        assert(F = x"E1" and Cout = '1') report "Test 6 failed" severity error;

        S3 <= '1';S2 <='0';S1 <= '1';S0 <= '0';A <= x"F0";Cin <= '0';
        wait for 10 ns;
        assert(F = x"E0" and Cout = '1') report "Test 7 failed" severity error;

        S3 <= '1';S2 <='0';S1 <= '1';S0 <= '1';A <= x"F0";
        wait for 10 ns;
        assert(F = x"00" and Cout = '0') report "Test 8 failed" severity error;

        S3 <= '1';S2 <='1';S1 <= '0';S0 <= '0';A <= x"F0";
        wait for 10 ns;
        assert(F = x"78" and Cout = '0') report "Test 9 failed" severity error;

        S3 <= '1';S2 <='1';S1 <= '0';S0 <= '1';A <= x"F0";
        wait for 10 ns;
        assert(F = x"78" and Cout = '0') report "Test 10 failed" severity error;

        S3 <= '1';S2 <='1';S1 <= '1';S0 <= '0';A <= x"F0";Cin <= '0';
        wait for 10 ns;
        assert(F = x"78" and Cout = '0') report "Test 11 failed" severity error;

        S3 <= '1';S2 <='1';S1 <= '1';S0 <= '1';A <= x"F0";
        wait for 10 ns;
        assert(F = x"F8" and Cout = '0') report "Test 12 failed" severity error;
        
        S3 <= '1';S2 <= '0';S1 <= '0';S0 <= '1';A <= x"F0";Cin <= '1';
        wait for 10 ns;
        assert(F = x"E1" and Cout = '1') report "Test 13 failed" severity error;

        S3 <= '1';S2 <= '1';S1 <= '1';S0 <= '0';A <= x"F0";Cin <= '1';
        wait for 10 ns;
        assert(F = x"F8" and Cout = '0') report "Test 14 failed" severity error;

        S3<='0';S2 <= '0';S1<='0';S0<='0'; cin <= '0';a <= x"F0";b <= x"B0";
        wait for 10 ns;
        S0 <= '1';
        wait for 10 ns;
        S1 <= '1'; S0 <= '0';
        wait for 10 ns;
        S0 <= '1';
        wait for 10 ns;
        S1 <= '0'; S0 <= '0';cin <= '1';
        wait for 10 ns;
        S0 <= '1';
        wait for 10 ns;
        S1 <= '1'; S0 <= '0';
        wait for 10 ns;
        S0 <= '1';
        wait for 10 ns;
        wait;
    end process;
end architecture alu_tb_arch;
