
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

entity DataMemory is
    Port ( reset : in  STD_LOGIC;
           c_Rd : in  STD_LOGIC_VECTOR (31 downto 0);
           address : in  STD_LOGIC_VECTOR (4 downto 0);
           WE : in  STD_LOGIC;
           data : out  STD_LOGIC_VECTOR (31 downto 0) := (others => '0'));
end DataMemory;

architecture arq_datamem of DataMemory is

type reg is array (0 to 31) of std_logic_vector(31 downto 0);

signal registros: reg;

begin
process(WE, reset, address, c_Rd)
	begin
		
		if (reset = '1') then
			registros <= (others => x"00000000");
		else
			if (WE = '1') then
				registros(conv_integer(address)) <= c_Rd;
			end if;
		end if;
end process;

data <= registros(conv_integer(address));
end arq_datamem;

