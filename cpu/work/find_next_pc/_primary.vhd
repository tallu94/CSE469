library verilog;
use verilog.vl_types.all;
entity find_next_pc is
    port(
        clk             : in     vl_logic;
        ALUCtl_code     : in     vl_logic_vector(10 downto 0);
        br_address      : in     vl_logic_vector(23 downto 0);
        program_counter : in     vl_logic_vector(31 downto 0);
        program_counter_next: out    vl_logic_vector(31 downto 0);
        next_r14        : out    vl_logic_vector(31 downto 0);
        execute_flag    : in     vl_logic
    );
end find_next_pc;
