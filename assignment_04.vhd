library IEEE;
use IEEE.std_logic_1164.all;

entity assignment_04 is 
    port(
        a: in std_logic_vector(15 downto 0);
        b: in std_logic_vector(15 downto 0);
        c: in std_logic_vector(31 downto 0);

        ans: out std_logic_vector(31 downto 0);
        cout: out std_logic
    );
end entity;

architecture behavioural of assignment_04 is

    -- A Accumulate row
    signal row_1: std_logic_vector(31 downto 0);

    -- Product term rows
    signal row_2: std_logic_vector(15 downto 0);
    signal row_3: std_logic_vector(16 downto 1);
    signal row_4: std_logic_vector(17 downto 2);
    signal row_5: std_logic_vector(18 downto 3);
    signal row_6: std_logic_vector(19 downto 4);
    signal row_7: std_logic_vector(20 downto 5);
    signal row_8: std_logic_vector(21 downto 6);
    signal row_9: std_logic_vector(22 downto 7);
    signal row_10: std_logic_vector(23 downto 8);
    signal row_11: std_logic_vector(24 downto 9);
    signal row_12: std_logic_vector(25 downto 10);
    signal row_13: std_logic_vector(26 downto 11);
    signal row_14: std_logic_vector(27 downto 12);
    signal row_15: std_logic_vector(28 downto 13);
    signal row_16: std_logic_vector(29 downto 14);
	signal row_17: std_logic_vector(30 downto 15);

    signal wire: std_logic_vector(419 downto 0);

    -- final 32 bit numbers to add
    signal operand_01: std_logic_vector(31 downto 0);
    signal operand_02: std_logic_vector(31 downto 0);

