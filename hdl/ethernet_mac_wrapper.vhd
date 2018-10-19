-------------------------------------------------------------------------------
-- ethernet_mac_wrapper.vhd
-------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VCOMPONENTS.ALL;

library opb_ethernetlite_v1_01_b;
use opb_ethernetlite_v1_01_b.All;

entity ethernet_mac_wrapper is
  port (
    PHY_tx_clk : in std_logic;
    PHY_rx_clk : in std_logic;
    PHY_crs : in std_logic;
    PHY_dv : in std_logic;
    PHY_rx_data : in std_logic_vector(3 downto 0);
    PHY_col : in std_logic;
    PHY_rx_er : in std_logic;
    PHY_rst_n : out std_logic;
    PHY_tx_en : out std_logic;
    PHY_tx_data : out std_logic_vector(3 downto 0);
    OPB_ABus : in std_logic_vector(0 to 31);
    OPB_DBus : in std_logic_vector(0 to 31);
    Sln_DBus : out std_logic_vector(0 to 31);
    OPB_BE : in std_logic_vector(0 to 3);
    OPB_RNW : in std_logic;
    OPB_select : in std_logic;
    OPB_seqAddr : in std_logic;
    OPB_Clk : in std_logic;
    OPB_Rst : in std_logic;
    IP2INTC_Irpt : out std_logic;
    Sln_xferAck : out std_logic;
    Sln_errAck : out std_logic;
    Sln_retry : out std_logic;
    Sln_toutSup : out std_logic
  );
  attribute x_core_info : STRING;
  attribute x_core_info of ethernet_mac_wrapper: entity is "opb_ethernetlite_v1_01_b";

end ethernet_mac_wrapper;

architecture STRUCTURE of ethernet_mac_wrapper is

  component opb_ethernetlite is
    generic (
      C_DUPLEX : INTEGER;
      C_RX_PING_PONG : INTEGER;
      C_TX_PING_PONG : INTEGER;
      C_BASEADDR : std_logic_vector;
      C_HIGHADDR : std_logic_vector;
      C_OPB_AWIDTH : INTEGER;
      C_OPB_DWIDTH : INTEGER;
      C_OPB_CLK_PERIOD_PS : INTEGER;
      C_FAMILY : STRING
    );
    port (
      PHY_tx_clk : in std_logic;
      PHY_rx_clk : in std_logic;
      PHY_crs : in std_logic;
      PHY_dv : in std_logic;
      PHY_rx_data : in std_logic_vector(3 downto 0);
      PHY_col : in std_logic;
      PHY_rx_er : in std_logic;
      PHY_rst_n : out std_logic;
      PHY_tx_en : out std_logic;
      PHY_tx_data : out std_logic_vector(3 downto 0);
      OPB_ABus : in std_logic_vector(0 to (C_OPB_AWIDTH-1));
      OPB_DBus : in std_logic_vector(0 to (C_OPB_DWIDTH-1));
      Sln_DBus : out std_logic_vector(0 to (C_OPB_DWIDTH-1));
      OPB_BE : in std_logic_vector(0 to 3);
      OPB_RNW : in std_logic;
      OPB_select : in std_logic;
      OPB_seqAddr : in std_logic;
      OPB_Clk : in std_logic;
      OPB_Rst : in std_logic;
      IP2INTC_Irpt : out std_logic;
      Sln_xferAck : out std_logic;
      Sln_errAck : out std_logic;
      Sln_retry : out std_logic;
      Sln_toutSup : out std_logic
    );
  end component;

begin

  ethernet_mac : opb_ethernetlite
    generic map (
      C_DUPLEX => 1,
      C_RX_PING_PONG => 1,
      C_TX_PING_PONG => 1,
      C_BASEADDR => X"40e00000",
      C_HIGHADDR => X"40e0ffff",
      C_OPB_AWIDTH => 32,
      C_OPB_DWIDTH => 32,
      C_OPB_CLK_PERIOD_PS => 10000,
      C_FAMILY => "virtex2p"
    )
    port map (
      PHY_tx_clk => PHY_tx_clk,
      PHY_rx_clk => PHY_rx_clk,
      PHY_crs => PHY_crs,
      PHY_dv => PHY_dv,
      PHY_rx_data => PHY_rx_data,
      PHY_col => PHY_col,
      PHY_rx_er => PHY_rx_er,
      PHY_rst_n => PHY_rst_n,
      PHY_tx_en => PHY_tx_en,
      PHY_tx_data => PHY_tx_data,
      OPB_ABus => OPB_ABus,
      OPB_DBus => OPB_DBus,
      Sln_DBus => Sln_DBus,
      OPB_BE => OPB_BE,
      OPB_RNW => OPB_RNW,
      OPB_select => OPB_select,
      OPB_seqAddr => OPB_seqAddr,
      OPB_Clk => OPB_Clk,
      OPB_Rst => OPB_Rst,
      IP2INTC_Irpt => IP2INTC_Irpt,
      Sln_xferAck => Sln_xferAck,
      Sln_errAck => Sln_errAck,
      Sln_retry => Sln_retry,
      Sln_toutSup => Sln_toutSup
    );

end architecture STRUCTURE;

