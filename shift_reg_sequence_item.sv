package shift_reg_seq_item_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh" // Import UVM macros
class shift_reg_item extends  uvm_sequence_item;
	`uvm_object_utils (shift_reg_item)
	// rand bit reset ;
	rand bit serial_in;
	rand bit direction;
	rand bit mode;
    rand logic [5:0] datain;
    logic [5:0] dataout;

    function new (string name = "shift_reg_item");
    	super.new(name);
    	
    endfunction 
    function string convert2string();
    	return $sformatf("%s , serial_in =%0b , direction =%0b , mode =%0b , datain=%0b , dataout=%0b",super.convert2string ,serial_in,direction,mode,datain,dataout  );
    endfunction 
    function string convert2string_stimulus();
    	return $sformatf(" serial_in =%0b , direction =%0b , mode =%0b , datain=%0b ",serial_in,direction,mode,datain);
    	
    endfunction 
endclass 
endpackage 
