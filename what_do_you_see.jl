using FIGlet
using CSV
using DataFrames

# Import CoreFunctions module
include("core_functions.jl")

# Import ConjectureType module 
include("conjecture_type.jl")

# Place custom properties in this Array
custum_properties = [
              ["regular", "not_K_n"],
              ["cubic", "not_K_n"],
              ["sub_cubic", "not_K_n"],
              ["cubic", "claw_free"],
              ["cubic", "triangle_free"],
              ["regular", "claw_free"],
             ]

# Read invariant data from csv 
data = CSV.File("data.csv")

# Convert data to a DataFrame type 
data = DataFrames.DataFrame(data)

# Collect property names from the DataFrame
properties = CoreFunctions.get_properties(data)

# Collect invariant names from the DataFrame
invariants = CoreFunctions.get_invariants(data)

# Add optional custom properties
for prop in custum_properties
    push!(properties, prop)
end



FIGlet.render("Christy.jl", "slant")
println("-----------------------------------------------")
println("Version  0.01")
println("Copyright 2022 Randy Davila")
println("-----------------------------------------------")
println()

function Input(prompt)
    print(prompt)
    println()
    readline()
end

for (i, invariant) in enumerate(invariants)
    println("$(i). $(invariant)")
end
println()
n = Input("Enter the number of the target invariant: ")
n = parse(Int64, n)
println("Target Invariant: $(invariants[n]).")

conjs = CoreFunctions.make_conjectures(data, [invariants[n]], invariants, properties, "connected_graph")
conjs = CoreFunctions.filter(conjs)

FIGlet.render("Christy.jl", "slant")
println("-----------------------------------------------")
println("Version  0.01")
println("Copyright 2022 Randy Davila")
println("-----------------------------------------------")
println()

println("CONJECTURES: \n")
for i in 1:50
    println("Conjecture $(i). ",  ConjectureType.conj_string(conjs[i]))
    println("touch number = $(conjs[i].touch_number) \n")
end