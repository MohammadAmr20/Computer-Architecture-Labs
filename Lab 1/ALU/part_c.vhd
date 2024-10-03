library ieee;
use ieee.std_logic_1164.all;

entity part_c is
    port(
        S1, S0, CinC: in std_logic;
        A: in std_logic_vector(7 downto 0);
        FC: out std_logic_vector(7 downto 0);
        CoutC: out std_logic
    );
end entity part_c;

architecture part_c_arch of part_c is
    signal w0, w1, w2, w3: std_logic_vector(7 downto 0);
    signal c0, c1: std_logic;
begin
    process(A, CinC)
    begin
        c0 <= A(7);
        c1 <= '0';
        for i in 7 downto 0 loop
            if i = 0 then
                w0(0) <= '0';  
                w1(0) <= A(7);
                w2(0) <= CinC;
                w3(0) <= '0';
            else
                w0(i) <= A(i-1);
                w1(i) <= A(i-1);
                w2(i) <= A(i-1);
                w3(i) <= '0';
            end if ;
        end loop;
    end process;

    CoutC <= c1 when S1 = '1' and S0 = '1' else c0;
    FC <= w0 when S1 = '0' and S0 = '0' else
          w1 when S1 = '0' and S0 = '1' else
          w2 when S1 = '1' and S0 = '0' else
          w3;
end architecture part_c_arch;