library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity assignment_04_tb is
end assignment_04_tb;

architecture sim of assignment_04_tb is
    constant CLK_PERIOD : time := 20 ns;
    signal success: boolean := true;

    signal a, b : std_logic_vector(15 downto 0);
    signal c    : std_logic_vector(31 downto 0);
    signal ans  : std_logic_vector(31 downto 0);
    signal cout : std_logic;

begin
    -- Instantiate the UUT
    DUT : entity work.assignment_04
        port map (
            a    => a,
            b    => b,
            c    => c,
            ans    => ans,
            cout => cout
        );

    -- Clock process
    process
    begin
        a <= x"0002";
        b <= x"0002";
        c <= x"00000001";
        wait for CLK_PERIOD;
        if not (ans = x"00000005" and cout = '0') then
            report "Test Case 1 Failed!" severity failure;
            success <= false;
        end if;

        a <= x"0004";
        b <= x"0002";
        c <= x"00000001";
        wait for CLK_PERIOD;
        if not (ans = x"00000009" and cout = '0') then
            report "Test Case 2 Failed!" severity failure;
            success <= false;
        end if;

        a <= x"0004";
        b <= x"0004";
        c <= x"00000002";
        wait for CLK_PERIOD;
        if not (ans = x"00000012" and cout = '0') then
            report "Test Case 3 Failed!" severity failure;
            success <= false;
        end if;

        a <= x"0004";
        b <= x"0040";
        c <= x"00000000";
        wait for CLK_PERIOD;
        if not (ans = x"00000100" and cout = '0') then
            report "Test Case 4 Failed!" severity failure;
            success <= false;
        end if;

        a <= x"0004";
        b <= x"0400";
        c <= x"00000001";
        wait for CLK_PERIOD;
        if not (ans = x"00001001" and cout = '0') then
            report "Test Case 5 Failed!" severity failure;
            success <= false;
        end if;

        a <= x"0501";
        b <= x"0030";
        c <= x"00000001";
        wait for CLK_PERIOD;
        if not (ans = x"0000F031" and cout = '0') then
            report "Test Case 6 Failed!" severity failure;
            success <= false;
        end if;

        a <= x"0F0F";
        b <= x"F0F0";
        c <= x"00000000";
        wait for CLK_PERIOD;
        if not (ans = x"0E2C2E10" and cout = '0') then
            report "Test Case 7 Failed!" severity failure;
            success <= false;
        end if;

        a <= x"1FFF";
        b <= x"0F0F";
        c <= x"00000000";
        wait for CLK_PERIOD;
        if not (ans = x"01E1D0F1" and cout = '0') then
            report "Test Case 8 Failed!" severity failure;
            success <= false;
        end if;

        a <= x"ABCD";
        b <= x"DCBA";
        c <= x"00000007";
        wait for CLK_PERIOD;
        if not (ans = x"9420FEF9" and cout = '0') then
            report "Test Case 9 Failed!" severity failure;
            success <= false;
        end if;

        a <= x"9810";
        b <= x"1346";
        c <= x"00000008";
        wait for CLK_PERIOD;
        if not (ans = x"0B72C468" and cout = '0') then
            report "Test Case 10 Failed!" severity failure;
            success <= false;
        end if;


        if success then
            report "All test cases passed!" severity note;
        end if;
        wait;
    end process;

end sim;
