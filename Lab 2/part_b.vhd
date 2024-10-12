library ieee;
use ieee.std_logic_1164.all;

entity part_b is
    generic(
        bits: integer :=8
    );
    port(
        S1,S0: in std_logic;
        A,B : in std_logic_vector(bits-1 downto 0);
        FB: out std_logic_vector(bits-1 downto 0);
        CoutB: out std_logic
    );
end entity part_b;


architecture part_b_arch of part_b is
    signal w0,w1,w2,w3 : std_logic_vector(bits-1 downto 0);
    begin
        w0 <= A xor B;
        w1 <= A nand B;
        w2 <= A or B;
        w3 <= not A;
        FB <= w0 when S1 = '0' and S0 = '0' else
              w1 when S1 = '0' and S0 = '1' else
              w2 when S1 = '1' and S0 = '0' else
              w3;
        CoutB <= '0';
    end architecture part_b_arch;

    -- Note Zero logic is written in '' 
    -- When you declare a signal, define that it follows the std_logic type