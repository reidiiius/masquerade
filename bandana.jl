

module Bandana


include("paisley.jl")

using .Paisley


function entryway(args...)

  local epoch = strftime("h%s", time())

  local attune = "guitar"

  local layout = eadgbe


  function sentinel(seal::String)
    ismatch(r"^([jknz]+\d+)+([lm]\d+)?[o-z]*$", seal)
  end


  function fabric(seal::String="z0")
    try
      if sentinel(seal) && haskey(codex, seal)
        local diadem = "$attune-$seal-$epoch"
        println("\n\t", diadem)
        for course in layout(seal)
          println("\t", course)
        end
      else
        println("\n\t", seal, '?')
      end 
    catch anomaly
      println("\ncause $anomaly")
    end
  end


  function atrium(cargo::Array)
    for seal in cargo
      fabric(seal)
    end
  end


  local argots = copy(collect(args))

  local dexter = length(argots)

  if dexter > 0
    local orchid = argots[1]

    if dexter == 1
      fabric(orchid)
      println()

    elseif dexter > 1

      if orchid == "aug4th" ||
         orchid == "a4" ||
         orchid == "b5" ||
         ismatch(r"^(bf)+b?$", orchid)
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
             orchid == "p4" ||
             ismatch(r"^.*eadg.*$", orchid)
        attune, layout = orchid, dragon
        shift!(argots)

      else
        nothing
      end

      local cargo = copy(argots)
      atrium(cargo)
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