begin

    row_1 <= c;

    -- loop_generate_00:for i in 0 to 15 generate
    --     loop_generate_01:for j in 0 to 15 generate
    --         and_gate: entity work.andgate port map(a(j), b(i), row_2(i + j));
    --     end generate loop_generate_01;
    -- end generate loop_generate_00;

    row2: for i in 0 to 15 generate
        and_gate: entity work.andgate port map(a(i), b(0), row_2(i + 0)); 
    end generate row2;

    row3: for i in 0 to 15 generate
        and_gate: entity work.andgate port map(a(i), b(1), row_3(i + 1)); 
    end generate row3;

    row4: for i in 0 to 15 generate
        and_gate: entity work.andgate port map(a(i), b(2), row_4(i + 2)); 
    end generate row4;

    row5: for i in 0 to 15 generate
        and_gate: entity work.andgate port map(a(i), b(3), row_5(i + 3)); 
    end generate row5;

    row6: for i in 0 to 15 generate
        and_gate: entity work.andgate port map(a(i), b(4), row_6(i + 4)); 
    end generate row6;

    row7: for i in 0 to 15 generate
        and_gate: entity work.andgate port map(a(i), b(5), row_7(i + 5)); 
    end generate row7;

    row8: for i in 0 to 15 generate
        and_gate: entity work.andgate port map(a(i), b(6), row_8(i + 6)); 
    end generate row8;

    row9: for i in 0 to 15 generate
        and_gate: entity work.andgate port map(a(i), b(7), row_9(i + 7)); 
    end generate row9;

    row10: for i in 0 to 15 generate
        and_gate: entity work.andgate port map(a(i), b(8), row_10(i + 8)); 
    end generate row10;

    row11: for i in 0 to 15 generate
        and_gate: entity work.andgate port map(a(i), b(9), row_11(i + 9)); 
    end generate row11;

    row12: for i in 0 to 15 generate
        and_gate: entity work.andgate port map(a(i), b(10), row_12(i + 10)); 
    end generate row12;

    row13: for i in 0 to 15 generate
        and_gate: entity work.andgate port map(a(i), b(11), row_13(i + 11)); 
    end generate row13;

    row14: for i in 0 to 15 generate
        and_gate: entity work.andgate port map(a(i), b(12), row_14(i + 12)); 
    end generate row14;

    row15: for i in 0 to 15 generate
        and_gate: entity work.andgate port map(a(i), b(13), row_15(i + 13)); 
    end generate row15;

    row16: for i in 0 to 15 generate
        and_gate: entity work.andgate port map(a(i), b(14), row_16(i + 14)); 
    end generate row16;

    row17: for i in 0 to 15 generate
        and_gate: entity work.andgate port map(a(i), b(15), row_17(i + 15)); 
    end generate row17;

    --column no. 1
    operand_01(0) <= row_1(0);
    operand_02(0) <= row_2(0);

    --column no. 2
    operand_02(1) <= row_3(1);
    half_adder1: entity work.ha port map(row_1(1), row_2( 1), operand_01(1), operand_02(2));

    --column no. 3
    half_adder2: entity work.ha port map(row_1(2), row_2(2), wire(0), wire(1));
    full_adder1: entity work.fa port map(wire(0), row_3(2),row_4(2), operand_01(2), operand_02(3));

    --column no. 4
    half_adder3: entity work.ha port map(row_1(3), row_2(3), wire(2), wire(3));
    full_adder2: entity work.fa port map(wire(2), row_3(3),row_4(3), wire(4), wire(5));
    full_adder3: entity work.fa port map(row_5(3), wire(1),wire(4), operand_01(3), operand_02(4));

    --column no. 5
    half_adder4: entity work.ha port map(row_4(4), row_5(4), wire(8), wire(9));
    full_adder4: entity work.fa port map(row_1(4), row_2(4),row_3(4), wire(6), wire(7));
    full_adder5: entity work.fa port map(wire(6), wire(8),wire(3), wire(10), wire(11));
    full_adder6: entity work.fa port map(wire(10), wire(5),row_6(4), operand_01(4), operand_02(5));

    --column no. 6
    half_adder5: entity work.ha port map(row_1(5), row_2(5), wire(12), wire(13));
    full_adder7: entity work.fa port map(wire(12), row_3(5),row_4(5), wire(14), wire(15));
    full_adder8: entity work.fa port map(row_5(5), row_6(5),row_7(5), wire(16), wire(17));
    full_adder9: entity work.fa port map(wire(14), wire(16),wire(7), wire(18), wire(19));
    full_adder10: entity work.fa port map(wire(18), wire(9) ,wire(11), operand_01(5), operand_02(6));

    --column no. 7
    half_adder6: entity work.ha port map(row_4(6), row_5(6), wire(21), wire(22));
    full_adder11: entity work.fa port map(row_1(6), row_2(6),row_3(6), wire(20), wire(419));
    full_adder12: entity work.fa port map(wire(20), wire(21),wire(13), wire(23), wire(24));
    full_adder13: entity work.fa port map(row_6(6), row_7(6),row_8(6), wire(25), wire(26));
    full_adder14: entity work.fa port map(wire(23), wire(25),wire(15), wire(27), wire(28));
    full_adder15: entity work.fa port map(wire(27), wire(17),wire(19), operand_01(6), operand_02(7));

    --column no. 8
    half_adder7: entity work.ha port map(row_7(7), row_8(7), wire(33), wire(34));
    full_adder16: entity work.fa port map(row_1(7), row_2(7),row_3(7), wire(29), wire(30));
    full_adder17: entity work.fa port map(row_4(7), row_5(7),row_6(7), wire(31), wire(32));
    full_adder18: entity work.fa port map(wire(29), wire(31), wire(419), wire(35), wire(36));
    full_adder19: entity work.fa port map(wire(33), row_9(7), wire(22), wire(37), wire(38));
    full_adder20: entity work.fa port map(wire(35), wire(37), wire(24), wire(39), wire(40));
    full_adder21: entity work.fa port map(wire(39), wire(26), wire(28), operand_01(7), operand_02(8));

    --column no. 9
    half_adder8: entity work.ha port map(row_1(8), row_2(8), wire(41), wire(42));
    full_adder22: entity work.fa port map(wire(41), row_3(8), row_4(8), wire(43), wire(44));
    full_adder23: entity work.fa port map(row_5(8), row_6(8), row_7(8), wire(45), wire(46));
    full_adder24: entity work.fa port map(row_8(8), row_9(8), row_10(8), wire(47), wire(48));
    full_adder25: entity work.fa port map(wire(43), wire(30), wire(45), wire(49), wire(50));
    full_adder26: entity work.fa port map(wire(32), wire(47), wire(34), wire(51), wire(52));
    full_adder27: entity work.fa port map(wire(49), wire(51), wire(36), wire(53), wire(54));
    full_adder28: entity work.fa port map(wire(53), wire(40), wire(38), operand_01(8), operand_02(9));

    --column no. 10
    half_adder9: entity work.ha port map(row_4(9), row_5(9), wire(57), wire(58));
    full_adder29: entity work.fa port map(row_1(9), row_2(9), row_3(9), wire(55), wire(56));
    full_adder30: entity work.fa port map(wire(55), wire(42), wire(57), wire(59), wire(60));
    full_adder31: entity work.fa port map(row_6(9), row_7(9), row_8(9), wire(61), wire(62));
    full_adder32: entity work.fa port map(row_9(9), row_10(9), row_11(9), wire(63), wire(64));
    full_adder33: entity work.fa port map(wire(59), wire(44), wire(61), wire(65), wire(66));
    full_adder34: entity work.fa port map(wire(46), wire(63), wire(48), wire(67), wire(68));
    full_adder35: entity work.fa port map(wire(65), wire(67), wire(50), wire(69), wire(70));
    full_adder36: entity work.fa port map(wire(69), wire(54), wire(52), operand_01(9), operand_02(10));

    --column no. 11
    half_adder10: entity work.ha port map(row_7(10), row_8(10), wire(75), wire(76));
    full_adder37: entity work.fa port map(row_1(10), row_2(10), row_3(10), wire(71), wire(72));
    full_adder38: entity work.fa port map(row_4(10), row_5(10), row_6(10), wire(73), wire(74));
    full_adder39: entity work.fa port map(wire(71), wire(56), wire(73), wire(77), wire(78));
    full_adder40: entity work.fa port map(wire(58), wire(75), row_9(10), wire(79), wire(80));
    full_adder41: entity work.fa port map(row_10(10), row_11(10), row_12(10), wire(81), wire(82));
    full_adder42: entity work.fa port map(wire(77), wire(60), wire(79), wire(83), wire(84));
    full_adder43: entity work.fa port map(wire(62), wire(81), wire(64), wire(85), wire(86));
    full_adder44: entity work.fa port map(wire(83), wire(66), wire(85), wire(87), wire(88));
    full_adder45: entity work.fa port map(wire(87), wire(70), wire(68), operand_01(10), operand_02(11));

    --column no. 12
    half_adder11: entity work.ha port map(row_10(11), row_11(11), wire(95), wire(96));
    full_adder46: entity work.fa port map(row_1(11), row_2(11), row_3(11), wire(89), wire(90));
    full_adder47: entity work.fa port map(row_4(11), row_5(11), row_6(11), wire(91), wire(92));
    full_adder48: entity work.fa port map(row_7(11), row_8(11), row_9(11), wire(93), wire(94));
    full_adder49: entity work.fa port map(wire(89), wire(72), wire(91), wire(97), wire(98));
    full_adder50: entity work.fa port map(wire(74), wire(93), wire(76), wire(99), wire(100));
    full_adder51: entity work.fa port map(wire(95), row_12(11), row_13(11), wire(101), wire(102));
    full_adder52: entity work.fa port map(wire(97), wire(78), wire(99), wire(103), wire(104));
    full_adder53: entity work.fa port map(wire(80), wire(101), wire(82), wire(105), wire(106));
    full_adder54: entity work.fa port map(wire(103), wire(84), wire(105), wire(107), wire(108));
    full_adder55: entity work.fa port map(wire(107), wire(86), wire(88), operand_01(11), operand_02(12));

    --column no. 13
    half_adder12: entity work.ha port map(row_1(12), row_2(12), wire(109), wire(110));
    full_adder56: entity work.fa port map(wire(109), row_3(12), row_4(12), wire(111), wire(112));
    full_adder57: entity work.fa port map(row_5(12), row_6(12), row_7(12), wire(113), wire(114));
    full_adder58: entity work.fa port map(row_8(12), row_9(12), row_10(12), wire(115), wire(116));
    full_adder59: entity work.fa port map(row_11(12), row_12(12), row_13(12), wire(117), wire(118));
    full_adder60: entity work.fa port map(wire(111), wire(90), wire(113), wire(119), wire(120));
    full_adder61: entity work.fa port map(wire(92), wire(115), wire(94), wire(121), wire(122));
    full_adder62: entity work.fa port map(wire(117), wire(96), row_14(12), wire(123), wire(124));
    full_adder63: entity work.fa port map(wire(119), wire(98), wire(121), wire(125), wire(126));
    full_adder64: entity work.fa port map(wire(100), wire(123), wire(102), wire(127), wire(128));
    full_adder65: entity work.fa port map(wire(125), wire(104), wire(127), wire(129), wire(130));
    full_adder66: entity work.fa port map(wire(129), wire(106), wire(108), operand_01(12), operand_02(13));

    --column no. 14
    full_adder67: entity work.fa port map(row_1(13), row_2(13), row_3(13), wire(131), wire(132));
    half_adder13: entity work.ha port map(row_4(13), row_5(13), wire(133), wire(134));
    full_adder68: entity work.fa port map(wire(131), wire(110), wire(133), wire(135), wire(136));
    full_adder69: entity work.fa port map(row_6(13), row_7(13), row_8(13), wire(137), wire(138));
    full_adder70: entity work.fa port map(row_9(13), row_10(13), row_11(13), wire(139), wire(140));
    full_adder71: entity work.fa port map(row_12(13), row_13(13), row_14(13), wire(141), wire(142));
    full_adder681: entity work.fa port map(wire(135), wire(112), wire(137), wire(143), wire(144));
    full_adder691: entity work.fa port map(wire(114), wire(139), wire(116), wire(145), wire(146));
    full_adder701: entity work.fa port map(wire(141), wire(118), row_15(13), wire(147), wire(148));
    full_adder711: entity work.fa port map(wire(143), wire(120), wire(145), wire(149), wire(150));
    full_adder721: entity work.fa port map(wire(122), wire(147), wire(124), wire(151), wire(152));
    full_adder731: entity work.fa port map(wire(149), wire(126), wire(151), wire(153), wire(154));
    full_adder741: entity work.fa port map(wire(153), wire(128), wire(130), operand_01(13), operand_02(14));

    --column no. 15
    full_adder75: entity work.fa port map(row_1(14), row_2(14), row_3(14), wire(155), wire(156));
    full_adder76: entity work.fa port map(row_4(14), row_5(14), row_6(14), wire(157), wire(158));
    half_adder14: entity work.ha port map(row_7(14), row_8(14), wire(159), wire(160));
    full_adder77: entity work.fa port map(wire(155), wire(132), wire(157), wire(161), wire(162));
    full_adder78: entity work.fa port map(wire(134), wire(159), row_9(14), wire(163), wire(164));
    full_adder79: entity work.fa port map(row_10(14), row_11(14), row_12(14), wire(165), wire(166));
    full_adder80: entity work.fa port map(row_13(14), row_14(14), row_15(14), wire(167), wire(168));
    full_adder81: entity work.fa port map(wire(161), wire(136), wire(163), wire(169), wire(170));
    full_adder82: entity work.fa port map(wire(138), wire(165), wire(140), wire(171), wire(172));
    full_adder83: entity work.fa port map(wire(167), wire(142), row_16(14), wire(173), wire(174));
    full_adder84: entity work.fa port map(wire(169), wire(144), wire(171), wire(175), wire(176));
    full_adder85: entity work.fa port map(wire(146), wire(173), wire(148), wire(177), wire(178));
    full_adder86: entity work.fa port map(wire(175), wire(150), wire(177), wire(179), wire(180));
    full_adder87: entity work.fa port map(wire(179), wire(152), wire(154), operand_01(14), operand_02(15));

    --column no. 16
    half_adder15: entity work.ha port map(row_10(15), row_11(15), wire(187), wire(188));
    full_adder88: entity work.fa port map(row_1(15), row_2(15), row_3(15), wire(181), wire(182));
    full_adder89: entity work.fa port map(row_4(15), row_5(15), row_6(15), wire(183), wire(184));
    full_adder90: entity work.fa port map(row_7(15), row_8(15), row_9(15), wire(185), wire(186));
    full_adder91: entity work.fa port map(wire(181), wire(156), wire(183), wire(189), wire(190));
    full_adder92: entity work.fa port map(wire(158), wire(185), wire(160), wire(191), wire(192));
    full_adder93: entity work.fa port map(wire(187), row_12(15), row_13(15), wire(193), wire(194));
    full_adder94: entity work.fa port map(row_14(15), row_15(15), row_16(15), wire(195), wire(196));
    full_adder95: entity work.fa port map(wire(189), wire(162), wire(191), wire(197), wire(198));
    full_adder96: entity work.fa port map(wire(164), wire(193), wire(166), wire(199), wire(200));
    full_adder97: entity work.fa port map(wire(195), wire(168), row_17(15), wire(201), wire(202));
    full_adder98: entity work.fa port map(wire(197), wire(170), wire(199), wire(203), wire(204));
    full_adder99: entity work.fa port map(wire(172), wire(201), wire(174), wire(205), wire(206));
    full_adder100: entity work.fa port map(wire(203), wire(176), wire(205), wire(207), wire(208));
    full_adder101: entity work.fa port map(wire(207), wire(178), wire(180), operand_01(15), operand_02(16));

    --column no. 17
    half_adder16: entity work.ha port map(row_11(16), row_12(16), wire(215), wire(216));
    full_adder102: entity work.fa port map(row_1(16), row_3(16), row_4(16), wire(209), wire(210));
    full_adder103: entity work.fa port map(row_5(16), row_6(16), row_7(16), wire(211), wire(212));
    full_adder104: entity work.fa port map(row_8(16), row_9(16), row_10(16), wire(213), wire(214));
    full_adder105: entity work.fa port map(wire(209), wire(182), wire(211), wire(217), wire(218));
    full_adder106: entity work.fa port map(wire(184), wire(213), wire(186), wire(219), wire(220));
    full_adder107: entity work.fa port map(wire(215), wire(188), row_13(16), wire(221), wire(222));
    full_adder108: entity work.fa port map(row_14(16), row_15(16), row_16(16), wire(223), wire(224));
    full_adder109: entity work.fa port map(wire(217), wire(190), wire(219), wire(225), wire(226));
    full_adder110: entity work.fa port map(wire(192), wire(221), wire(194), wire(227), wire(228));
    full_adder111: entity work.fa port map(wire(223), wire(196), row_17(16), wire(229), wire(230));
    full_adder112: entity work.fa port map(wire(225), wire(198), wire(227), wire(231), wire(232));
    full_adder114: entity work.fa port map(wire(200), wire(229), wire(202), wire(233), wire(234));
    full_adder115: entity work.fa port map(wire(231), wire(204), wire(233), wire(235), wire(236));
    full_adder116: entity work.fa port map(wire(235), wire(206), wire(208), operand_01(16), operand_02(17));

    --column no. 18
    full_adder117: entity work.fa port map(row_1(17), row_4(17), row_5(17), wire(237), wire(238));
    full_adder118: entity work.fa port map(row_6(17), row_7(17), row_8(17), wire(239), wire(240));
    full_adder119: entity work.fa port map(row_9(17), row_10(17), row_11(17), wire(241), wire(242));
    full_adder120: entity work.fa port map(wire(237), wire(210), wire(239), wire(243), wire(244));
    full_adder121: entity work.fa port map(wire(212), wire(241), wire(214), wire(245), wire(246));
    full_adder122: entity work.fa port map(row_12(17), wire(216), row_13(17), wire(247), wire(248));
    full_adder123: entity work.fa port map(row_14(17), row_15(17), row_16(17), wire(249), wire(250));
    full_adder124: entity work.fa port map(wire(243), wire(218), wire(245), wire(251), wire(252));
    full_adder125: entity work.fa port map(wire(220), wire(247), wire(222), wire(253), wire(254));
    full_adder126: entity work.fa port map(wire(249), wire(224), row_17(17), wire(255), wire(256));
    full_adder127: entity work.fa port map(wire(251), wire(226), wire(253), wire(257), wire(258));
    full_adder128: entity work.fa port map(wire(228), wire(255), wire(230), wire(259), wire(260));
    full_adder129: entity work.fa port map(wire(257), wire(232), wire(259), wire(261), wire(262));
    full_adder130: entity work.fa port map(wire(261), wire(234), wire(236), operand_01(17), operand_02(18));

    --column no. 19
    full_adder131: entity work.fa port map(row_1(18), row_5(18), row_6(18), wire(263), wire(264));
    full_adder132: entity work.fa port map(row_7(18), row_8(18), row_9(18), wire(265), wire(266));
    full_adder133: entity work.fa port map(wire(263), wire(238), wire(265), wire(267), wire(268));
    full_adder134: entity work.fa port map(wire(240), row_10(18), wire(242), wire(269), wire(270));
    full_adder135: entity work.fa port map(row_11(18), row_12(18), row_13(18), wire(271), wire(272));
    full_adder136: entity work.fa port map(row_14(18), row_15(18), row_16(18), wire(273), wire(274));
    full_adder137: entity work.fa port map(wire(267), wire(244), wire(269), wire(275), wire(276));
    full_adder138: entity work.fa port map(wire(246), wire(271), wire(248), wire(277), wire(278));
    full_adder139: entity work.fa port map(wire(273), wire(250), row_17(18), wire(279), wire(280));
    full_adder140: entity work.fa port map(wire(275), wire(252), wire(277), wire(281), wire(282));
    full_adder141: entity work.fa port map(wire(254), wire(279), wire(256), wire(283), wire(284));
    full_adder142: entity work.fa port map(wire(281), wire(258), wire(283), wire(285), wire(286));
    full_adder143: entity work.fa port map(wire(285), wire(260), wire(262), operand_01(18), operand_02(19));

    --column no. 20
    full_adder144: entity work.fa port map(row_1(19), row_6(19), row_7(19), wire(287), wire(288));
    full_adder145: entity work.fa port map(wire(287), wire(264), row_8(19), wire(289), wire(290));
    full_adder146: entity work.fa port map(wire(266), row_9(19), row_10(19), wire(291), wire(292));
    full_adder147: entity work.fa port map(row_11(19), row_12(19), row_13(19), wire(293), wire(294));
    full_adder148: entity work.fa port map(row_14(19), row_15(19), row_16(19), wire(295), wire(296));
    full_adder149: entity work.fa port map(wire(289), wire(268), wire(291), wire(297), wire(298));
    full_adder150: entity work.fa port map(wire(270), wire(293), wire(272), wire(299), wire(300));
    full_adder151: entity work.fa port map(wire(295), wire(274), row_17(19), wire(301), wire(302));
    full_adder152: entity work.fa port map(wire(297), wire(276), wire(299), wire(303), wire(304));
    full_adder153: entity work.fa port map(wire(278), wire(301), wire(280), wire(305), wire(306));
    full_adder154: entity work.fa port map(wire(303), wire(282), wire(305), wire(307), wire(308));
    full_adder155: entity work.fa port map(wire(307), wire(284), wire(286), operand_01(19), operand_02(20));

    --column no. 21
    full_adder156: entity work.fa port map(row_1(20), wire(288), row_7(20), wire(309), wire(310));
    full_adder157: entity work.fa port map(row_8(20), row_9(20), row_10(20), wire(311), wire(312));
    full_adder158: entity work.fa port map(row_11(20), row_12(20), row_13(20), wire(313), wire(314));
    full_adder159: entity work.fa port map(row_14(20), row_15(20), row_16(20), wire(315), wire(316));
    full_adder160: entity work.fa port map(wire(309), wire(290), wire(311), wire(317), wire(318));
    full_adder161: entity work.fa port map(wire(292), wire(313), wire(294), wire(319), wire(320));
    full_adder162: entity work.fa port map(wire(315), wire(296), row_17(20), wire(321), wire(322));
    full_adder163: entity work.fa port map(wire(317), wire(298), wire(319), wire(323), wire(324));
    full_adder164: entity work.fa port map(wire(300), wire(321), wire(302), wire(325), wire(326));
    full_adder165: entity work.fa port map(wire(323), wire(304), wire(325), wire(327), wire(328));
    full_adder166: entity work.fa port map(wire(327), wire(306), wire(308), operand_01(20), operand_02(21));

    --column no. 22
    full_adder167: entity work.fa port map(row_1(21), row_8(21), row_9(21), wire(329), wire(330));
    full_adder168: entity work.fa port map(row_10(21), row_11(21), row_12(21), wire(331), wire(332));
    full_adder169: entity work.fa port map(row_13(21), row_14(21), row_15(21), wire(333), wire(334));
    full_adder170: entity work.fa port map(wire(329), wire(310), wire(331), wire(335), wire(336));
    full_adder171: entity work.fa port map(wire(312), wire(333), wire(314), wire(337), wire(338));
    full_adder172: entity work.fa port map(row_16(21), wire(316), row_17(21), wire(339), wire(340));
    full_adder173: entity work.fa port map(wire(335), wire(318), wire(337), wire(341), wire(342));
    full_adder174: entity work.fa port map(wire(320), wire(339), wire(322), wire(343), wire(344));
    full_adder175: entity work.fa port map(wire(341), wire(324), wire(343), wire(345), wire(346));
    full_adder176: entity work.fa port map(wire(345), wire(326), wire(328), operand_01(21), operand_02(22));

    --column no. 23
    full_adder177: entity work.fa port map(row_1(22), row_9(22), row_10(22), wire(347), wire(348));
    full_adder178: entity work.fa port map(row_11(22), row_12(22), row_13(22), wire(349), wire(350));
    full_adder179: entity work.fa port map(wire(347), wire(330), wire(349), wire(351), wire(352));
    full_adder180: entity work.fa port map(wire(332), row_14(22), wire(334), wire(353), wire(354));
    full_adder181: entity work.fa port map(row_15(22), row_16(22), row_17(22), wire(355), wire(356));
    full_adder182: entity work.fa port map(wire(351), wire(336), wire(353), wire(357), wire(358));
    full_adder183: entity work.fa port map(wire(338), wire(355), wire(340), wire(359), wire(360));
    full_adder184: entity work.fa port map(wire(357), wire(342), wire(359), wire(361), wire(362));
    full_adder185: entity work.fa port map(wire(361), wire(344), wire(346), operand_01(22), operand_02(23));

    --column no. 24
    full_adder186: entity work.fa port map(row_1(23), row_10(23), row_11(23), wire(363), wire(364));
    full_adder187: entity work.fa port map(wire(363), wire(348), row_12(23), wire(365), wire(366));
    full_adder188: entity work.fa port map(wire(350), row_13(23), row_14(23), wire(367), wire(368));
    full_adder189: entity work.fa port map(row_15(23), row_16(23), row_17(23), wire(369), wire(370));
    full_adder190: entity work.fa port map(wire(365), wire(352), wire(367), wire(371), wire(372));
    full_adder191: entity work.fa port map(wire(354), wire(369), wire(356), wire(373), wire(374));
    full_adder192: entity work.fa port map(wire(371), wire(358), wire(373), wire(375), wire(376));
    full_adder193: entity work.fa port map(wire(375), wire(360), wire(362), operand_01(23), operand_02(24));

    --column no. 25
    full_adder194: entity work.fa port map(row_1(24), wire(364), row_11(24), wire(377), wire(378));
    full_adder195: entity work.fa port map(row_12(24), row_13(24), row_14(24), wire(379), wire(380));
    full_adder196: entity work.fa port map(row_15(24), row_16(24), row_17(24), wire(381), wire(382));
    full_adder197: entity work.fa port map(wire(377), wire(366), wire(379), wire(383), wire(384));
    full_adder198: entity work.fa port map(wire(368), wire(381), wire(370), wire(385), wire(386));
    full_adder199: entity work.fa port map(wire(383), wire(372), wire(385), wire(387), wire(388));
    full_adder200: entity work.fa port map(wire(387), wire(374), wire(376), operand_01(24), operand_02(25));

    --column no. 26
    full_adder201: entity work.fa port map(row_1(25), row_12(25), row_13(25), wire(389), wire(390));
    full_adder202: entity work.fa port map(row_14(25), row_15(25), row_16(25), wire(391), wire(392));
    full_adder203: entity work.fa port map(wire(389), wire(378), wire(391), wire(393), wire(394));
    full_adder204: entity work.fa port map(wire(380), row_17(25), wire(382), wire(395), wire(396));
    full_adder205: entity work.fa port map(wire(393), wire(384), wire(395), wire(397), wire(398));
    full_adder206: entity work.fa port map(wire(397), wire(386), wire(388), operand_01(25), operand_02(26));

    --column no. 27
    full_adder207: entity work.fa port map(row_1(26), row_13(26), row_14(26), wire(399), wire(400));
    full_adder208: entity work.fa port map(wire(399), wire(390), row_15(26), wire(401), wire(402));
    full_adder209: entity work.fa port map(wire(392), row_16(26), row_17(26), wire(403), wire(404));
    full_adder210: entity work.fa port map(wire(401), wire(394), wire(403), wire(405), wire(406));
    full_adder211: entity work.fa port map(wire(405), wire(396), wire(398), operand_01(26), operand_02(27));

    --column no. 28
    full_adder212: entity work.fa port map(row_1(27), wire(400), row_14(27), wire(407), wire(408));
    full_adder213: entity work.fa port map(row_15(27), row_16(27), row_17(27), wire(409), wire(410));
    full_adder214: entity work.fa port map(wire(407), wire(402), wire(409), wire(411), wire(412));
    full_adder215: entity work.fa port map(wire(411), wire(404), wire(406), operand_01(27), operand_02(28));

    --column no. 29
    full_adder216: entity work.fa port map(row_1(28), row_15(28), row_16(28), wire(413), wire(414));
    full_adder217: entity work.fa port map(wire(413), wire(408), row_17(28), wire(415), wire(416));
    full_adder218: entity work.fa port map(wire(415), wire(410), wire(412), operand_01(28), operand_02(29));

    --column no. 30
    full_adder219: entity work.fa port map(row_1(29), wire(414), row_16(29), wire(417), wire(418));
    full_adder220: entity work.fa port map(wire(417), wire(416), row_17(29), operand_01(29), operand_02(30));

    --column no. 31
    full_adder221: entity work.fa port map(row_1(30), wire(418), row_17(30), operand_01(30), operand_02(31));

    --column no. 32
    operand_01(31) <= row_1(31);

    -- using lograthmic adder
    bkadder: entity work.assaignment_03 port map(operand_01, operand_02, '0', ans, cout);

end behavioural;