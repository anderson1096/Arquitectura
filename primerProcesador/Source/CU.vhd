----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:46:00 10/05/2016 
-- Design Name: 
-- Module Name:    CU - arq_CU 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CU is
    Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           Aluop : out  STD_LOGIC_VECTOR (5 downto 0) := (others => '0'));
end CU;

architecture arq_CU of CU is

begin
	process(Op, Op3)
		begin 
			case Op is
				when "10" => 
					case Op3 is
						when "000000" => Aluop <= "000000";
						when "000100" => Aluop <= "000001";
						when "000001" => Aluop <= "000010";
						when "000010" => Aluop <= "000011";
						when "000011" => Aluop <= "000100";
						when "000111" => Aluop <= "000101";
						when "000101" => Aluop <= "000110";
						when "000110" => Aluop <= "000111";
						when others => Aluop <= "111111";
					end case;
				when others => Aluop <= "111111";
			end case;
	end process;

end arq_CU;

