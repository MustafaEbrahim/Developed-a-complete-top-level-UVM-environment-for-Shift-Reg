package monitor_pkg;
	import uvm_pkg::*;
	import shift_reg_seq_item_pkg::*;
`include "uvm_macros.svh" // Import UVM macros
class shift_reg_monitor extends  uvm_monitor ;
	`uvm_component_utils(shift_reg_monitor)
	virtual shift_reg_if shift_reg_monitor_vif;
	shift_reg_item rsp_seq_item ;
	uvm_analysis_port # (shift_reg_item) mon_ap;

	function new (string name = "shift_reg_monitor",uvm_component parent = null);
		super.new(name ,parent);
		
	endfunction 
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		mon_ap =new("mon_ap" ,this);
		
	endfunction 
	task run_phase(uvm_phase phase);
		super.run_phase (phase);
		forever begin
			rsp_seq_item = shift_reg_item::type_id::create("rsp_seq_item");
			#2
			rsp_seq_item.serial_in = shift_reg_monitor_vif.serial_in ; 
			rsp_seq_item.mode      = shift_reg_monitor_vif.mode;
			// rsp_seq_item.reset     = shift_reg_monitor_vif.reset ;
			rsp_seq_item.datain    = shift_reg_monitor_vif.datain ;
			rsp_seq_item.direction = shift_reg_monitor_vif.direction ;
			rsp_seq_item.dataout   = shift_reg_monitor_vif.dataout ;
			mon_ap.write(rsp_seq_item);
			`uvm_info("run_phase",rsp_seq_item.convert2string(),UVM_HIGH )
		end
		
	endtask : run_phase
endclass 
endpackage 