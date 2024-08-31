package sequencer_pkg;
import uvm_pkg::*;
import shift_reg_seq_item_pkg::*;

	`include "uvm_macros.svh" // Import UVM macros
class Mysequencer extends uvm_sequencer #(shift_reg_item);
	`uvm_component_utils(Mysequencer)
	function  new(string name = "Mysequencer",uvm_component parent = null);
		super.new(name,parent);
		
	endfunction 
endclass  
endpackage 
