Naming convention for timing annotation files
Convention follows the VPR architecture file naming convention, with some extra detail appended to the end.

k<lut_size>: Look-Up Table (LUT) size of FPGA. If you have fracturable LUTs or multiple LUT circuits, this should be largest input size.
The keyword 'frac' is to specify if fracturable LUT is used or not.
The keyword 'Native' is to specify if fracturable LUT design is a native one (without mode switch) or a standard one (with mode switch).
N<le_size>: Number of logic elements for a CLB. If you have multiple CLB architectures, this should be largest number.
tileable: If the routing architecture is tileable or not.
The keyword 'IO' specifies if the I/O tile is tileable or not
fracdff: Use multi-mode DFF model, where reset/set/clock polarity is configurable
adder_chain: If hard adder/carry chain is used inside CLBs
register_chain: If shift register chain is used inside CLBs
scan_chain: If scan chain testing infrastructure is used inside CLBs
__mem<mem_size>: If block RAM (BRAM) is used or not. If used, the memory size should be clarified here. The keyword 'wide' is to specify if the BRAM spans more than 1 column. The keyword 'frac' is to specify if the BRAM is fracturable to operate in different modes.
__dsp<dsp_size>: If Digital Signal Processor (DSP) is used or not. If used, the input size should be clarified here. The keyword 'wide' is to specify if the DSP spans more than 1 column. The keyword 'frac' is to specify if the DSP is fracturable to operate in different modes.
aib: If the Advanced Interface Bus (AIB) is used in place of some I/Os.
multi_io_capacity: If I/O capacity is different on each side of FPGAs.
reduced_io: If I/Os only appear a certain or multiple sides of FPGAs
registerable_io: If I/Os are registerable (can be either combinational or sequential)
<feature_size>: The technology node which the delay numbers are extracted from.
TileOrgz: How tile is organized.
Top-left (Tl): the pins of a tile are placed on the top side and left side only
Top-right (Tr): the pins of a tile are placed on the top side and right side only
Bottom-right (Br): the pins of a tile are placed on the bottom side and right side only
GlobalTileClk: How many clocks are defined through global ports from physical tiles. is the number of clocks
Other features are used in naming should be listed here.

