--------------------------------------------------------------------------

-- A.B
library IEEE;
use IEEE.std_logic_1164.all;

entity andgate is
    port (A, B: in std_logic; prod: out std_logic);
end entity andgate;

architecture trivial of andgate is
begin
    prod <= A AND B AFTER 394 ps;
end architecture trivial;

--------------------------------------------------------------------------

-- A'B + B'A
library IEEE;
use IEEE.std_logic_1164.all;

entity xorgate is
    port (A, B: in std_logic; uneq: out std_logic);
end entity xorgate;

architecture trivial of xorgate is
begin
    uneq <= A XOR B AFTER 788 ps;
end architecture trivial;

--------------------------------------------------------------------------

-- A+ B.C
library IEEE;
use IEEE.std_logic_1164.all;

entity abcgate is
    port (A, B, C: in std_logic; abc: out std_logic);
end entity abcgate;

architecture trivial of abcgate is
begin
    abc <= A OR (B AND C) AFTER 494 ps;
end architecture trivial;

--------------------------------------------------------------------------

-- A.B + C.(A+B)
library IEEE;
use IEEE.std_logic_1164.all;

entity Cin_map_G is
    port(A, B, Cin: in std_logic; Bit0_G: out std_logic);
end entity Cin_map_G;

architecture trivial of Cin_map_G is
begin
    Bit0_G <= (A AND B) OR (Cin AND (A OR B)) AFTER 788 ps;
end architecture trivial;

--------------------------------------------------------------------------