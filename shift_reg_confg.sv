package shift_reg_config_pkg;
	import uvm_pkg::*; // Import the UVM package
`include "uvm_macros.svh" // Import UVM macros

class shift_reg_config extends  uvm_object ;
	`uvm_object_utils(shift_reg_config)

	virtual shift_reg_if shift_reg_config_vif ;
	uvm_active_passive_enum active ;

	function new(string name = "shift_reg_config");
        super.new(name);
    endfunction 
endclass 
endpackage 