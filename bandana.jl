

module Bandana


include("paisley.jl")

using .Paisley


epoch = strftime("h%s", time())

attune, layout = "guitar", eadgbe


function sentinel(seal)
  ismatch(r"^([jknz]\d+)+([lm]\d+)?([o-z]{2})?$", seal)
end


function fabric(seal="z0")
  try
    if sentinel(seal) && haskey(codex, seal)
      diadem = "$attune-$seal-$epoch"
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


function atrium(cargo)
  for seal in cargo
    fabric(seal)
  end
  println()
end


argots = collect(ARGS)

dexter = length(argots)

if dexter > 0
  orchid = argots[1]

  if dexter == 1
    fabric(orchid)
    println()

  elseif dexter > 1

    if orchid == "aug4th" ||
       orchid == "a4" ||
       ismatch(r"^(bf)+b?$", orchid) ||
       orchid == "b5"
      attune, layout = orchid, bfbfb
      shift!(argots)

    elseif orchid == "cello" ||
           ismatch(r"^.*gda.*$", orchid) ||
           ismatch(r"^mando.*", orchid) ||
           orchid == "p5" ||
           ismatch(r"^viol.*", orchid)
      attune, layout = orchid, cgdae
      shift!(argots)

    elseif ismatch(r"^.*dgbe.*$", orchid) ||
           ismatch(r"^.*gcea.*$", orchid) ||
           ismatch(r"^g.*it.*r$", orchid) ||
           orchid == "gtr" ||
           ismatch(r"^uk[ue](le)*$", orchid)
      attune, layout = orchid, eadgbe
      shift!(argots)

    elseif orchid == "fkbjdn" ||
           orchid == "maj3rd" ||
           orchid == "m3"
      attune, layout = orchid, fkbjdn
      shift!(argots)

    elseif orchid == "bass" ||
           ismatch(r"^.*eadg.*$", orchid) ||
           orchid == "p4"
      attune, layout = orchid, dragon
      shift!(argots)

    else
      nothing
    end

    cargo = collect(argots)
    atrium(cargo)
  end

else
  catalog()
  println()
end


end # module


