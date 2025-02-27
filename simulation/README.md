# How to run

## Enabling environment variables

To be able to run Modelsim, you must activate the path using the script.

On `zxp007` (CAD server), you can:



```
source /home/share/cad_sh/vsim.sh
```

Now, the command `vsim` can be executed

## Makefile

To run the simulation using Makefile, you can check [Makefile](Makefile) to see the option.

## Run GUI

There are two files:

- sim_Verilog.do: script for RTL simulation of Verilog code
- sim_VHDL.do: script for RTL simulation of VHDL code

To run it, we first need to open Modelsim:

```
vsim
```

In the `transcript` box, type:

```
do <script-name>.do
```

where `<script-name>` is the name of the script
