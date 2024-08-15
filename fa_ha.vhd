library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity fa is
    port(
        A : in std_logic;
        B : in std_logic;
        Cin : in std_logic;
        
        sum : out std_logic;
        cout : out std_logic
    );
end fa;


architecture behavioral of fa is
signal axorb : std_logic; 
begin
    xorgate_01 : entity work.xorgate
    port map (A, B, axorb);

    xorgate_02 : entity work.xorgate
    port map (axorb, Cin, sum);

    Cin_map_G : entity work.Cin_map_G
    port map (A, B, Cin, cout);

end behavioral ; -- behavioral

--------------------------------------------------------------------------


library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ha is
    port(
        A : in std_logic;
        B : in std_logic;
        
        sum : out std_logic;
        cout : out std_logic
    );
end ha;


architecture behavioral of ha is
begin
    xorgate : entity work.xorgate
    port map (A, B, sum);

    andgate : entity work.andgate
    port map (A, B, cout);

end behavioral ; -- behavioral