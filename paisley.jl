
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
  local bin::Bool = (35 < span < 61)

  return bin
end


function tacit()
  local mute::String = repeat("__ ", 12)

  return mute
end


function sentinel(yarn::String)
  local rex::Regex = r"^([ijkn]+\d+)+([lm]\d+)?[o-z]*$"
  local bin::Bool = occursin(rex, lowercase(yarn))

  return bin
end


function catalog(things::Vector{Symbol})
  local sorted::Vector{Symbol} = sort(things)
  local cycles::UInt8 = 0
  local column::UInt8 = 7

  println()
  for (numb::UInt8, sign::Symbol) in enumerate(sorted)
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


function transmute!(cord::String)
  local span::UInt8 = length(cord)
  local line::String = lowercase(cord)

  if Shelves.trust
    for (old::Char, new::Char) in Shelves.duets
      line = replace(line, old => new)
    end
  end

  return line
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


function hermit(seal::Symbol)
  local nylon::String = pitch(seal, 1)

  return nylon
end


function jovian(seal::Symbol)
  local nylon::String = pitch(seal, 7)

  return nylon
end


function copper(seal::Symbol)
  local nylon::String = pitch(seal, 13)

  return nylon
end


function saturn(seal::Symbol)
  local nylon::String = pitch(seal, 16)

  return nylon
end


function gemini(seal::Symbol)
  local nylon::String = pitch(seal, 19)

  return nylon
end


function helios(seal::Symbol)
  local nylon::String = pitch(seal, 22)

  return nylon
end


function silver(seal::Symbol)
  local nylon::String = pitch(seal, 28)

  return nylon
end


function aquari(seal::Symbol)
  local nylon::String = pitch(seal, 31)

  return nylon
end


function vulcan(seal::Symbol)
  local nylon::String = pitch(seal, 34)

  return nylon
end


function unison(seal::Symbol)
  local slips::NTuple{2, String}
  local ingot::String = hermit(seal)

  slips = (ingot, ingot)
  return slips
end


function bfbfb(seal::Symbol)
  local slips::NTuple{5, String}
  local fn::String = saturn(seal)
  local bn::String = vulcan(seal)

  slips = (bn, fn, bn, fn, bn)
  return slips
end


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


function fkbjdn(seal::Symbol)
  local slips::NTuple{6, String}
  local dn::String = jovian(seal)
  local fk::String = gemini(seal)
  local bj::String = aquari(seal)

  slips = reverse((fk, bj, dn, fk, bj, dn))
  return slips
end


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

