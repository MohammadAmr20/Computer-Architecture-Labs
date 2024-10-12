library ieee;
use ieee.std_logic_1164.all;
use work.parts_pkg.all;

entity alu is
    generic(
        bits: integer := 8
    );
    port(
        S3,S2,S1, S0, Cin: in std_logic;
        A, B: in std_logic_vector(bits-1 downto 0);
        F: out std_logic_vector(bits-1 downto 0);
        Cout: out std_logic
    );
end entity alu;

architecture alu_arch of alu is
    
    signal w0, w1, w2, w3: std_logic_vector(bits-1 downto 0);
    signal c0, c1,c2,c3: std_logic;
begin
    part_a_inst: part_a port map(S1,S0,Cin,A,B,w0,c0);
    part_b_inst: part_b port map(S1, S0, A, B, w1, c1);
    part_c_inst: part_c port map(S1, S0, Cin, A, w2, c2);
    part_d_inst: part_d port map(S1, S0, Cin, A, w3, c3);
    
    F    <= w1 when S3 = '0' and S2 = '1' else
            w2 when S3 = '1' and S2 = '0' else
            w3 when S3 = '1' and S2 = '1' else
            w0;
    Cout <= c1 when S3 = '0' and S2 = '1' else
            c2 when S3 = '1' and S2 = '0' else
            c3 when S3 = '1' and S2 = '1' else
            c0;
end architecture alu_arch;

