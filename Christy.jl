module Christy

export write_to_me
export surprise_me

using DataFrames
using CSV
using OhMyREPL

# Import CoreFunctions module
include("core_functions.jl")

# Import ConjectureType module 
include("conjecture_type.jl")

function write_to_me(target::String; 
                    conj_lims = 1:50, 
                    file_name = "data.csv",
                    object_type = "connected graph")
    # Read invariant data from csv 
    data = CSV.File(file_name)

    # Convert data to a DataFrame type 
    data = DataFrames.DataFrame(data)

    # Collect property names from the DataFrame
    properties = CoreFunctions.get_properties(data)

    # Collect invariant names from the DataFrame
    invariants = CoreFunctions.get_invariants(data)

    # Specific properties of interest to graph theory
    custum_properties = [
              ["regular", "not_K_n"],
              ["cubic", "not_K_n"],
              ["sub_cubic", "not_K_n"],
              ["cubic", "claw_free"],
              ["cubic", "triangle_free"],
              ["regular", "claw_free"],
             ]

    # Add optional custom properties
    for prop in custum_properties
        push!(properties, prop)
    end

    conjs = CoreFunctions.make_conjectures(data, [target], invariants, properties, object_type)
    conjs = CoreFunctions.filter(conjs)

    println()
    println("Do these surprise you? 💙💙 \n")
    for i in conj_lims
        println("Conjecture $(i). ",  ConjectureType.conj_string(conjs[i]))
        println("touch number = $(conjs[i].touch_number) \n")
    end


end

function surprise_me(; conj_lims = 1:50, file_name = "data.csv")
    # Read invariant data from csv 
    data = CSV.File(file_name)

    # Convert data to a DataFrame type 
    data = DataFrames.DataFrame(data)

    # Collect property names from the DataFrame
    properties = CoreFunctions.get_properties(data)

    # Collect invariant names from the DataFrame
    invariants = CoreFunctions.get_invariants(data)

    # Specific properties of interest to graph theory
    custum_properties = [
              ["regular", "not_K_n"],
              ["cubic", "not_K_n"],
              ["sub_cubic", "not_K_n"],
              ["cubic", "claw_free"],
              ["cubic", "triangle_free"],
              ["regular", "claw_free"],
             ]

    # Add optional custom properties
    for prop in custum_properties
        push!(properties, prop)
    end

    # Find random invariant to conjecture on
    i = rand(1:length(invariants))
    target = invariants[i]
    conjs = CoreFunctions.make_conjectures(data, [target], invariants, properties, "connected_graph")
    conjs = CoreFunctions.filter(conjs)

    println()
    println("What do you think about these? 💙💙 \n")
    for i in conj_lims
        println("Conjecture $(i). ",  ConjectureType.conj_string(conjs[i]))
        println("touch number = $(conjs[i].touch_number) \n")
    end
end



end