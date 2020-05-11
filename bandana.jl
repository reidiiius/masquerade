

include("harlequin.jl")


function tacit()
  repeat("__ ", 12)
end


function populate(sgn, specie)
  try
    span = length(specie)
    if span >= 36
      krewe[sgn] = specie
    else
      println("\n\t$span? $specie")
    end
  catch anomaly
    println("\ncause $anomaly")
  end
end

populate("z0", tacit())


function menu()
  try
    i = 1
    println()
    for k in keys(krewe)
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


function octavia(sgn, ndx)
  try
    specie = get(krewe, sgn, tacit())
    specie[ndx:end] * specie[1:ndx+1]
  catch anomaly
    println("\ncause $anomaly")
  end
end


function hermit(sgn)
  octavia(sgn, 1)
end


function jovian(sgn)
  octavia(sgn, 7)
end


function copper(sgn)
  octavia(sgn, 13)
end


function saturn(sgn)
  octavia(sgn, 16)
end


function gemini(sgn)
  octavia(sgn, 19)
end


function helios(sgn)
  octavia(sgn, 22)
end


function silver(sgn)
  octavia(sgn, 28)
end


function aquari(sgn)
  octavia(sgn, 31)
end


function vulcan(sgn)
  octavia(sgn, 34)
end


function cgdae(sgn)
  copper(sgn),
  silver(sgn),
  jovian(sgn),
  helios(sgn),
  hermit(sgn)
end


function eadgbe(sgn)
  copper(sgn),
  vulcan(sgn),
  helios(sgn),
  jovian(sgn),
  silver(sgn),
  copper(sgn)
end


function ennead(sgn)
  aquari(sgn),
  saturn(sgn),
  hermit(sgn),
  helios(sgn),
  jovian(sgn),
  silver(sgn),
  copper(sgn),
  vulcan(sgn),
  gemini(sgn)
end


function horus()
  strftime("%s", time())
end


function layout(sgn, tuned, epoch)
  println("\n\t", sgn, "-h", epoch)
  for str in tuned
    println("\t", str)
  end
end


function view(sgn="n0")
  tuner = eadgbe
  if haskey(krewe, sgn)
    try
      layout(sgn, tuner(sgn), horus())
    catch anomaly
      println("\ncause $anomaly")
    end
  else
    println("\n\t", sgn, '?')
  end 
end


if length(ARGS) > 0
  for sgn in ARGS
    try
      view(sgn)
    catch anomaly
      println("\ncause $anomaly")
    end
  end
  println()
else
  menu()
  println()
end


