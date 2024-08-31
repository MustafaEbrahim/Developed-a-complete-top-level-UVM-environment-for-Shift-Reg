package shift_reg_sequence;
	import uvm_pkg::*;
	import shift_reg_seq_item_pkg::*;
	
	`include "uvm_macros.svh" // Import UVM macros
// class shift_reg_reset_sequence extends  uvm_sequence #(shift_reg_item);

// 	// Provide implementations of virtual methods such as get_type_name and create
// 	`uvm_object_utils(shift_reg_reset_sequence)

//     shift_reg_item seq_item ;
// 	function new(string name = "shift_reg_reset_sequence");
// 		super.new(name);
// 	endfunction 
// 	task body();
// 		seq_item = shift_reg_item::type_id::create("seq_item");
// 		start_item(seq_item);
// 		seq_item.reset = 1 ;
// 		seq_item.serial_in = 0 ;
// 	    seq_item.direction = 0 ;
// 	    seq_item.mode = 0 ;
//         seq_item.datain = 0 ;
//         finish_item(seq_item);
// 	endtask : body

// endclass 

class shift_reg_main_sequence extends  uvm_sequence #(shift_reg_item);

	// Provide implementations of virtual methods such as get_type_name and create
	`uvm_object_utils(shift_reg_main_sequence)

    shift_reg_item seq_item ;
	function new(string name = "shift_reg_main_sequence");
		super.new(name);
	endfunction 
	task body();
		repeat(10000)begin
          	seq_item = shift_reg_item::type_id::create("seq_item");
     		start_item(seq_item);
     		assert(seq_item.randomize());
            finish_item(seq_item);
        end 
	endtask 

endclass 
	
endpackage : shift_reg_sequence