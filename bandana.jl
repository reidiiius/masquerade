#! /usr/bin/julia

module Bandana

include("shelves.jl")
include("paisley.jl")

using .Paisley

struct Phylum
  attune::String
  layout::Function
  parade::Vector{String}
end


function fabric(record::Phylum, sign::String="i0")
  try
    local seal::Symbol = Symbol(sign)

    if sentinel(sign) && haskey(Shelves.codex, seal)
      local zither::String = record.attune
      local cronus::String = Shelves.epoch
      local diadem::String = "$zither-$sign-$cronus"
      local specie::NTuple = record.layout(seal)

      println("\n\t", diadem)
      for course::String in specie
        println("\t", course)
      end
    else
      println("\n\t", sign, " ?")
    end
  catch anomaly
    @warn anomaly
  end
end


function atrium(record::Phylum)
  for sign::String in record.parade
    fabric(record, sign)
  end
end


function gamut(record::Phylum)
  try
    local sorted::Vector{Symbol} = sort(collect(keys(Shelves.codex)))
    local zither::String = record.attune
    local cronus::String = Shelves.epoch

    for sign::Symbol in sorted
      println("\n\t$zither-$sign-$cronus")
      for course::String in record.layout(sign)
        println("\t", course)
      end
    end
  catch anomaly
    @warn anomaly
  end
end


function beagle(scent::String)
  local sorted::Vector{Symbol} = sort(collect(keys(Shelves.codex)))
  local things::Vector{Symbol} = Symbol[]

  for aroma::Symbol in sorted
    if occursin(scent, String(aroma))
      push!(things, aroma)
    end
  end

  if length(things) > 0
    catalog(things)
  else
    println("\n\t$scent ?")
  end
end


function catahoula(scent::String)
  local pref::Function

  if scent == "a4" ||
    scent == "b5" ||
    occursin(r"^(bf)+b?$", scent) ||
    occursin(r"^tritone?$", scent)
    pref = bfbfb

  elseif scent == "cello" ||
    scent == "p5" ||
    occursin(r"^.*gda.*$", scent) ||
    occursin(r"^mando.*", scent) ||
    occursin(r"^viol.*", scent)
    pref = cgdae

  elseif scent == "gtr" ||
    occursin(r"^g.*it.*r$", scent) ||
    occursin(r"^.*dgbe.*$", scent) ||
    occursin(r"^.*gcea.*$", scent) ||
    occursin(r"^uk[ue](le)*$", scent)
    pref = eadgbe

  elseif scent == "fkbjdn" ||
    scent == "m3"
    pref = fkbjdn

  elseif scent == "bass" ||
    scent == "p4" ||
    occursin(r"^dra[cg]o.*$", scent) ||
    occursin(r"^.*eadg.*$", scent)
    pref = dragon

  else
    pref = unison
  end

  return pref
end


function normalize(circus::Vector)
  local parade::Vector{String} = String[]

  for word::String in circus
    if isascii(word) && length(word) < 15
      push!(parade, lowercase(word))
    end
  end

  return parade
end


function entryway(args...)
  local circus::Vector{String} = collect(args)
  local parade::Vector{String} = normalize(circus)
  local dexter::UInt8 = length(parade)

  # defaults
  local attune::String = "guitar"
  local layout::Function = eadgbe

  if dexter > 0
    local orchid::String = parade[1]
    local record::Phylum

    if dexter == 1
      record = Phylum(attune, layout, parade)
      fabric(record, orchid)
    elseif !sentinel(orchid)
      popfirst!(parade)

      record = Phylum(orchid, catahoula(orchid), parade)
      local head::String = first(parade)

      if head == "every" || head == "gamut"
        gamut(record)
      elseif orchid == "query"
        local scent = parade[1]
        beagle(scent)
      else
        atrium(record)
      end
    else
      record = Phylum(attune, layout, parade)
      atrium(record)
    end

  else
    local things::Vector{Symbol} = collect(keys(Shelves.codex))
    catalog(things)
  end
end


if length(ARGS) > 0
  entryway(ARGS...)
else
  entryway()
end

println()

end # Bandana

