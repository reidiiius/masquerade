#! /usr/bin/julia

module Bandana

include("shelves.jl")
include("paisley.jl")

using .Paisley

struct Phylum
  attune::String
  layout::Function
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
    println("Cause: ", anomaly)
  end
end


function atrium(record::Phylum, parade::Array)
  for sign::String in parade
    fabric(record, sign)
  end
end


function gamut(record::Phylum)
  local arts::Array = collect(keys(Shelves.codex))
  local vets::Vector{Symbol} = sort(arts)

  for its::Symbol in vets
    fabric(record, string(its))
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
      record = Phylum(attune, layout)
      fabric(record, orchid)
    elseif !sentinel(orchid)
      record = Phylum(orchid, catahoula(orchid))

      popfirst!(parade)
      local head::String = first(parade)

      if head == "every" || head == "gamut"
        gamut(record)
      else
        atrium(record, parade)
      end
    else
      record = Phylum(attune, layout)
      atrium(record, parade)
    end

  else
    catalog()
  end
end


if length(ARGS) > 0
  entryway(ARGS...)
else
  entryway()
end

println()

end # Bandana

