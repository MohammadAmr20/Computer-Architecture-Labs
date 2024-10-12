library ieee;
use ieee.std_logic_1164.all;

entity part_a is
    generic(
        bits: integer := 8
    );
    port(
        S1,S0,cin: in std_logic;
        A,B : in std_logic_vector(bits-1 downto 0);
        FA: out std_logic_vector(bits-1 downto 0);
        CoutA: out std_logic
    );
end entity part_a;


architecture part_a_arch of part_a is
    component n_bit_add_sub
        generic(
            n: integer := 8
        );
        port(
            a, b: in std_logic_vector(n-1 downto 0);
            sel: in std_logic;
            sum: out std_logic_vector(n-1 downto 0);
            cout: out std_logic
        );
    end component n_bit_add_sub;
    signal w_a1 , w_b1,w_sum1,w_b2,zeros : std_logic_vector(bits-1 downto 0);
    signal cout1,w_op1,w_op2,cout2 : std_logic;
    begin
        zeros <= x"00";
        add_sub1: n_bit_add_sub generic map(bits) port map(w_a1,w_b1,w_op1,w_sum1,cout1);
        add_sub2: n_bit_add_sub generic map(bits) port map(w_sum1,w_b2,w_op2,FA,cout2);
        w_a1 <= B when S1 = '1' and S0 = '1' and cin = '1' 
            else A;
        w_b1 <= B when (S1 xor S0) = '1' 
             else (zeros(bits - 1 downto 1) & cin) when S1 = '0' and S0 = '0' 
             else (zeros(bits - 1 downto 1) & not cin);
        w_op1 <= S1 when cin = '0'
              else S1 and not S0;
        w_b2 <= zeros when S1 = S0
             else (zeros(bits - 1 downto 1) & (cin xor S1));
        w_op2 <= '0' when cin = '1'
              else S1 and not S0;
        CoutA <= cout2 or cout1;
        
    end architecture part_a_arch;

    -- Note Zero logic is written in '' 
    -- When you declare a signal, define that it follows the std_logic type
