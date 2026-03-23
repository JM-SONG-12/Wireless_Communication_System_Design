library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_clkgen is
end entity;

architecture rtl of tb_clkgen is 

    component clkgen
        port(   
            nrst  : in std_logic;
            mclk  : in std_logic;
            clk8x : out std_logic;
            clk4x : out std_logic;
            clk2x : out std_logic;
            clk1x : out std_logic
        );
    end component;


    signal nrst  : std_logic := '0';
    signal mclk  : std_logic := '0';
    signal clk8x : std_logic;
    signal clk4x : std_logic;
    signal clk2x : std_logic;
    signal clk1x : std_logic;

begin

    UUT: clkgen port map (
        nrst  => nrst,
        mclk  => mclk,
        clk8x => clk8x,
        clk4x => clk4x,
        clk2x => clk2x,
        clk1x => clk1x
    );
    

    tb : process 
    begin
        mclk <= '0';
        wait for 20 ns;
        mclk <= '1';
        wait for 20 ns;
    end process;


    rstp: process
    begin
        nrst <= '0';
        wait for 100 ns;
        nrst <= '1';
        wait; 
    end process;

end architecture;