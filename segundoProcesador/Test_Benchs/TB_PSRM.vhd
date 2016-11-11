--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:26:11 10/19/2016
-- Design Name:   
-- Module Name:   /home/anderson/PSR_Modifier/TB_PSRM.vhd
-- Project Name:  PSR_Modifier
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSR_Modifier
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_PSRM IS
END TB_PSRM;
 
ARCHITECTURE behavior OF TB_PSRM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR_Modifier
    PORT(
         crs1 : IN  std_logic;
         crs2 : IN  std_logic;
         Reset : IN  std_logic;
         Aluop : IN  std_logic_vector(5 downto 0);
         Aluresult : IN  std_logic_vector(31 downto 0);
         NZVC : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal crs1 : std_logic := '0';
   signal crs2 : std_logic := '0';
   signal Reset : std_logic := '0';
   signal Aluop : std_logic_vector(5 downto 0) := (others => '0');
   signal Aluresult : std_logic_vector(31 downto 0) := (others => '0');
	
 	--Outputs
   signal NZVC : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR_Modifier PORT MAP (
          crs1 => crs1,
          crs2 => crs2,
          Reset => Reset,
          Aluop => Aluop,
          Aluresult => Aluresult,
          NZVC => NZVC
        );



   -- Stimulus process
   stim_proc: process
   begin		
     Aluresult <= "00000000000000000000000000000000";
	  crs2 <= '1';
	  crs1 <= '1';
	  Aluop <= "001110";
	  Reset <= '0';
	  wait for 40 ns;
	  
	  Aluresult <= "10000000000000000000000000000000";
	  crs2 <= '1';
	  crs1 <= '1';
	  Aluop <= "001110";
	  Reset <= '0';
	  wait for 40 ns;
	  
	  
   end process;

END;
