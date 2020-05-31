

module Paisley

export bfbfb,
       catalog,
       cgdae,
       codex,
       dragon,
       eadgbe,
       erase!,
       fkbjdn,
       place!,
       sentinel,
       tacit


include("shelves.jl")

using .Shelves


function bounds(span::Int)
  span >= 36 && span <= 60
end


function tacit()
  local mute = repeat("__ ", 12)
  bounds(strwidth(mute)) ? mute : "Check tacit"
end


function sentinel(yarn::String)
  local rex = r"^([jknz]+\d+)+([lm]\d+)?[o-z]*$"
  ismatch(rex, lowercase(yarn))
end


function erase!(yarn::String)
  local seal = symbol(lowercase(yarn))
  if haskey(codex, seal)
    delete!(codex, seal)
    println("\n\t$seal deleted")
  else
    println("\n\t$seal not found")
  end
end


function place!(yarn::String, wire::String)
  if sentinel(yarn) && is_valid_ascii(wire)
    local seal = symbol(lowercase(yarn))
    local span = strwidth(wire)
    if bounds(span)
      codex[seal] = wire
      return nothing
    elseif isless(span, 36)
      println("\n\tSize: $span? $wire")
    else
      println("\n\tSize: $span?")
    end
  elseif sentinel(yarn)
    println("\n\tASCII? $wire")
  else
    println("\n\t$yarn?")
  end
end

place!("z0", tacit()) # default


function catalog()
  try
    local art = collect(keys(codex))
    sort!(art)
    local nth = 1
    local columns = 7
    println()
    for its in art
      print("\t", its)
      if ==(nth % columns, 0)
        println()
      end
      nth += 1
    end
    nth -= 1
    if !=(nth % columns, 0)
      println()
    end
  catch anomaly
    println("\nCause $anomaly")
  end
end


function transmute!(cord::String)
  local line = copy(cord)
  if trust
    local item = 1
    while item <= length(model)
      line = replace(line, model[item], veils[item])
      item += 1
    end
  end
  return line
end


function pitch(seal::Symbol, nth::Int)
  try
    local wire = get(codex, seal, tacit())
    if bounds(strwidth(wire))
      local cord = string(wire[nth:end], wire[1:nth + 1])
      transmute!(cord)
    else
      tacit()
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


end # module


