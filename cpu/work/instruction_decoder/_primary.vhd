library verilog;
use verilog.vl_types.all;
entity instruction_decoder is
    port(
        instruction_set : in     vl_logic_vector(31 downto 0);
        rm              : out    vl_logic_vector(3 downto 0);
        shift           : out    vl_logic_vector(7 downto 0);
        rn              : out    vl_logic_vector(3 downto 0);
        rd              : out    vl_logic_vector(3 downto 0);
        rotate          : out    vl_logic_vector(3 downto 0);
        immediateValue  : out    vl_logic_vector(7 downto 0);
        br_address      : out    vl_logic_vector(23 downto 0);
        dt_address      : out    vl_logic_vector(11 downto 0);
        ALUCtl_code     : out    vl_logic_vector(10 downto 0);
        enable          : in     vl_logic;
        cpsr_enable     : out    vl_logic;
        execute_flag    : out    vl_logic;
        cpsr            : in     vl_logic_vector(31 downto 0);
        cond_field      : out    vl_logic_vector(3 downto 0);
        immediate_enable: out    vl_logic
    );
end instruction_decoder;
