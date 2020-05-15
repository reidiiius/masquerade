

module Bandana


include("paisley.jl")

using .Paisley


epoch = strftime("h%s", time())

attune, layout = "guitar", eadgbe


function fabric(seal="z0")
  try
    if haskey(codex, seal)
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


if length(argots) > 0
  orchid = argots[1]

  if orchid == "aug4th" ||
     orchid == "bfbfb" ||
     orchid == "b5"
    attune, layout = orchid, bfbfb
    shift!(argots)

  elseif orchid == "cello" ||
         orchid == "cgdae" ||
         orchid == "p5"
    attune, layout = orchid, cgdae
    shift!(argots)

  elseif orchid == "eadgbe" ||
         orchid == "guitar" ||
         orchid == "gtr"
    attune, layout = orchid, eadgbe
    shift!(argots)

  elseif orchid == "fkbjdn" ||
         orchid == "maj3rd" ||
         orchid == "m3"
    attune, layout = orchid, fkbjdn
    shift!(argots)

  elseif orchid == "bass" ||
         orchid == "beadg" ||
         orchid == "eadgc" ||
         orchid == "eadg" ||
         orchid == "p4"
    attune, layout = orchid, dragon
    shift!(argots)

  else
    false # default
  end

  cargo = collect(argots)
  atrium(cargo)
else
  catalog()
  println()
end


end # module


