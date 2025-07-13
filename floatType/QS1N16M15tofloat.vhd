
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity QS1N16M15tofloat is
    Port (
           SignedQnmValue   : in  STD_LOGIC_VECTOR (31 downto 0);
           floatValue       : out STD_LOGIC_VECTOR (31 downto 0));
end QS1N16M15tofloat;

architecture Behavioral of QS1N16M15tofloat is    


           signal intValue         : STD_LOGIC_VECTOR (15 downto 0);
           signal fracValue        : STD_LOGIC_VECTOR (15 downto 0);
           
           
begin

    intValue(15 downto 0)  <= SignedQnmValue(30 downto 15);
    fracValue(15 downto 1) <= SignedQnmValue(14 downto 0);
    fracValue(0 downto 0)  <= (others => '0');
    
    
    process(SignedQnmValue)
    
        type ieee754StdFloatStruct is record
            signBit         : STD_LOGIC_VECTOR (0 downto 0);
            iee754StdExp    : STD_LOGIC_VECTOR (7 downto 0);
            binMantissa     : STD_LOGIC_VECTOR (22 downto 0);
        end record;
        
        variable ieeeFloat : ieee754StdFloatStruct;
    begin
    
                    if    intValue(15) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(142,8)); ieeeFloat.binMantissa(22 downto 08) := intValue(14 downto 0); ieeeFloat.binMantissa(07 downto 00) := fracValue(15 downto 8);
                    elsif intValue(14) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(141,8)); ieeeFloat.binMantissa(22 downto 09) := intValue(13 downto 0); ieeeFloat.binMantissa(08 downto 00) := fracValue(15 downto 7);
                    elsif intValue(13) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(140,8)); ieeeFloat.binMantissa(22 downto 10) := intValue(12 downto 0); ieeeFloat.binMantissa(09 downto 00) := fracValue(15 downto 6);
                    elsif intValue(12) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(139,8)); ieeeFloat.binMantissa(22 downto 11) := intValue(11 downto 0); ieeeFloat.binMantissa(10 downto 00) := fracValue(15 downto 5);
                    elsif intValue(11) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(138,8)); ieeeFloat.binMantissa(22 downto 12) := intValue(10 downto 0); ieeeFloat.binMantissa(11 downto 00) := fracValue(15 downto 4);
                    elsif intValue(10) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(137,8)); ieeeFloat.binMantissa(22 downto 13) := intValue(09 downto 0); ieeeFloat.binMantissa(12 downto 00) := fracValue(15 downto 3);
                    elsif intValue(9)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(136,8)); ieeeFloat.binMantissa(22 downto 14) := intValue(08 downto 0); ieeeFloat.binMantissa(13 downto 00) := fracValue(15 downto 2);
                    elsif intValue(8)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(135,8)); ieeeFloat.binMantissa(22 downto 15) := intValue(07 downto 0); ieeeFloat.binMantissa(14 downto 00) := fracValue(15 downto 1);
                    elsif intValue(7)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(134,8)); ieeeFloat.binMantissa(22 downto 16) := intValue(06 downto 0); ieeeFloat.binMantissa(15 downto 00) := fracValue(15 downto 0);
                    elsif intValue(6)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(133,8)); ieeeFloat.binMantissa(22 downto 17) := intValue(05 downto 0); ieeeFloat.binMantissa(16 downto 01) := fracValue(15 downto 0); ieeeFloat.binMantissa(00 downto 00) := (others => '0');
                    elsif intValue(5)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(132,8)); ieeeFloat.binMantissa(22 downto 18) := intValue(04 downto 0); ieeeFloat.binMantissa(17 downto 02) := fracValue(15 downto 0); ieeeFloat.binMantissa(01 downto 00) := (others => '0');
                    elsif intValue(4)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(131,8)); ieeeFloat.binMantissa(22 downto 19) := intValue(03 downto 0); ieeeFloat.binMantissa(18 downto 03) := fracValue(15 downto 0); ieeeFloat.binMantissa(02 downto 00) := (others => '0');
                    elsif intValue(3)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(130,8)); ieeeFloat.binMantissa(22 downto 20) := intValue(02 downto 0); ieeeFloat.binMantissa(19 downto 04) := fracValue(15 downto 0); ieeeFloat.binMantissa(03 downto 00) := (others => '0');
                    elsif intValue(2)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(129,8)); ieeeFloat.binMantissa(22 downto 21) := intValue(01 downto 0); ieeeFloat.binMantissa(20 downto 05) := fracValue(15 downto 0); ieeeFloat.binMantissa(04 downto 00) := (others => '0');
                    elsif intValue(1)  = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(128,8)); ieeeFloat.binMantissa(22 downto 22) := intValue(00 downto 0); ieeeFloat.binMantissa(21 downto 06) := fracValue(15 downto 0); ieeeFloat.binMantissa(05 downto 00) := (others => '0');
                    elsif intValue(0)   = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(127,8)); ieeeFloat.binMantissa(22 downto 07) := fracValue(15 downto 0); ieeeFloat.binMantissa(06 downto 00) := (others => '0');
                    elsif fracValue(15) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(126,8)); ieeeFloat.binMantissa(22 downto 08) := fracValue(14 downto 0); ieeeFloat.binMantissa(07 downto 00) := (others => '0');
                    elsif fracValue(14) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(125,8)); ieeeFloat.binMantissa(22 downto 09) := fracValue(13 downto 0); ieeeFloat.binMantissa(08 downto 00) := (others => '0');
                    elsif fracValue(13) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(124,8)); ieeeFloat.binMantissa(22 downto 10) := fracValue(12 downto 0); ieeeFloat.binMantissa(09 downto 00) := (others => '0');
                    elsif fracValue(12) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(123,8)); ieeeFloat.binMantissa(22 downto 11) := fracValue(11 downto 0); ieeeFloat.binMantissa(10 downto 00) := (others => '0');
                    elsif fracValue(11) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(122,8)); ieeeFloat.binMantissa(22 downto 12) := fracValue(10 downto 0); ieeeFloat.binMantissa(11 downto 00) := (others => '0');
                    elsif fracValue(10) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(121,8)); ieeeFloat.binMantissa(22 downto 13) := fracValue(09 downto 0); ieeeFloat.binMantissa(12 downto 00) := (others => '0');
                    elsif fracValue(09) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(120,8)); ieeeFloat.binMantissa(22 downto 14) := fracValue(08 downto 0); ieeeFloat.binMantissa(13 downto 00) := (others => '0');
                    elsif fracValue(08) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(119,8)); ieeeFloat.binMantissa(22 downto 15) := fracValue(07 downto 0); ieeeFloat.binMantissa(14 downto 00) := (others => '0');
                    elsif fracValue(07) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(118,8)); ieeeFloat.binMantissa(22 downto 16) := fracValue(06 downto 0); ieeeFloat.binMantissa(15 downto 00) := (others => '0');
                    elsif fracValue(06) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(117,8)); ieeeFloat.binMantissa(22 downto 17) := fracValue(05 downto 0); ieeeFloat.binMantissa(16 downto 00) := (others => '0');
                    elsif fracValue(05) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(116,8)); ieeeFloat.binMantissa(22 downto 18) := fracValue(04 downto 0); ieeeFloat.binMantissa(17 downto 00) := (others => '0');
                    elsif fracValue(04) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(115,8)); ieeeFloat.binMantissa(22 downto 19) := fracValue(03 downto 0); ieeeFloat.binMantissa(18 downto 00) := (others => '0');
                    elsif fracValue(03) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(114,8)); ieeeFloat.binMantissa(22 downto 20) := fracValue(02 downto 0); ieeeFloat.binMantissa(19 downto 00) := (others => '0');
                    elsif fracValue(02) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(113,8)); ieeeFloat.binMantissa(22 downto 21) := fracValue(01 downto 0); ieeeFloat.binMantissa(20 downto 00) := (others => '0');
                    elsif fracValue(01) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(112,8)); ieeeFloat.binMantissa(22 downto 22) := fracValue(00 downto 0); ieeeFloat.binMantissa(21 downto 00) := (others => '0');
                    elsif fracValue(00) = '1' then ieeeFloat.iee754StdExp := std_logic_vector(to_unsigned(111,8)); ieeeFloat.binMantissa(22 downto 00) := (others => '0');
                    elsif SignedQnmValue = x"00000000" then ieeeFloat.iee754StdExp := (others => '0') ;ieeeFloat.binMantissa := (others => '0');
                    
                    end if;
            
        
                    
    ieeeFloat.signBit        := (others => SignedQnmValue(31));    
    floatValue(31 downto 31)    <= ieeeFloat.signBit;
    floatValue(30 downto 23)    <= ieeeFloat.iee754StdExp;
    floatValue(22 downto 0)     <= ieeeFloat.binMantissa;
                    
        
    end process;
    

end Behavioral;
