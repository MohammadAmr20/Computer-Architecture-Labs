library ieee;
use ieee.std_logic_1164.all;

entity n_bit_adder is
    generic(
        n: integer := 8
    );
    port(
        a, b: in std_logic_vector(n-1 downto 0);
        cin: in std_logic;
        sum: out std_logic_vector(n-1 downto 0);
        cout: out std_logic
    );
end entity n_bit_adder;

architecture n_bit_adder_arch of n_bit_adder is
    component full_adder
        port(
            a, b, cin: in std_logic;
            sum, cout: out std_logic
        );
    end component full_adder;
    signal couts: std_logic_vector(n downto 0);
begin
    couts(0) <= cin;
    full_adders: for i in 0 to n-1 generate
        full_adder_instant: full_adder port map(a(i),b(i),couts(i),sum(i),couts(i+1));
    end generate full_adders;
    cout <= couts(n);
end architecture n_bit_adder_arch;
