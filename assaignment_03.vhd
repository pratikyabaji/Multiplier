library IEEE;
use IEEE.std_logic_1164.all;

entity assaignment_03 is
    port(A, B :in std_logic_vector(31 downto 0);
        Cin: in std_logic;
        SUM : out std_logic_vector(31 downto 0);
        Cout: out std_logic);
end entity assaignment_03;

architecture behavioural of assaignment_03 is

    signal G_level_0, P_level_0: std_logic_vector(31 downto 0);
    signal G_level_1, P_level_1: std_logic_vector(15 downto 0);
    signal G_level_2, P_level_2: std_logic_vector( 7 downto 0);
    signal G_level_3, P_level_3: std_logic_vector( 3 downto 0);
    signal G_level_4, P_level_4: std_logic_vector( 1 downto 0);
    signal G_level_5, P_level_5: std_logic_vector( 0 downto 0);

    signal C: std_logic_vector(32 downto 0); 
begin
    Cin_map_G_gate_inst_0_0: entity work.Cin_map_G
    port map (A(0), B(0),Cin, G_level_0(0));  
        
    xor_gate_inst_0_0: entity work.xorgate
    port map (A(0), B(0), P_level_0(0)); 

    GandP_loop_level_0: for i in 1 to 31 generate
        and_gate_inst_0_i: entity work.andgate
        port map (A(i), B(i), G_level_0(i)); 
        
        xor_gate_inst_0_i: entity work.xorgate
        port map (A(i), B(i), P_level_0(i));
    end generate;

    Cin_map_G_gate_inst_1_1: entity work.Cin_map_G
    port map (A(1), B(1),C(1), G_level_1(0));  
        
    and_gate_inst_1_1: entity work.andgate
    port map (P_level_0(0), P_level_0(1), P_level_1(0)); 

    GandP_loop_level_1: for i in 1 to 15 generate
        abc_gate_inst_1_i: entity work.abcgate
        port map (G_level_0(2*i+1), P_level_0(2*i+1), G_level_0(2*i), G_level_1(i));  
        
        and_gate_inst_1_i: entity work.andgate
        port map ( P_level_0(2*i),  P_level_0(2*i+1), P_level_1(i));
    end generate;


    GandP_loop_level_2: for i in 0 to 7 generate
        abc_gate_inst_2_i: entity work.abcgate
        port map (G_level_1(2*i+1), P_level_1(2*i+1), G_level_1(2*i), G_level_2(i));  
        
        and_gate_inst_2_i: entity work.andgate
        port map ( P_level_1(2*i),  P_level_1(2*i+1), P_level_2(i));
    end generate;


    GandP_loop_level_3: for i in 0 to 3 generate
        abc_gate_inst_3_i: entity work.abcgate
        port map (G_level_2(2*i+1), P_level_2(2*i+1), G_level_2(2*i), G_level_3(i));  
        
        and_gate_inst_3_i: entity work.andgate
        port map ( P_level_2(2*i),  P_level_2(2*i+1), P_level_3(i));
    end generate;

    GandP_loop_level_4: for i in 0 to 1 generate
        abc_gate_inst_4_i: entity work.abcgate
        port map (G_level_3(2*i+1), P_level_3(2*i+1), G_level_3(2*i), G_level_4(i));  
        
        and_gate_inst_4_i: entity work.andgate
        port map ( P_level_3(2*i),  P_level_3(2*i+1), P_level_4(i));
    end generate;

    Cin_map_G_gate_inst_5_1: entity work.Cin_map_G
    port map (G_level_4(0), P_level_4(0),Cin, G_level_5(0));  
        
    xor_gate_inst_5_1: entity work.andgate
    port map (P_level_4(0), P_level_4(0), P_level_5(0));

    -- Carry
    C(0) <= Cin;
    C(1) <= G_level_0(0);
    C(2) <= G_level_1(0);
    C(4) <= G_level_2(0);
    -- C(3)
    abc_gate_inst_00:entity work.abcgate
    port map(G_level_0(2), P_level_0(2), C(2), C(3));
    -- C(5)
    abc_gate_inst_01:entity work.abcgate
    port map(G_level_0(4), P_level_0(4), C(4), C(5));
    -- C(6)
    abc_gate_inst_02:entity work.abcgate
    port map(G_level_1(2), P_level_1(2), C(4), C(6));
    -- C(7)
    abc_gate_inst_03:entity work.abcgate
    port map(G_level_0(6), P_level_0(6), C(6), C(7));
    -- C(8)
    C(8) <= G_level_3(0);
    -- C(9)
    abc_gate_inst_04:entity work.abcgate
    port map(G_level_0(8), P_level_0(8), C(8), C(9));
    -- C(10)
    abc_gate_inst_05:entity work.abcgate
    port map(G_level_1(4), P_level_1(4), C(8), C(10));
    -- C(11)
    abc_gate_inst_06:entity work.abcgate
    port map(G_level_0(10), P_level_0(10), C(10), C(11));
    -- C(12)
    abc_gate_inst_07:entity work.abcgate
    port map(G_level_2(2), P_level_2(2), C(8), C(12));
    -- C(13)
    abc_gate_inst_08:entity work.abcgate
    port map(G_level_0(12), P_level_0(12), C(12), C(13));
    -- C(14)
    abc_gate_inst_09:entity work.abcgate
    port map(G_level_1(6), P_level_1(6), C(12), C(14));
    -- C(15)
    abc_gate_inst_10:entity work.abcgate
    port map(G_level_0(14), P_level_0(14), C(14), C(15));
    C(16) <= G_level_4(0);
    -- C(17)
    abc_gate_inst_11:entity work.abcgate
    port map(G_level_0(16), P_level_0(16), C(16), C(17));
    -- C(18)
    abc_gate_inst_12:entity work.abcgate
    port map(G_level_1(8), P_level_1(8), C(16), C(18));
    -- C(19)
    abc_gate_inst_13:entity work.abcgate
    port map(G_level_0(18), P_level_0(18), C(18), C(19));
    -- C(20)
    abc_gate_inst_14:entity work.abcgate
    port map(G_level_2(4), P_level_2(4), C(16), C(20));
    -- C(21)
    abc_gate_inst_15:entity work.abcgate
    port map(G_level_0(20), P_level_0(20), C(20), C(21));
    -- C(22)
    abc_gate_inst_16:entity work.abcgate
    port map(G_level_1(10), P_level_1(10), C(20), C(22));
    -- C(23)
    abc_gate_inst_17:entity work.abcgate
    port map(G_level_0(22), P_level_0(22), C(22), C(23));
    -- C(24)
    abc_gate_inst_18:entity work.abcgate
    port map(G_level_3(2), P_level_3(2), C(16), C(24));
    -- C(25)
    abc_gate_inst_19:entity work.abcgate
    port map(G_level_0(24), P_level_0(24), C(24), C(25));
    -- C(26)
    abc_gate_inst_20:entity work.abcgate
    port map(G_level_0(12), P_level_0(12), C(24), C(26));
    -- C(27)
    bc_gate_inst_21:entity work.abcgate
    port map(G_level_0(26), P_level_0(26), C(26), C(27));
    -- C(28)
    bc_gate_inst_22:entity work.abcgate
    port map(G_level_0(26), P_level_0(26), C(24), C(28));
    -- C(29)
    bc_gate_inst_23:entity work.abcgate
    port map(G_level_0(28), P_level_0(28), C(28), C(29));
    -- C(30)
    bc_gate_inst_24:entity work.abcgate
    port map(G_level_1(14), P_level_1(14), C(28), C(30));
    -- C(31)
    bc_gate_inst_25:entity work.abcgate
    port map(G_level_0(30), P_level_0(30), C(30), C(31));
    C(32) <= G_level_5(0);

    Cout <= C(32);
    
    -- SUM
    SUM_loop: for i in 0 to 31 generate
        xor_gate_inst_6_i: entity work.xorgate
        port map (P_level_0(i), C(i), SUM(i));  
    end generate;
end architecture behavioural;