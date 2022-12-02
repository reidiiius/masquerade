

module Paisley

include("shelves.jl")

using .Shelves

export bfbfb,
       catalog,
       cgdae,
       codex,
       dragon,
       eadgbe,
       epoch,
       erase!,
       fkbjdn,
       place!,
       sentinel,
       tacit,
       unison


function bounds(span::Int)
  35 < span < 61
end


function tacit()
  local mute = repeat("__ ", 12)
  bounds(length(mute)) ? mute : "Check tacit"
end


function sentinel(yarn::String)
  local rex = r"^([jknz]+\d+)+([lm]\d+)?[o-z]*$"
  occursin(rex, lowercase(yarn))
end


function erase!(yarn::String)
  local seal = Symbol(lowercase(yarn))

  if haskey(codex, seal)
    delete!(codex, seal)
  end

  return nothing
end


function place!(yarn::String, wire::String)
  if sentinel(yarn) && isascii(wire)
    local seal = Symbol(lowercase(yarn))
    local span = length(wire)

    if bounds(span)
      codex[seal] = wire
    elseif isless(span, 36)
      println("\n\tSize: $span? $wire")
    else
      println("\n\tSize: $span?")
    end

  elseif sentinel(yarn)
    println("\n\tASCII? $wire")
  else
    println("\n\t$yarn ?")
  end

  return nothing
end

try
  place!("z0", tacit())
catch anomaly
  write(stderr::IO, "Cause: ", anomaly, "\n")
end


function catalog()
  local art = collect(keys(codex))
  sort!(art)
  local columns = 7
  let nth = 1
    println()
    for (nth, its) in enumerate(art)
      print("\t", its)
      if ==(nth % columns, 0)
        println()
      end
    end
    if !=(nth % columns, 0)
      println()
    end
  end
end


function transmute!(cord::String)
  local span = length(cord)
  let line = SubString(cord, 1:span)
    if trust
      for (old, new) in duets
        line = replace(line, old => new)
      end
    end
    return line
  end
end


function pitch(seal::Symbol, nth::Int)
  try
    local wire = get(codex, seal, tacit())
    if bounds(length(wire))
      local cord = string(wire[nth:end], wire[1:nth + 1])
      if latch
        return transmute!(cord)
      else
        return cord
      end
    else
      return tacit()
    end
  catch anomaly
    println("\nCause $anomaly")
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


function unison(seal)
  local cn = hermit(seal)
  (cn, cn)
end


function bfbfb(seal)
  local fn = saturn(seal)
  local bn = vulcan(seal)
  (bn, fn, bn, fn, bn)
end


function cgdae(seal)
  copper(seal),
  silver(seal),
  jovian(seal),
  helios(seal),
  hermit(seal)
end


function eadgbe(seal)
  local ingot = copper(seal)
  ingot,
  vulcan(seal),
  helios(seal),
  jovian(seal),
  silver(seal),
  ingot
end


function fkbjdn(seal)
  local dn = jovian(seal)
  local fk = gemini(seal)
  local bj = aquari(seal)
  local rows = (fk, bj, dn, fk, bj, dn)
  reverse(rows)
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


end # Paisley

