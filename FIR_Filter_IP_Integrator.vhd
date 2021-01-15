----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2020 09:19:50 PM
-- Design Name: 
-- Module Name: systolic - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity systolic is
  Port (clk, tvalid_in: IN STD_LOGIC; 
        tdata_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        tvalid_out, tready: OUT STD_LOGIC;
        tdata_out : OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
end systolic;

architecture Behavioral of systolic is

COMPONENT fir_compiler_0
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

--signal tvalid_out, tready: STD_LOGIC;
--signal tdata_out : STD_LOGIC_VECTOR(31 DOWNTO 0);


begin

uut:fir_compiler_0 port map(aclk => clk, s_axis_data_tvalid => tvalid_in, s_axis_data_tready => tready, s_axis_data_tdata => tdata_in, m_axis_data_tvalid => tvalid_out, m_axis_data_tdata => tdata_out);


end Behavioral;
