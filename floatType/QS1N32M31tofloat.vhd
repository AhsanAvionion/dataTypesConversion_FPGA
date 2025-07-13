
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity QS1N32M31tofloat is
    Port ( 
           SignedQnmValue   : in  STD_LOGIC_VECTOR (63 downto 0);
           floatValue       : out STD_LOGIC_VECTOR (31 downto 0));
end QS1N32M31tofloat;

architecture Behavioral of QS1N32M31tofloat is    


           signal intValue         : STD_LOGIC_VECTOR (31 downto 0);
           signal fracValue        : STD_LOGIC_VECTOR (31 downto 0);
           
           
begin

    intValue(31 downto 0)  <= SignedQnmValue(62 downto 31);
    fracValue(31 downto 1) <= SignedQnmValue(30 downto 0);
    fracValue(0 downto 0)  <= (others => '0');

    process(SignedQnmValue)
    
        type ieee754StdFloatStruct is record
            signBit         : STD_LOGIC_VECTOR (0 downto 0);
            iee754StdExp    : STD_LOGIC_VECTOR (7 downto 0);
            binMantissa     : STD_LOGIC_VECTOR (22 downto 0);
        end record;
        
        variable ieeeFloat : ieee754StdFloatStruct;
    begin
    
                    if    intValue(31) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(158,8)); ieeeFloat.binMantissa(22 downto 00) := intValue(30 downto 8);
                    elsif intValue(30) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(157,8)); ieeeFloat.binMantissa(22 downto 00) := intValue(29 downto 7);
                    elsif intValue(29) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(156,8)); ieeeFloat.binMantissa(22 downto 00) := intValue(28 downto 6);
                    elsif intValue(28) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(155,8)); ieeeFloat.binMantissa(22 downto 00) := intValue(27 downto 5);
                    elsif intValue(27) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(154,8)); ieeeFloat.binMantissa(22 downto 00) := intValue(26 downto 4);
                    elsif intValue(26) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(153,8)); ieeeFloat.binMantissa(22 downto 00) := intValue(25 downto 3);
                    elsif intValue(25) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(152,8)); ieeeFloat.binMantissa(22 downto 00) := intValue(24 downto 2);
                    elsif intValue(24) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(151,8)); ieeeFloat.binMantissa(22 downto 00) := intValue(23 downto 1);
                    elsif intValue(23) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(150,8)); ieeeFloat.binMantissa(22 downto 00) := intValue(22 downto 0);
                    elsif intValue(22) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(149,8)); ieeeFloat.binMantissa(22 downto 01) := intValue(21 downto 0); ieeeFloat.binMantissa(00 downto 00) := fracValue(31 downto 31);
                    elsif intValue(21) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(148,8)); ieeeFloat.binMantissa(22 downto 02) := intValue(20 downto 0); ieeeFloat.binMantissa(01 downto 00) := fracValue(31 downto 30);
                    elsif intValue(20) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(147,8)); ieeeFloat.binMantissa(22 downto 03) := intValue(19 downto 0); ieeeFloat.binMantissa(02 downto 00) := fracValue(31 downto 29);
                    elsif intValue(19) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(146,8)); ieeeFloat.binMantissa(22 downto 04) := intValue(18 downto 0); ieeeFloat.binMantissa(03 downto 00) := fracValue(31 downto 28);
                    elsif intValue(18) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(145,8)); ieeeFloat.binMantissa(22 downto 05) := intValue(17 downto 0); ieeeFloat.binMantissa(04 downto 00) := fracValue(31 downto 27);
                    elsif intValue(17) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(144,8)); ieeeFloat.binMantissa(22 downto 06) := intValue(16 downto 0); ieeeFloat.binMantissa(05 downto 00) := fracValue(31 downto 26);
                    elsif intValue(16) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(143,8)); ieeeFloat.binMantissa(22 downto 07) := intValue(15 downto 0); ieeeFloat.binMantissa(06 downto 00) := fracValue(31 downto 25);
                    elsif intValue(15) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(142,8)); ieeeFloat.binMantissa(22 downto 08) := intValue(14 downto 0); ieeeFloat.binMantissa(07 downto 00) := fracValue(31 downto 24);
                    elsif intValue(14) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(141,8)); ieeeFloat.binMantissa(22 downto 09) := intValue(13 downto 0); ieeeFloat.binMantissa(08 downto 00) := fracValue(31 downto 23);
                    elsif intValue(13) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(140,8)); ieeeFloat.binMantissa(22 downto 10) := intValue(12 downto 0); ieeeFloat.binMantissa(09 downto 00) := fracValue(31 downto 22);
                    elsif intValue(12) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(139,8)); ieeeFloat.binMantissa(22 downto 11) := intValue(11 downto 0); ieeeFloat.binMantissa(10 downto 00) := fracValue(31 downto 21);
                    elsif intValue(11) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(138,8)); ieeeFloat.binMantissa(22 downto 12) := intValue(10 downto 0); ieeeFloat.binMantissa(11 downto 00) := fracValue(31 downto 20);
                    elsif intValue(10) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(137,8)); ieeeFloat.binMantissa(22 downto 13) := intValue(09 downto 0); ieeeFloat.binMantissa(12 downto 00) := fracValue(31 downto 19);
                    elsif intValue(9)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(136,8)); ieeeFloat.binMantissa(22 downto 14) := intValue(08 downto 0); ieeeFloat.binMantissa(13 downto 00) := fracValue(31 downto 18);
                    elsif intValue(8)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(135,8)); ieeeFloat.binMantissa(22 downto 15) := intValue(07 downto 0); ieeeFloat.binMantissa(14 downto 00) := fracValue(31 downto 17);
                    elsif intValue(7)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(134,8)); ieeeFloat.binMantissa(22 downto 16) := intValue(06 downto 0); ieeeFloat.binMantissa(15 downto 00) := fracValue(31 downto 16);
                    elsif intValue(6)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(133,8)); ieeeFloat.binMantissa(22 downto 17) := intValue(05 downto 0); ieeeFloat.binMantissa(16 downto 00) := fracValue(31 downto 15);
                    elsif intValue(5)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(132,8)); ieeeFloat.binMantissa(22 downto 18) := intValue(04 downto 0); ieeeFloat.binMantissa(17 downto 00) := fracValue(31 downto 14);
                    elsif intValue(4)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(131,8)); ieeeFloat.binMantissa(22 downto 19) := intValue(03 downto 0); ieeeFloat.binMantissa(18 downto 00) := fracValue(31 downto 13);
                    elsif intValue(3)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(130,8)); ieeeFloat.binMantissa(22 downto 20) := intValue(02 downto 0); ieeeFloat.binMantissa(19 downto 00) := fracValue(31 downto 12);
                    elsif intValue(2)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(129,8)); ieeeFloat.binMantissa(22 downto 21) := intValue(01 downto 0); ieeeFloat.binMantissa(20 downto 00) := fracValue(31 downto 11);
                    elsif intValue(1)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(128,8)); ieeeFloat.binMantissa(22 downto 22) := intValue(00 downto 0); ieeeFloat.binMantissa(21 downto 00) := fracValue(31 downto 10);
                    elsif intValue(0)   = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(127,8)); ieeeFloat.binMantissa(22 downto 00) := fracValue(31 downto 9);
                    elsif fracValue(31) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(126,8)); ieeeFloat.binMantissa(22 downto 00) := fracValue(30 downto 8);
                    elsif fracValue(30) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(125,8)); ieeeFloat.binMantissa(22 downto 00) := fracValue(29 downto 7);
                    elsif fracValue(29) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(124,8)); ieeeFloat.binMantissa(22 downto 00) := fracValue(28 downto 6);
                    elsif fracValue(28) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(123,8)); ieeeFloat.binMantissa(22 downto 00) := fracValue(27 downto 5);
                    elsif fracValue(27) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(122,8)); ieeeFloat.binMantissa(22 downto 00) := fracValue(26 downto 4);
                    elsif fracValue(26) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(121,8)); ieeeFloat.binMantissa(22 downto 00) := fracValue(25 downto 3);
                    elsif fracValue(25) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(120,8)); ieeeFloat.binMantissa(22 downto 00) := fracValue(24 downto 2);
                    elsif fracValue(24) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(119,8)); ieeeFloat.binMantissa(22 downto 00) := fracValue(23 downto 1);
                    elsif fracValue(23) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(118,8)); ieeeFloat.binMantissa(22 downto 00) := fracValue(22 downto 0);
                    elsif fracValue(22) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(117,8)); ieeeFloat.binMantissa(22 downto 22) := (others => '0');        ieeeFloat.binMantissa(21 downto 00) := fracValue(21 downto 0); -- loosing accuracy
                    elsif fracValue(21) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(116,8)); ieeeFloat.binMantissa(22 downto 21) := (others => '0');        ieeeFloat.binMantissa(20 downto 00) := fracValue(20 downto 0); -- loosing accuracy
                    elsif fracValue(20) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(115,8)); ieeeFloat.binMantissa(22 downto 20) := (others => '0');        ieeeFloat.binMantissa(19 downto 00) := fracValue(19 downto 0); -- loosing accuracy
                    elsif fracValue(19) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(114,8)); ieeeFloat.binMantissa(22 downto 19) := (others => '0');        ieeeFloat.binMantissa(18 downto 00) := fracValue(18 downto 0); -- loosing accuracy
                    elsif fracValue(18) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(113,8)); ieeeFloat.binMantissa(22 downto 18) := (others => '0');        ieeeFloat.binMantissa(17 downto 00) := fracValue(17 downto 0); -- loosing accuracy
                    elsif fracValue(17) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(112,8)); ieeeFloat.binMantissa(22 downto 17) := (others => '0');        ieeeFloat.binMantissa(16 downto 00) := fracValue(16 downto 0); -- loosing accuracy
                    elsif fracValue(16) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(111,8)); ieeeFloat.binMantissa(22 downto 16) := (others => '0');        ieeeFloat.binMantissa(15 downto 00) := fracValue(15 downto 0); -- loosing accuracy
                    elsif fracValue(15) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(110,8)); ieeeFloat.binMantissa(22 downto 15) := (others => '0');        ieeeFloat.binMantissa(14 downto 00) := fracValue(14 downto 0); -- loosing accuracy
                    elsif fracValue(14) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(109,8)); ieeeFloat.binMantissa(22 downto 14) := (others => '0');        ieeeFloat.binMantissa(13 downto 00) := fracValue(13 downto 0); -- loosing accuracy
                    elsif fracValue(13) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(108,8)); ieeeFloat.binMantissa(22 downto 13) := (others => '0');        ieeeFloat.binMantissa(12 downto 00) := fracValue(12 downto 0); -- loosing accuracy
                    elsif fracValue(12) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(107,8)); ieeeFloat.binMantissa(22 downto 12) := (others => '0');        ieeeFloat.binMantissa(11 downto 00) := fracValue(11 downto 0); -- loosing accuracy
                    elsif fracValue(11) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(106,8)); ieeeFloat.binMantissa(22 downto 11) := (others => '0');        ieeeFloat.binMantissa(10 downto 00) := fracValue(10 downto 0); -- loosing accuracy
                    elsif fracValue(10) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(105,8)); ieeeFloat.binMantissa(22 downto 10) := (others => '0');        ieeeFloat.binMantissa(09 downto 00) := fracValue(09 downto 0); -- loosing accuracy
                    elsif fracValue(9)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(104,8)); ieeeFloat.binMantissa(22 downto 09) := (others => '0');        ieeeFloat.binMantissa(08 downto 00) := fracValue(08 downto 0); -- loosing accuracy
                    elsif fracValue(8)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(103,8)); ieeeFloat.binMantissa(22 downto 08) := (others => '0');        ieeeFloat.binMantissa(07 downto 00) := fracValue(07 downto 0); -- loosing accuracy
                    elsif fracValue(7)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(102,8)); ieeeFloat.binMantissa(22 downto 07) := (others => '0');        ieeeFloat.binMantissa(06 downto 00) := fracValue(06 downto 0); -- loosing accuracy
                    elsif fracValue(6)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(101,8)); ieeeFloat.binMantissa(22 downto 06) := (others => '0');        ieeeFloat.binMantissa(05 downto 00) := fracValue(05 downto 0); -- loosing accuracy
                    elsif fracValue(5)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(100,8)); ieeeFloat.binMantissa(22 downto 05) := (others => '0');        ieeeFloat.binMantissa(04 downto 00) := fracValue(04 downto 0); -- loosing accuracy
                    elsif fracValue(4)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(099,8)); ieeeFloat.binMantissa(22 downto 04) := (others => '0');        ieeeFloat.binMantissa(03 downto 00) := fracValue(03 downto 0); -- loosing accuracy
                    elsif fracValue(3)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(098,8)); ieeeFloat.binMantissa(22 downto 03) := (others => '0');        ieeeFloat.binMantissa(02 downto 00) := fracValue(02 downto 0); -- loosing accuracy
                    elsif fracValue(2)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(097,8)); ieeeFloat.binMantissa(22 downto 02) := (others => '0');        ieeeFloat.binMantissa(01 downto 00) := fracValue(01 downto 0); -- loosing accuracy
                    elsif fracValue(1)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(096,8)); ieeeFloat.binMantissa(22 downto 01) := (others => '0');        ieeeFloat.binMantissa(00 downto 00) := fracValue(00 downto 0); -- loosing accuracy
                    elsif fracValue(0)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(095,8)); ieeeFloat.binMantissa(22 downto 00) := (others => '0');
                    elsif SignedQnmValue = x"0000000000000000" then ieeeFloat.iee754StdExp := (others => '0') ;ieeeFloat.binMantissa := (others => '0');
                    end if;
                    
                    
    ieeeFloat.signBit        := (others => SignedQnmValue(63));
    
    floatValue(31 downto 31)    <= ieeeFloat.signBit;
    floatValue(30 downto 23)    <= ieeeFloat.iee754StdExp;
    floatValue(22 downto 0)     <= ieeeFloat.binMantissa;
                    
        
    end process;
    

end Behavioral;
