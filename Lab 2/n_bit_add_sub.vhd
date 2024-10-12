library ieee;
use ieee.std_logic_1164.all;

entity n_bit_add_sub is
    generic(
        n: integer := 8
    );
    port(
        a, b: in std_logic_vector(n-1 downto 0);
        sel: in std_logic;
        sum: out std_logic_vector(n-1 downto 0);
        cout: out std_logic
    );
end entity n_bit_add_sub;

architecture n_bit_add_sub_arch of n_bit_add_sub is
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
    signal b_converted,sel_bits: std_logic_vector(n-1 downto 0);
begin
    sel_bits <= (others => sel);
    b_converted <= sel_bits xor b; 
    UUT: n_bit_adder generic map(n) port map(a, b_converted, sel, sum, cout);
end architecture n_bit_add_sub_arch;
