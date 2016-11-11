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
			  icc : in STD_LOGIC_VECTOR (3 downto 0);
			  cond : in std_logic_vector (3 downto 0);
			  wrenmem : out STD_LOGIC;
				rfsource : out STD_LOGIC_VECTOR (1 DOWNTO 0);
				rfdest : out STD_LOGIC;
				pcsource: out STD_LOGIC_VECTOR(1 DOWNTO 0);
				we : out std_logic;
           Aluop : out  STD_LOGIC_VECTOR (5 downto 0));
end CU;

architecture arq_CU of CU is

signal aux : STD_LOGIC_VECTOR(2 DOWNTO 0) := (others => '0');

begin
	--aritmetico logicas
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
	
	process(op, op3, icc, cond)
		begin
			if (op = "11") then --formato 3 load y store
				
				if (op3 = "000100") then --store
					wrenmem <= '1';
					we <= '0';
				else --load
					wrenmem <= '0';
					we <= '1';
				end if;
			else
					wrenmem <= '0';
					we <= '1';
			end if;
			
			--saltos
			if (op = "01") then --call
				pcsource <= "00";
				we <= '1';
			elsif (op = "00") then --branch
				pcsource <= "01";
				we <= '0';
			elsif (op = "10") then
				if (op3 = "111000") then --jumpl
					pcsource <= "11";
					we <= '0';
				else
					pcsource <= "10";
					we <= '1';
				end if;
			end if;
			
			--proceso de los saltos
			
			if(op = "00") then --formato2
				
				case cond is
				
					when 	"1000" => --BA
						pcsource <= "01"; --jumpl, pasa la alu
												
					when 	"0000" => --BN
						pcsource <= "10"; --sigue contando normal
						
					when 	"1001" => --BNE
						if((not icc(2))='1') then --not z
							pcsource <= "01"; --branch
						else 
							pcsource <= "10"; --cuenta normal
						end if;
						
					when 	"0001" => --BE
						if(icc(2)='1') then --z
							pcsource <= "01";
						else 
							pcsource <= "10";
						end if;
						
					when 	"1010" => --BG
						if(( not(icc(2) or (icc(3) xor icc(1)) ) ) ='1') then --not(z or (n xor v))
							pcsource <= "01";
						else 
							pcsource <= "10";
						end if;
						
					when 	"0010" => --BLE
						if((icc(2) or (icc(3) xor icc(1)) )='1') then --z or (n xor v)
							pcsource <= "01";
						else 
							pcsource <= "10";
						end if;
						
					when 	"1011" => --BGE
						if(( not(icc(3) xor icc(1)) )='1') then --not(n xor v)
							pcsource <= "01";
						else 
							pcsource <= "10";
						end if;
						
					when 	"0011" => --BL
						if(( icc(3) xor icc(1) )='1') then --n xor v
							pcsource <= "01";
						else 
							pcsource <= "10";
						end if;
						
					when 	"1100" => --BGU
						if(( not(icc(0) or icc(2)) )='1') then --not(c or z)
							pcsource <= "01";
						else 
							pcsource <= "10";
						end if;
						
					when 	"0100" => --BLEU
						if(( icc(0) or icc(2) )='1') then --c or z
							pcsource <= "01";
						else 
							pcsource <= "10";
						end if;
						
					when 	"1101" => --BCC
						if(( not(icc(0)) )='1') then --not c
							pcsource <= "01";
						else 
							pcsource <= "10";
						end if;
						
					when 	"0101" => --BCS
						if((icc(0))='1') then --c 
							pcsource <= "01";
						else 
							pcsource <= "10";
						end if;
						
					when 	"1110" => --BPOS
						if(( not(icc(3)) )='1') then --not n
							pcsource <= "01";
						else 
							pcsource <= "10";
						end if;
						
					when 	"0110" => --BNEG
						if((icc(3))='1') then --n
							pcsource <= "01";
						else 
							pcsource <= "10";
						end if;
						
					when 	"1111" => --BVC
						if(( not(icc(1)))='1') then --not v
							pcsource <= "01";
						else 
							pcsource <= "10";
						end if;
						
					when 	"0111" => --BVS
						if((icc(1))='1') then --v
							pcsource <= "01";
						else 
							pcsource <= "10";
						end if;
						
					when others =>
						pcsource <= (others=>'1'); --error
					
					end case;
						
		end if;
	end process;
	
	process(op)
		begin
			if (op="10") then --aritmeticas
				rfsource <= "01";
				rfdest <= '0';
			elsif (op="11") then --load
				rfsource <= "00";
				rfdest <= '0';
			elsif (op="01") then --call
				rfsource <= "10";
				rfdest <= '1';
			else	
				rfdest <= '0';
			end if;
	end process;

end arq_CU;

