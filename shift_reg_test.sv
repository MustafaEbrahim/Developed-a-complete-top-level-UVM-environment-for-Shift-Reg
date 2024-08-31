package shift_reg_test_pkg;
	import uvm_pkg::*; //import uvm package
	import shift_reg_env_pkg::*;
    import shift_reg_config_pkg::*;
    import shift_reg_seq_item_pkg::*;
    import shift_reg_sequence::*;
    
    
   `include "uvm_macros.svh" //import macros
   class shift_reg_test extends  uvm_test;
   	`uvm_component_utils(shift_reg_test)
   	shift_reg_env env ;
    virtual shift_reg_if shift_reg_test_vif ;
    shift_reg_config shift_reg_config_obj_test ;
    // shift_reg_reset_sequence reset_seq ;
    shift_reg_main_sequence main_seq ;
   	// Constructor
   	function new(string name = "name", uvm_component parent=null);
   		super.new(name, parent);
   	endfunction 
   function void build_phase (uvm_phase phase);
   	    super.build_phase(phase);
        env = shift_reg_env::type_id::create("env",this);
        shift_reg_config_obj_test  = shift_reg_config::type_id::create("shift_reg_cfg",this);
        reset_seq =shift_reg_reset_sequence :: type_id :: create ("reset_seq",this);
        main_seq =shift_reg_main_sequence :: type_id :: create ("main_seq",this);
        
        if (!uvm_config_db#(virtual shift_reg_if)::get(this, "", "shift_reg_IF", shift_reg_config_obj_test.shift_reg_config_vif ))begin
            `uvm_fatal("build_phase","Test - unable to get the virtual interface of shift_reg from the uvm_config_db")
        end 
            uvm_config_db#(shift_reg_config)::set(this, "*", "CFG", shift_reg_config_obj_test);
        endfunction 

   task run_phase(uvm_phase phase);
   	    super.run_phase(phase);
   	    phase.raise_objection(this);
   	    // `uvm_info("run_phase","Reset Asserted",UVM_LOW)
        // reset_seq.start(env.agt.sqr);
        // `uvm_info("run_phase","Reset Deasserted",UVM_LOW)
        `uvm_info("run_phase","stimulus Generation Started",UVM_LOW)
        main_seq.start(env.agt.sqr);
        `uvm_info("run_phase","stimulus Generation End",UVM_LOW)
   	    phase.drop_objection(this);
   endtask 
   endclass 
endpackage 