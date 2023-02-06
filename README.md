# FPGA-QOS
Quality of Service and VGA Display Module Implementation on FPGA with Verilog HDL

This Verilog HDL code used in a project for a Quality of Service machine that works with first in first out algorithm. The machine has been designed to be implemented on the Terasic DE1-SoC FPGA Board.

The Quality of Service machine has 4 buffers that has different reliability and speed requirements for each buffers. While the speed requirement is Bf1 > Bf2 > Bf3 > Bf4, reliability requirement for the buffers are Bf4 > Bf3 > Bf2 > Bf1. Explanation of this sequence can be summed up as if all buffers have empty space, then the data in Bf1 should be read first. If one of the other buffers close to be full, then that buffer should be read while holding the reliability requirement.

The system has a read function aswell. By default, read is automatically takes the data from buffers every 3 seconds. This can be changed by altering the concerning code.

Also there is a ready to use VGA Display configuration for the machine. These configuration shows the buffers, buffer contents, read function, total data, transmitted data, dropped data. One can use the VGA Display module for other projects by getting hashcodes of the images that wanted to be shown on the screen.
