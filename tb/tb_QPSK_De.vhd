library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_QPSK_De is
end entity;

architecture behavior of tb_QPSK_De is 

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

    component rbgen
        port(   
            nrst  : in std_logic;
            clk : in STD_LOGIC;
            outbit : out STD_LOGIC
        );
    end component;

    component S2P
        port(   
            nrst  : in std_logic;
            sclk : in STD_LOGIC;
            pclk : in STD_LOGIC;
            inbit : in STD_LOGIC;
            outbits : out STD_LOGIC_VECTOR(1 downto 0)
        );
    end component;

    component QPSK
        port(   
            nrst  : in std_logic;
            pclk : in STD_LOGIC;
            inbits : in STD_LOGIC_VECTOR(1 downto 0);
            rdata : out STD_LOGIC_VECTOR(5 downto 0);
            idata : out STD_LOGIC_VECTOR(5 downto 0)
        );
    end component;

    component QPSK_De
        port (
            nrst : in STD_LOGIC;
            pclk   : in STD_LOGIC;
            rdata : in STD_LOGIC_VECTOR(5 downto 0);
            idata : in STD_LOGIC_VECTOR(5 downto 0);
            outbits : out STD_LOGIC_VECTOR(1 downto 0)       
        );
    end component;


    signal nrst, mclk  : std_logic;
    signal clk8x : std_logic;
    signal clk4x : std_logic;
    signal clk2x : std_logic;
    signal clk1x : std_logic;
    signal rbit : STD_LOGIC;
    signal outbits : STD_LOGIC_VECTOR(1 downto 0);
    signal rmapout : STD_LOGIC_VECTOR(5 downto 0);
    signal imapout : STD_LOGIC_VECTOR(5 downto 0);
    signal finalbits : STD_LOGIC_VECTOR(1 downto 0);

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
    
    iQPSK_De: QPSK_De port map (
            nrst => nrst,
            pclk => clk1x,
            rdata => rmapout,
            idata => imapout,
            outbits => finalbits
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