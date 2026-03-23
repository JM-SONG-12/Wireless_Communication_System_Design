library IEEE;
use ieee.std_logic_1164.all;

entity S2P is
    port (
        nrst : in std_logic;
        sclk : in std_logic;
        pclk : in STD_LOGIC;
        inbit : in STD_LOGIC;
        outbits : out STD_LOGIC_VECTOR(1 downto 0)
    );
end S2P;


architecture arch of S2P is
signal inbuf : STD_LOGIC;

begin
    process(nrst, sclk)
    begin
        if nrst = '0' then
            inbuf <= '0';
        elsif rising_edge(sclk) then
            inbuf <= inbit;
        end if;
    end process;    

    process(nrst, pclk)
    begin
        if nrst = '0' then
            outbits <= (others => '0');
        elsif rising_edge(pclk) then
            outbits <= inbuf & inbit;
        end if;
    end process;

end arch;