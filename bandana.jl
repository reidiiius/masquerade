

module Bandana


include("harlequin.jl")


function tacit()
  repeat("__ ", 12)
end


function populate(seal, specie)
  try
    span = length(specie)
    if span >= 36
      Harlequin.krewe[seal] = specie
    else
      println("\n\t$span? $specie")
    end
  catch anomaly
    println("\ncause $anomaly")
  end
end

populate("z0", tacit())


function catalog()
  try
    i = 1
    println()
    for k in keys(Harlequin.krewe)
      print("\t", k)
      if i % 7 == 0
        print("\n")
      end
      i += 1
    end
  catch anomaly
    println("\ncause $anomaly")
  end
end


function pitch(seal, ndx)
  try
    specie = get(Harlequin.krewe, seal, tacit())
    specie[ndx:end] * specie[1:ndx+1]
  catch anomaly
    println("\ncause $anomaly")
  end
end


function hermit(seal)
  pitch(seal, 1)
end


function jovian(seal)
  pitch(seal, 7)
end


function copper(seal)
  pitch(seal, 13)
end


function saturn(seal)
  pitch(seal, 16)
end


function gemini(seal)
  pitch(seal, 19)
end


function helios(seal)
  pitch(seal, 22)
end


function silver(seal)
  pitch(seal, 28)
end


function aquari(seal)
  pitch(seal, 31)
end


function vulcan(seal)
  pitch(seal, 34)
end


function cgdae(seal)
  copper(seal),
  silver(seal),
  jovian(seal),
  helios(seal),
  hermit(seal)
end


function eadgbe(seal)
  copper(seal),
  vulcan(seal),
  helios(seal),
  jovian(seal),
  silver(seal),
  copper(seal)
end


function dragon(seal)
  aquari(seal),
  saturn(seal),
  hermit(seal),
  helios(seal),
  jovian(seal),
  silver(seal),
  copper(seal),
  vulcan(seal),
  gemini(seal)
end


epoch = strftime("-h%s", time())


function fabric(seal="z0")
  if haskey(Harlequin.krewe, seal)
    try
      println("\n\tguitar-", seal, epoch)
      for course in eadgbe(seal)
        println("\t", course)
      end
    catch anomaly
      println("\ncause $anomaly")
    end
  else
    println("\n\t", seal, '?')
  end 
end


if length(ARGS) > 0
  for seal in ARGS
    try
      fabric(seal)
    catch anomaly
      println("\ncause $anomaly")
    end
  end
  println()
else
  catalog()
  println()
end


end # module


