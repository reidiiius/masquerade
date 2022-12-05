
module Paisley

include("shelves.jl")

export bfbfb,
       catalog,
       cgdae,
       dragon,
       eadgbe,
       fkbjdn,
       sentinel,
       tacit,
       unison


function bounds(span::Int)
  35 < span < 61
end


function tacit()
  local mute::String = repeat("__ ", 12)
  bounds(length(mute)) ? mute : "Check tacit"
end


function sentinel(yarn::String)
  local rex::Regex = r"^([ijkn]+\d+)+([lm]\d+)?[o-z]*$"
  occursin(rex, lowercase(yarn))
end


function catalog(things::Vector{Symbol})
  try
    local sorted::Vector{Symbol} = sort(things)
    local columns::UInt8 = 7
    let nth = 1
      println()
      for (nth, its) in enumerate(sorted)
        print("\t", its)
        if ==(nth % columns, 0)
          println()
        end
      end
      if !=(nth % columns, 0)
        println()
      end
    end
  catch anomaly
    @warn anomaly
  end
end


function transmute!(cord::String)
  local span::UInt8 = length(cord)
  let line = SubString(cord, 1:span)
    if Shelves.trust
      for (old, new) in Shelves.duets
        line = replace(line, old => new)
      end
    end
    return line
  end
end


function pitch(seal::Symbol, nth::Int)
  try
    local wire::String = get(Shelves.codex, seal, tacit())
    if bounds(length(wire))
      local cord::String = string(wire[nth:end], wire[1:nth + 1])
      if Shelves.latch
        return transmute!(cord)
      else
        return cord
      end
    else
      return tacit()
    end
  catch anomaly
    @warn anomaly
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
  local ingot = hermit(seal)
  (ingot, ingot)
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

