----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2020 10:58:43 PM
-- Design Name: 
-- Module Name: FIR_FILTER - Behavioral
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

entity FIR_FILTER is
  Port (clk: in STD_LOGIC;
        x: in STD_LOGIC_VECTOR(15 downto 0);
        y: out STD_LOGIC_VECTOR(36 downto 0));
end FIR_FILTER;

architecture Behavioral of FIR_FILTER_Parallel is

component Parallel is
Port (  clk: in STD_LOGIC;
        x: in STD_LOGIC_VECTOR (15 downto 0);
        h: in INTEGER;
        add_in: in SIGNED (36 downto 0);
        add_out: out SIGNED (36 downto 0));
end component Parallel;

--coefficients
constant h0 : integer := 0;
constant h1 : integer := 81;
constant h2 : integer := 0;
constant h3 : integer := -280;
constant h4 : integer := 0;
constant h5 : integer := 797;
constant h6 : integer := 0;
constant h7 : integer := -2014;
constant h8 : integer := 0;
constant h9 : integer := 7324;
constant h10 : integer := 11776;
constant h11 : integer := 7324;
constant h12 : integer := 0;
constant h13 : integer := -2014;
constant h14 : integer := 0;
constant h15 : integer := 797;
constant h16 : integer := 0;
constant h17 : integer := -280;
constant h18 : integer := 0;
constant h19 : integer := 81;

--multiplication output
signal x_h0: signed (36 downto 0);
signal x_h1: signed (36 downto 0);
signal x_h2: signed (36 downto 0);
signal x_h3: signed (36 downto 0);
signal x_h4: signed (36 downto 0);
signal x_h5: signed (36 downto 0);
signal x_h6: signed (36 downto 0);
signal x_h7: signed (36 downto 0);
signal x_h8: signed (36 downto 0);
signal x_h9: signed (36 downto 0);
signal x_h10: signed (36 downto 0);
signal x_h11: signed (36 downto 0);
signal x_h12: signed (36 downto 0);
signal x_h13: signed (36 downto 0);
signal x_h14: signed (36 downto 0);
signal x_h15: signed (36 downto 0);
signal x_h16: signed (36 downto 0);
signal x_h17: signed (36 downto 0);
signal x_h18: signed (36 downto 0);
signal x_h19: signed (36 downto 0);

--addition outputs
signal add0: signed (36 downto 0);
signal add1: signed (36 downto 0);
signal add2: signed (36 downto 0);
signal add3: signed (36 downto 0);
signal add4: signed (36 downto 0);
signal add5: signed (36 downto 0);
signal add6: signed (36 downto 0);
signal add7: signed (36 downto 0);
signal add8: signed (36 downto 0);
signal add9: signed (36 downto 0);
signal add10: signed (36 downto 0);
signal add11: signed (36 downto 0);
signal add12: signed (36 downto 0);
signal add13: signed (36 downto 0);
signal add14: signed (36 downto 0);
signal add15: signed (36 downto 0);
signal add16: signed (36 downto 0);
signal add17: signed (36 downto 0);
signal add18: signed (36 downto 0);
signal add19: signed (36 downto 0);

constant ones: signed(36 downto 0):= (others => '1');

begin

--Part 2 Parallel Method

--Multiplication
x_h19 <= signed(x) * to_signed(h19,21);


--Addition
process(clk)--,x,x_h19)
        begin
            if(rising_edge(clk)) then
                add19 <= x_h19;
            end if;
end process;

--block 18 - 1
block_18: parallel port map(clk => clk, x => x, h => h18, add_in => add19, add_out => add18);
block_17: parallel port map(clk => clk, x => x, h => h17, add_in => add18, add_out => add17);
block_16: parallel port map(clk => clk, x => x, h => h16, add_in => add17, add_out => add16);
block_15: parallel port map(clk => clk, x => x, h => h15, add_in => add16, add_out => add15);
block_14: parallel port map(clk => clk, x => x, h => h14, add_in => add15, add_out => add14);
block_13: parallel port map(clk => clk, x => x, h => h13, add_in => add14, add_out => add13);
block_12: parallel port map(clk => clk, x => x, h => h12, add_in => add13, add_out => add12);
block_11: parallel port map(clk => clk, x => x, h => h11, add_in => add12, add_out => add11);
block_10: parallel port map(clk => clk, x => x, h => h10, add_in => add11, add_out => add10);
block_9: parallel port map(clk => clk, x => x, h => h9, add_in => add10, add_out => add9);
block_8: parallel port map(clk => clk, x => x, h => h8, add_in => add9, add_out => add8);
block_7: parallel port map(clk => clk, x => x, h => h7, add_in => add8, add_out => add7);
block_6: parallel port map(clk => clk, x => x, h => h6, add_in => add7, add_out => add6);
block_5: parallel port map(clk => clk, x => x, h => h5, add_in => add6, add_out => add5);
block_4: parallel port map(clk => clk, x => x, h => h4, add_in => add5, add_out => add4);
block_3: parallel port map(clk => clk, x => x, h => h3, add_in => add4, add_out => add3);
block_2: parallel port map(clk => clk, x => x, h => h2, add_in => add3, add_out => add2);
block_1: parallel port map(clk => clk, x => x, h => h1, add_in => add2, add_out => add1);

--Final Output
x_h0 <= signed(x) * to_signed(h1,21);
add0 <= add1 + x_h0;
y <= STD_LOGIC_VECTOR(add0);



end Behavioral;
