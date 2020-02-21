library verilog;
use verilog.vl_types.all;
entity reg_file is
    port(
        clk             : in     vl_logic;
        read_addr1      : in     vl_logic_vector(3 downto 0);
        read_addr2      : in     vl_logic_vector(3 downto 0);
        write_addr      : in     vl_logic_vector(3 downto 0);
        write_data      : in     vl_logic_vector(31 downto 0);
        read_enable1    : in     vl_logic;
        write_enable1   : in     vl_logic;
        read_data1      : out    vl_logic_vector(31 downto 0);
        read_data2      : out    vl_logic_vector(31 downto 0)
    );
end reg_file;
