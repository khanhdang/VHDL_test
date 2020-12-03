VHDL Test  for 2021I_ELT2041_23 @ VNU-UET
========

This repo consists of a Moore FSM code for detecting "110" written in VHDL.
Simulation script using ModelSim is include
Synthesis (using Cadence Genus) and layout using (Cadence Innous) scripts and results are included.

prerequisite
-------------

- Modelsim
- Cadence Genus
- Cadence Innovus
- Nangate 45nm library

RTL code
--------

The register transfer level code of a FSM is decoder110.vhd on the ```rtl``` folder.

Simulation
---------

To simulate, open ModelSim and change the directory to the ```simulation``` folder.
Run ```do sim.do``` to run.

Synthesis
---------

Open Cadence Genus. Change to the ```synthesis``` folder

``` source decoder110.tcl```

Reports and outputs can be founded in the ```synthesis``` folder.



Place and router
---------

Open Cadence Innovus. Change to the ```place-and-route``` folder

``` source decoder110.tcl```

Reports and outputs can be founded in the ```place-and-route``` folder.



Result
---------

#### Timing

Period: 2.4 ns
Arrival at 1.379 ns
Slack: 1.021 ns
Result: passed timing

#### Area

9 gates.
2 DFFs => 4 states for S0, S1, S2, and S3
State moves steadily => 1 Half adder is used

#### Layout

Only ultilze 60%

The final layout for NANGATE 45nm 

![alt text](place-and-route/layout/ss_.place.gif "Layout")

Contact
------

Course website: https://courses.uet.vnu.edu.vn/course/view.php?id=5856

VNU Unviversity of Engineering and Technology
Digital Electronics: 2021I_ELT2041_23

khanh.n.dang@vnu.edu.vn