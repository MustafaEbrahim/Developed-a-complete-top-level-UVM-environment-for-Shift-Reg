package shift_reg_driver_pkg;
import uvm_pkg::*; // Import the UVM package
import shift_reg_config_pkg::*;
import shift_reg_seq_item_pkg::*;
import sequencer_pkg::*;

`include "uvm_macros.svh" // Import UVM macros

class shift_reg_driver extends uvm_driver #(shift_reg_item);
    `uvm_component_utils(shift_reg_driver)

    virtual shift_reg_if shift_reg_driver_vif;
    shift_reg_config shift_reg_config_obj_driver ;
    shift_reg_item stim_seq_item ;

    function new(string name = "shift_reg_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(shift_reg_config)::get(this, "", "CFG", shift_reg_config_obj_driver))begin
            `uvm_fatal("Driver", "Virtual interface not found")
        end
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        shift_reg_driver_vif = shift_reg_config_obj_driver.shift_reg_config_vif ;
    endfunction 

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        forever begin
            stim_seq_item = shift_reg_item::type_id::create("stim_seq_item");
            seq_item_port.get_next_item(stim_seq_item);
    	    // shift_reg_driver_vif.reset=stim_seq_item.reset ;
	    	shift_reg_driver_vif.serial_in=stim_seq_item.serial_in ;
	    	shift_reg_driver_vif.direction=stim_seq_item.direction ;
	    	shift_reg_driver_vif.mode = stim_seq_item.mode ;
	    	shift_reg_driver_vif.datain = stim_seq_item.datain ;
            #2
            seq_item_port.item_done();
            `uvm_info("run_phase",stim_seq_item.convert2string_stimulus(),UVM_HIGH)
        end
    endtask
endclass

endpackage