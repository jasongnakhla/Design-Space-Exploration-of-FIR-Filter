----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2020 11:35:50 PM
-- Design Name: 
-- Module Name: Parallel - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Parallel is
Port (  clk: in STD_LOGIC;
        x: in STD_LOGIC_VECTOR (15 downto 0);
        h: in INTEGER;
        add_in: in SIGNED (36 downto 0);
        add_out: out SIGNED (36 downto 0));
end Parallel;

architecture Behavioral of Parallel is

signal mult: signed(36 downto 0);
signal sum: signed(36 downto 0);

begin

--multiplication
mult <= signed(x) * to_signed(h,21);
sum <= add_in + mult;

--Addition
process(clk)--,x,h,add_in)
        begin
            if(rising_edge(clk)) then
                add_out <= sum;
            end if;
end process;

end Behavioral;
