
module ConjectureType

export LinearConjecture
export conj_string
export conj_println
export inequality
export get_expression

mutable struct LinearConjecture
    target
    other
    direction
    m
    b
    hypothesis_properties
    touch_number
    objects
    object_type
end

function conj_string(conj)
    if conj.hypothesis_properties == [conj.object_type]
        if conj.m == 1//1
            if conj.b == 0
                return "If X is a $(conj.object_type), then $(conj.target)(X) $(conj.direction) $(conj.other)(X)."
            else
                return "'If X is a $(conj.object_type), then $(conj.target)(X) $(conj.direction) $(conj.other)(X) + $(conj.b)."
            end
        else
            if conj.b == 0
                return "If X is a $(conj.object_type), then $(conj.target)(X) $(conj.direction) $(conj.m)*$(conj.other)(X)."
            else
                return "If X is a $(conj.object_type), then $(conj.target)(X) $(conj.direction) $(conj.m)*$(conj.other)(X) + $(conj.b)."
            end
        end
    elseif length(conj.hypothesis_properties) == 1
        if conj.m == 1//1
            if conj.b == 0
                return "If X is a $(conj.object_type) and is $(conj.hypothesis_properties[1]), then $(conj.target)(X) $(conj.direction) $(conj.other)(X)."
            else
                return "If X is a $(conj.object_type) and is $(conj.hypothesis_properties[1]), then $(conj.target)(X) $(conj.direction) $(conj.other)(X) + $(conj.b)."
            end
        else
            if conj.b == 0
                return "If X is a $(conj.object_type) and is $(conj.hypothesis_properties[1]), then $(conj.target)(X) $(conj.direction) $(conj.m)*$(conj.other)(X)."
            else
                return "If X is a $(conj.object_type) and is $(conj.hypothesis_properties[1]), then $(conj.target)(X) $(conj.direction) $(conj.m)*$(conj.other)(X) + $(conj.b)."
            end
        end
    elseif length(conj.hypothesis_properties) == 2
        if conj.m == 1//1 
            if conj.b == 0
                return "If X is a $(conj.object_type), and is $(conj.hypothesis_properties[1]), and $(conj.hypothesis_properties[2]), then $(conj.target)(X) $(conj.direction) $(conj.other)."
            else
                return "If X is a $(conj.object_type), and is $(conj.hypothesis_properties[1]), and $(conj.hypothesis_properties[2]), then $(conj.target)(X) $(conj.direction) $(conj.other)(X) + $(conj.b)."
            end
        else
            if conj.b == 0
                return "If X is a $(conj.object_type), and is $(conj.hypothesis_properties[1]), and $(conj.hypothesis_properties[2]), then $(conj.target)(X) $(conj.direction) $(conj.m)*$(conj.other)(X)."
            else
                return "If X is a $(conj.object_type), and is $(conj.hypothesis_properties[1]), and $(conj.hypothesis_properties[2]), then $(conj.target)(X) $(conj.direction) $(conj.m)*$(conj.other)(X) + $(conj.b)."
            end
        end
    end
end


function conj_println(conj)
    println(conj_string(conj))
end


function inequality(conj)
    return [conj.target, conj.direction, conj.m, conj.other, conj.b]
end
    
function get_expression(conj)
    return "$(conj.target)(X) $(conj.direction) $(conj.m)*$(conj.other)(X) + $(conj.b)"
end
    

end