library verilog;
use verilog.vl_types.all;
entity cpu is
    port(
        clk             : in     vl_logic;
        nreset          : in     vl_logic;
        led             : out    vl_logic;
        debug_port1     : out    vl_logic_vector(7 downto 0);
        debug_port2     : out    vl_logic_vector(7 downto 0);
        debug_port3     : out    vl_logic_vector(7 downto 0);
        debug_port4     : out    vl_logic_vector(7 downto 0);
        debug_port5     : out    vl_logic_vector(7 downto 0);
        debug_port6     : out    vl_logic_vector(7 downto 0);
        debug_port7     : out    vl_logic_vector(7 downto 0)
    );
end cpu;
