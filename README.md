# Christy.jl

Christy.jl is general automated conjecturing package currently in development that gives users the ability to produce conjectured relationships between invariants on a given type of mathematical object. To make conjectures you will need a ```data.csv``` file of precomputed invariant (and boolean data if you wish) data. The columns of ```data.csv``` should the names of the invariants, names of the boolean properties, and exactly one column called "name" containing the names of each instance of the objects. Thus, the rows of ```data.csv``` are the instances of your objects. An example ```data.csv``` file containing connected graph data is included with Christy.jl

There are two modes for conjecturing with Christy.jl

1. Mi Amor
2. Package


To run the Mi Amor mode, which essentially calls the functions and modules of Christy.jl as a single Julia script, clone this repository in a directory of your choice. Then open the terminal and run:

```julia --project mi_amor.jl```

This will prompt the user to enter a number associated with a invariant that Mi Amor will conjecture on. 

To use Christy.jl as a package (in its current form), clone this repository into a directory of your choice. Then open the Julia REPL, and include ```Christy.jl``` with:

```Julia
include("Christy.jl")
```

This will give you access to two functions, ```Christy.surprise_me()``` and ```Christy.write_to_me(target_invariant_name)``` in your current Julia REPL session. For example, 

```Julia
Christy.write_to_me("matching_number")
```

will conjecture on the matching number invariant column in the provided ```data.csv``` file. 