library ieee;
use ieee.std_logic_1164.all;

package parts_pkg is

    component part_a is
        generic(
            bits: integer := 8
        );
        port(
            S1,S0,cin: in std_logic;
            A,B : in std_logic_vector(bits-1 downto 0);
            FA: out std_logic_vector(bits-1 downto 0);
            CoutA: out std_logic
        );
    end component part_a;

    component part_b is
        generic(
            bits: integer := 8
        );
        port(
            S1,S0: in std_logic;
            A,B : in std_logic_vector(bits-1 downto 0);
            FB: out std_logic_vector(bits-1 downto 0);
            CoutB: out std_logic
        );
    end component part_b;

    component part_c is
        generic(
            bits: integer := 8
        );
        port(
            S1, S0, CinC: in std_logic;
            A: in std_logic_vector(bits-1 downto 0);
            FC: out std_logic_vector(bits-1 downto 0);
            CoutC: out std_logic
        );
    end component part_c;

    component part_d is
        generic(
            bits: integer := 8
        );
        port(
            S1, S0, CinD: in std_logic;
            A: in std_logic_vector(bits-1 downto 0);
            FD: out std_logic_vector(bits-1 downto 0);
            CoutD: out std_logic
        );
    end component part_d;

end package parts_pkg;
