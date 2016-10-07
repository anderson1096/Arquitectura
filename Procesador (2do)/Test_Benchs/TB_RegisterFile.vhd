--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:53:03 10/07/2016
-- Design Name:   
-- Module Name:   /home/anderson/RegisterFile/TB_RegisterFile.vhd
-- Project Name:  RegisterFile
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegisterFile
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
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_RegisterFile IS
END TB_RegisterFile;
 
ARCHITECTURE behavior OF TB_RegisterFile IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegisterFile
    PORT(
         Rs1 : IN  std_logic_vector(4 downto 0);
         Rs2 : IN  std_logic_vector(4 downto 0);
         Rd : IN  std_logic_vector(4 downto 0);
         Reset : IN  std_logic;
         WEnable : IN  std_logic;
         Data : IN  std_logic_vector(31 downto 0);
         Crs1 : OUT  std_logic_vector(31 downto 0);
         Crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal Rd : std_logic_vector(4 downto 0) := (others => '0');
   signal Reset : std_logic := '0';
   signal WEnable : std_logic := '0';
   signal Data : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal Crs1 : std_logic_vector(31 downto 0);
   signal Crs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegisterFile PORT MAP (
          Rs1 => Rs1,
          Rs2 => Rs2,
          Rd => Rd,
          Reset => Reset,
          WEnable => WEnable,
          Data => Data,
          Crs1 => Crs1,
          Crs2 => Crs2
        );

   -- Clock process definitions
   

   -- Stimulus process
   stim_proc: process
   begin		
      
		Rs1 <= "00001";
		Rs2 <= "00010";
		Rd <= "00001";
		WEnable <= '1';
		Data <= "00000000000000000000000000011111";
		Reset <= '0';
		
		wait for 40 ns;
		
		Rs1 <= "00001";
		Rs2 <= "00010";
		Rd <= "00011";
		WEnable <= '1';
		Data <= "00000000000000000000000000000011";
		Reset <= '0';
		
		wait for 40 ns;
	
		
		Rs1 <= "00001";
		Rs2 <= "00011";
		Rd <= "00011";
		WEnable <= '0';
		Data <= "00000000000000000000000000000011";
		Reset <= '0';
		
		wait for 40 ns;
		
		Rs1 <= "01001";
		Rs2 <= "00111";
		Rd <= "00111";
		WEnable <= '0';
		Data <= "00000000000000000000000000000011";
		Reset <= '0';
		
		wait for 40 ns;
		

      -- insert stimulus here 

      wait;
   end process;

END;
