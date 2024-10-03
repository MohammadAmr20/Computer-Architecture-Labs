library ieee;
use ieee.std_logic_1164.all;

package parts_pkg is
    component part_b is
        port(
            S1,S0: in std_logic;
            A,B : in std_logic_vector(7 downto 0);
            FB: out std_logic_vector(7 downto 0);
            CoutB: out std_logic
        );
    end component part_b;

    component part_c is
        port(
            S1, S0, CinC: in std_logic;
            A: in std_logic_vector(7 downto 0);
            FC: out std_logic_vector(7 downto 0);
            CoutC: out std_logic
        );
    end component part_c;

    component part_d is
        port(
            S1, S0, CinD: in std_logic;
            A: in std_logic_vector(7 downto 0);
            FD: out std_logic_vector(7 downto 0);
            CoutD: out std_logic
        );
    end component part_d;

end package parts_pkg;
