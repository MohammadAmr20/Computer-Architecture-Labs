library ieee;
use ieee.std_logic_1164.all;

entity part_c is
    generic(
        bits: integer := 8
    );
    port(
        S1, S0, CinC: in std_logic;
        A: in std_logic_vector(bits-1 downto 0);
        FC: out std_logic_vector(bits-1 downto 0);
        CoutC: out std_logic
    );
end entity part_c;

architecture part_c_arch of part_c is
    signal w0, w1, w2, w3: std_logic_vector(7 downto 0);
    signal c0, c1: std_logic;
begin
    FC <= (A(bits-2 downto 0)&'0') when S1='0' and S0 = '0' else
          (A(bits-2 downto 0)&A(bits-1)) when S1='0' and S0 = '1' else
          (A(bits-2 downto 0)&CinC) when S1='1' and S0 = '0' else
          x"00";
    CoutC <= '0' when S1 = '1' and S0 = '1' else
             A(bits-1);
end architecture part_c_arch;