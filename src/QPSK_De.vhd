library ieee;
use ieee.std_logic_1164.all;

entity QPSK_De is
    port (
        nrst : in STD_LOGIC;
        pclk   : in STD_LOGIC;
        rdata : in STD_LOGIC_VECTOR(5 downto 0);
        idata : in STD_LOGIC_VECTOR(5 downto 0);
        outbits : out STD_LOGIC_VECTOR(1 downto 0)       
    );
end entity;

architecture arch of QPSK_De is

begin
    process (nrst, pclk)
    begin
        if nrst = '0' then
            outbits <= "00";
        elsif rising_edge(pclk) then
            if  rdata(5) = '0' then
                if idata(5) = '0' then
                    outbits <= "00";
                else
                    outbits <= "01";
                end if;
            elsif rdata(5) = '1' then
                if idata(5) = '0' then
                    outbits <= "10";
                else 
                    outbits <= "11";
                end if;                
            end if;
        end if;            
    end process;
end arch;