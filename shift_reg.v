////////////////////////////////////////////////////////////////////////////////
// Author: Kareem Waseem
// Course: Digital Verification using SV & UVM
//
// Description: Shift register Design 
// 
////////////////////////////////////////////////////////////////////////////////
module shift_reg ( serial_in, direction, mode, datain, dataout);
input  serial_in, direction, mode;
input [5:0] datain;
output reg [5:0] dataout;

   initial begin
      if (mode) begin//rotate
            if (direction) // left
            dataout <= {datain[4:0], datain[5]};
         else
            dataout <= {datain[0], datain[5:1]};
         end
      else begin //shift
         if (direction) // left
            dataout <= {datain[4:0], serial_in};
         else
            dataout <= {serial_in, datain[5:1]};
      end
   end
endmodule