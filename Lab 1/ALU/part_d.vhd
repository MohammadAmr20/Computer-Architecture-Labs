library ieee;
use ieee.std_logic_1164.all;

entity part_d is
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
    process(A, CinD)
    begin
        c0 <= A(0);
        c1 <= '0';
        for i in 0 to 7 loop
            if i = 7 then
                w0(7) <= '0';  
                w1(7) <= A(0);
                w2(7) <= CinD;
                w3(7) <= A(7);
            else
                w0(i) <= A(i+1);
                w1(i) <= A(i+1);
                w2(i) <= A(i+1);
                w3(i) <= A(i+1);
            end if ;
        end loop;
    end process;

    CoutD <= c1 when S1 = '1' and S0 = '1' else c0;
    FD <= w0 when S1 = '0' and S0 = '0' else
          w1 when S1 = '0' and S0 = '1' else
          w2 when S1 = '1' and S0 = '0' else
          w3;
end architecture part_d_arch;