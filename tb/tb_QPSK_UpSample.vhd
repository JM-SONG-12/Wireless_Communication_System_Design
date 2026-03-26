library ieee;
use ieee.std_logic_1164.all;

entity tb_QPSK_UpSample is
end entity;

architecture behavior of tb_QPSK_UpSample is

component clkgen
        port(   
            nrst  : in STD_LOGIC;
            mclk  : in STD_LOGIC;
            clk8x : out STD_LOGIC;
            clk4x : out STD_LOGIC;
            clk2x : out STD_LOGIC;
            clk1x : out STD_LOGIC
        );
    end component;

    component rbgen
        port(   
            nrst  : in STD_LOGIC;
            clk : in STD_LOGIC;
            outbit : out STD_LOGIC
        );
    end component;

    component S2P
        port(   
            nrst  : in STD_LOGIC;
            sclk : in STD_LOGIC;
            pclk : in STD_LOGIC;
            inbit : in STD_LOGIC;
            outbits : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    component QPSK
        port(   
            nrst  : in STD_LOGIC;
            pclk : in STD_LOGIC;
            inbits : in STD_LOGIC_VECTOR(1 downto 0);
            rdata : out STD_LOGIC_VECTOR(5 downto 0);
            idata : out STD_LOGIC_VECTOR(5 downto 0)
        );
    end component;

    component upsample
        port(
            nrst : in STD_LOGIC;
            clk4x : in STD_LOGIC;
            clk1x : in STD_LOGIC;
            rdata, idata : in STD_LOGIC_VECTOR(5 downto 0);
            rd4x, id4x : out STD_LOGIC_VECTOR(5 downto 0)
        );
    end component;

    signal nrst : STD_LOGIC;
    signal mclk : STD_LOGIC;
    signal clk8x, clk4x, clk2x, clk1x : STD_LOGIC;
    signal rbit : STD_LOGIC;

    signal outbits : STD_LOGIC_VECTOR(1 downto 0);
    signal rmapout, imapout : STD_LOGIC_VECTOR(5 downto 0);
    signal r_upout, i_upout : STD_LOGIC_VECTOR(5 downto 0);

begin
    iclkgen: clkgen port map(
            nrst => nrst,
            mclk => mclk,
            clk8x => clk8x,
            clk4x => clk4x,
            clk2x => clk2x,
            clk1x => clk1x
        );

    irbgen: rbgen port map(
            nrst => nrst,
            clk => clk2x,
            outbit => rbit
        );

    iS2P: S2P port map(
            nrst => nrst,
            sclk => clk2x,
            pclk => clk1x,
            inbit => rbit,
            outbits => outbits
        );

    iQPSK: QPSK port map(
            nrst => nrst,
            pclk => clk1x,
            inbits => outbits,
            rdata => rmapout,
            idata => imapout
        );

    iupsample: upsample port map(
            nrst => nrst,
            clk4x => clk4x,
            clk1x => clk1x,
            rdata => rmapout,
            idata => imapout,
            rd4x => r_upout,
            id4x => i_upout
        );
    tb : process 
    begin
        mclk <= '1';
        wait for 20 ns;
        mclk <= '0';
        wait for 20 ns;
    end process;


    rstp: process
    begin
        nrst <= '0';
        wait for 100 ns;
        nrst <= '1';
        wait; 
    end process;

end;
