

module Paisley

export bfbfb, catalog, cgdae, codex, dragon, eadgbe, fkbjdn, place


include("shelves.jl")

using .Shelves


function tacit()
  repeat("__ ", 12)
end


function place(seal, specie)
  span = length(specie)
  if span >= 36
    codex[seal] = specie
  else
    println("\n\t$span? $specie")
  end
end

place("z0", tacit())
place("n0yy", "vr __ tt __ rv wq __ us yy su __ qw ")

place("k6yz", "vs __ tu __ rw wr __ ut yz __ oq qo ")
place("j5zy", "wr __ ut __ sv oq qo __ zy tu __ rw ")

place("j6so", "vu __ tw __ rx wt __ uv yq so __ qy ")
place("k5os", "xr __ wt __ uv yq __ os qy vu __ tw ")

place("j2xs", "vv zq __ xs ry wu __ uw __ sx __ qz ")
place("k2sx", "yr sx __ qz vv zq __ xs __ wu __ uw ")


function catalog()
  try
    art = collect(keys(codex))
    sort!(art)
    nth = 1
    println()
    for its in art
      print("\t", its)
      if nth % 7 == 0
        print("\n")
      end
      nth += 1
    end
  catch anomaly
    println("\ncause $anomaly")
  end
end


function pitch(seal, nth)
  try
    specie = get(codex, seal, tacit())
    specie[nth:end] * specie[1:nth+1]
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


function bfbfb(seal)
  vulcan(seal),
  saturn(seal),
  vulcan(seal),
  saturn(seal),
  vulcan(seal)
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


function fkbjdn(seal)
  jovian(seal),
  aquari(seal),
  gemini(seal),
  jovian(seal),
  aquari(seal),
  gemini(seal)
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


end # module


