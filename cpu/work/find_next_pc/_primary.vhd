library verilog;
use verilog.vl_types.all;
entity find_next_pc is
    generic(
        Branch          : vl_logic_vector(10 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi1, Hi1, Hi1);
        BranchLink      : vl_logic_vector(10 downto 0) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        ALUCtl_code     : in     vl_logic_vector(10 downto 0);
        br_address      : in     vl_logic_vector(23 downto 0);
        program_counter : in     vl_logic_vector(31 downto 0);
        program_counter_next: out    vl_logic_vector(31 downto 0);
        next_r14        : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Branch : constant is 2;
    attribute mti_svvh_generic_type of BranchLink : constant is 2;
end find_next_pc;
