# How to run

## Enabling environment variables

To be able to run Modelsim, you must activate the path using the script.

On `zxp007` (CAD server), you can:

```
source /home/share/cad_sh/cad.sh
```

Now, the command `genus` can be executed.



## Makefile

To run the simulation using Makefile, you can check [Makefile](Makefile) to see the option.

## Run it manually

First, run Cadence Genus

```
genus -legacy_ui -no_gui -execute
```

When the genus terminal shows up, type

```
source decoder110.tcl
```
