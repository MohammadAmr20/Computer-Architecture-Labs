library ieee;
use ieee.std_logic_1164.all;

entity part_d is
    generic(
        bits: integer := 8
    );
    port(
        S1, S0, CinD: in std_logic;
        A: in std_logic_vector(7 downto 0);
        FD: out std_logic_vector(7 downto 0);
        CoutD: out std_logic
    );
end entity part_d;

architecture part_d_arch of part_d is
    signal w0, w1, w2, w3: std_logic_vector(7 downto 0);
    signal c0, c1: std_logic;
begin
    FD <= ('0' & A(bits-1 downto 1)) when S1 = '0' and S0 = '0' else
          (A(0)&A(bits-1 downto 1))  when S1 = '0' and S0 = '1' else
          (CinD&A(bits-1 downto 1))  when S1 = '1' and S0 = '0' else
          (A(bits-1)&A(bits-1 downto 1));
    CoutD <='0'  when S1 = '1' and S0 = '1' else
            A(0);

end architecture part_d_arch;