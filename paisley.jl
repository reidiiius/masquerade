
module Paisley

include("shelves.jl")


"Integer within range?"
function bounds(span::Int)
  local bin::Bool = (35 < span < 61)

  return bin
end


"Default string."
function tacit()
  local mute::String = repeat("__ ", 12)

  return mute
end


"Validate key signature."
function sentinel(yarn::String)
  local rex::Regex = r"^([ijkn]+\d+)+([lm]\d+)?[o-z]*$"
  local bin::Bool = occursin(rex, lowercase(yarn))

  return bin
end


"Format and print menu of signatures."
function catalog(things::Vector{Symbol})
  local sorted::Vector{Symbol} = sort(things)
  local cycles::UInt16 = 0
  local column::UInt16 = 7

  println()
  for (numb::UInt16, sign::Symbol) in enumerate(sorted)
    if numb % column == 0
      print(string("\t", sign, "\n"))
    else
      print(string("\t", sign))
    end

    cycles = numb
  end

  if cycles % column != 0
    println()
  end

  return nothing
end


"Replacement of characters."
function transmute!(cord::String)
  local span::UInt16 = length(cord)
  local line::String = lowercase(cord)

  if Shelves.trust
    for (old::Char, new::Char) in Shelves.duets
      line = replace(line, old => new)
    end
  end

  return line
end


"Permutation of selected string."
function pegasus(seal::Symbol, nth::Int)
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


"Tune string to C natural."
function hermit(seal::Symbol)
  return pegasus(seal, 1)::String
end


"Tune string to D natural."
function jovian(seal::Symbol)
  return pegasus(seal, 7)::String
end


"Tune string to E natural."
function copper(seal::Symbol)
  return pegasus(seal, 13)::String
end


"Tune string to F natural."
function saturn(seal::Symbol)
  return pegasus(seal, 16)::String
end


"Tune string to F sharp."
function gemini(seal::Symbol)
  return pegasus(seal, 19)::String
end


"Tune string to G natural."
function helios(seal::Symbol)
  return pegasus(seal, 22)::String
end


"Tune string to A natural."
function silver(seal::Symbol)
  return pegasus(seal, 28)::String
end


"Tune string to A sharp."
function aquari(seal::Symbol)
  return pegasus(seal, 31)::String
end


"Tune string to B natural."
function vulcan(seal::Symbol)
  return pegasus(seal, 34)::String
end


"Unison tuning."
function unison(seal::Symbol)
  local slips::NTuple{2, String}
  local ingot::String = hermit(seal)

  slips = (ingot, ingot)
  return slips
end


"Augmented fourths tuning."
function bfbfb(seal::Symbol)
  local slips::NTuple{5, String}
  local fn::String = saturn(seal)
  local bn::String = vulcan(seal)

  slips = (bn, fn, bn, fn, bn)
  return slips
end


"Perfect fifths tuning."
function cgdae(seal::Symbol)
  local slips::NTuple{5, String}

  slips = (
    copper(seal),
    silver(seal),
    jovian(seal),
    helios(seal),
    hermit(seal),
  )
  return slips
end


"Guitar Standard tuning."
function eadgbe(seal::Symbol)
  local slips::NTuple{6, String}
  local ingot::String = copper(seal)

  slips = (
    ingot,
    vulcan(seal),
    helios(seal),
    jovian(seal),
    silver(seal),
    ingot,
  )
  return slips
end


"Major thirds tuning."
function fkbjdn(seal::Symbol)
  local slips::NTuple{6, String}
  local dn::String = jovian(seal)
  local fk::String = gemini(seal)
  local bj::String = aquari(seal)

  slips = reverse((fk, bj, dn, fk, bj, dn))
  return slips
end


"Perfect fourths tuning."
function dragon(seal::Symbol)
  local slips::NTuple{9, String}

  slips = (
    aquari(seal),
    saturn(seal),
    hermit(seal),
    helios(seal),
    jovian(seal),
    silver(seal),
    copper(seal),
    vulcan(seal),
    gemini(seal),
  )
  return slips
end


end # Paisley

