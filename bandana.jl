

module Bandana


include("paisley.jl")

using .Paisley


function entryway(args...)

  local epoch = strftime("h%s", time())

  local attune = "guitar"

  local layout = eadgbe


  function fabric(yarn::String="z0")
    try
      local seal = symbol(yarn)
      if sentinel(yarn) && haskey(codex, seal)
        local diadem = "$attune-$yarn-$epoch"
        local specie = layout(seal)
        println("\n\t", diadem)
        for course in specie
          println("\t", course)
        end
      else
        println("\n\t", yarn, '?')
      end 
    catch anomaly
      println("\ncause $anomaly")
    end
  end


  function atrium(cargo::Array)
    for yarn in cargo
      fabric(yarn)
    end
  end


  function gamut()
    local art = collect(keys(codex))
    sort!(art)
    for its in art
      fabric(string(its))
    end
  end 


  local argots = String[]

  for word in collect(args)
    push!(argots, lowercase(word))
  end

  local dexter = length(argots)

  if dexter > 0
    local orchid = argots[1]

    if dexter == 1
      fabric(orchid)

    elseif dexter > 1

      if orchid == "aug4th" ||
         orchid == "a4" ||
         orchid == "b5" ||
         orchid == "dim5th" ||
         ismatch(r"^(bf)+b?$", orchid) ||
         ismatch(r"^triton[ae]?[ls]?$", orchid)
        attune, layout = orchid, bfbfb
        shift!(argots)

      elseif orchid == "cello" ||
             orchid == "p5" ||
             ismatch(r"^.*gda.*$", orchid) ||
             ismatch(r"^mando.*", orchid) ||
             ismatch(r"^viol.*", orchid)
        attune, layout = orchid, cgdae
        shift!(argots)

      elseif orchid == "gtr" ||
             ismatch(r"^g.*it.*r$", orchid) ||
             ismatch(r"^.*dgbe.*$", orchid) ||
             ismatch(r"^.*gcea.*$", orchid) ||
             ismatch(r"^uk[ue](le)*$", orchid)
        attune, layout = orchid, eadgbe
        shift!(argots)

      elseif orchid == "fkbjdn" ||
             orchid == "maj3rd" ||
             orchid == "m3"
        attune, layout = orchid, fkbjdn
        shift!(argots)

      elseif orchid == "bass" ||
             orchid == "dragon" ||
             orchid == "p4" ||
             ismatch(r"^dra[cg]o.*$", orchid) ||
             ismatch(r"^.*eadg.*$", orchid)
        attune, layout = orchid, dragon
        shift!(argots)

      else
        nothing
      end

      local cargo = copy(argots)

      local head = first(cargo)

      head == "every" ||
      head == "gamut" ? gamut() : atrium(cargo)
    end

  else
    catalog()
  end

end


if length(ARGS) > 0
  entryway(ARGS...)
else
  entryway()
end

println()


end # module


