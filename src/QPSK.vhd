library ieee;
use ieee.std_logic_1164.all;

entity QPSK is
    port (
        nrst : in STD_LOGIC;
        pclk   : in STD_LOGIC;
        inbits : in STD_LOGIC_VECTOR(1 downto 0);
        rdata : out STD_LOGIC_VECTOR(5 downto 0);
        idata : out STD_LOGIC_VECTOR(5 downto 0)        
    );
end entity;

architecture arch of QPSK is
constant pvalue : STD_LOGIC_VECTOR(5 downto 0) := "010000";
constant nvalue : STD_LOGIC_VECTOR(5 downto 0) := "110000";

begin
    process (nrst, pclk)
    begin
        if nrst = '0' then
            rdata <= "000000";
            idata <= "000000";
        elsif rising_edge(pclk) then
            if inbits = "00" then
                rdata <= pvalue;
                idata <= pvalue;
            elsif inbits = "01" then
                rdata <= pvalue;
                idata <= nvalue;
            elsif inbits = "10" then
                rdata <= nvalue;
                idata <= pvalue;
            elsif inbits = "11" then
                rdata <= nvalue;
                idata <= nvalue;
            end if;
        end if;            
    end process;
end arch;