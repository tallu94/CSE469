library verilog;
use verilog.vl_types.all;
entity memory_file is
    port(
        clk             : in     vl_logic;
        addr            : in     vl_logic_vector(3 downto 0);
        write_data      : in     vl_logic_vector(31 downto 0);
        ldr_str_en      : in     vl_logic;
        read_data       : out    vl_logic_vector(31 downto 0);
        load_en         : in     vl_logic;
        store_en        : in     vl_logic
    );
end memory_file;
