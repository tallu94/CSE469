library verilog;
use verilog.vl_types.all;
entity instruction_memory is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        pc_address      : in     vl_logic_vector(31 downto 0);
        instruction_set : out    vl_logic_vector(31 downto 0)
    );
end instruction_memory;
