--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:26:26 10/19/2016
-- Design Name:   
-- Module Name:   /home/anderson/PSR/TB_PSR.vhd
-- Project Name:  PSR
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSR
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
 
ENTITY TB_PSR IS
END TB_PSR;
 
ARCHITECTURE behavior OF TB_PSR IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         NZVC : IN  std_logic_vector(3 downto 0);
         ncwp : IN  std_logic_vector(1 downto 0);
         clk : IN  std_logic;
         Reset : IN  std_logic;
         cwp : OUT  std_logic_vector(1 downto 0);
         Carry : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal NZVC : std_logic_vector(3 downto 0) := (others => '0');
   signal ncwp : std_logic_vector(1 downto 0) := "00";
   signal clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal cwp : std_logic_vector(1 downto 0);
   signal Carry : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          NZVC => NZVC,
          ncwp => ncwp,
          clk => clk,
          Reset => Reset,
          cwp => cwp,
          Carry => Carry
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      Reset <= '0';
		ncwp <= "01";
		NZVC <= "0001";
		wait for 40 ns;
		
		Reset <= '0';
		ncwp <= "10";
		NZVC <= "0000";
		wait for 40 ns;
		
		Reset <= '1';
		ncwp <= "01";
		NZVC <= "0001";
		wait for 40 ns;
		
   end process;

END;
