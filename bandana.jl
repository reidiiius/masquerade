#! /usr/bin/julia

module Bandana

include("shelves.jl")
include("paisley.jl")

using .Paisley


function fabric(attune::String, layout::Function, yarn::String="i0")
  try
    local seal::Symbol = Symbol(yarn)

    if sentinel(yarn) && haskey(Shelves.codex, seal)
      local cronus::String = Shelves.epoch
      local diadem::String = "$attune-$yarn-$cronus"
      local specie::NTuple = layout(seal)

      println("\n\t", diadem)
      for course::String in specie
        println("\t", course)
      end
    else
      println("\n\t", yarn, " ?")
    end
  catch anomaly
    write(stderr::IO, "Cause: ", anomaly, "\n")
  end
end


function atrium(attune::String, layout::Function, cargo::Array)
  for yarn::String in cargo
    fabric(attune, layout, yarn)
  end
end


function gamut(attune::String, layout::Function)
  local arts::Array = collect(keys(Shelves.codex))
  local vets::Vector{Symbol} = sort(arts)

  for its::Symbol in vets
    fabric(attune, layout, string(its))
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


function entryway(args...)
  local parade::Vector{String} = String[]
  local circus::Vector = collect(args)

  local attune::String = "guitar"
  local layout::Function = eadgbe

  for word::String in circus
    push!(parade, lowercase(word))
  end

  local dexter::Int = length(parade)

  if dexter > 0
    local orchid::String = parade[1]

    if dexter == 1
      fabric(attune, layout, orchid)
    elseif !sentinel(orchid)
      attune = orchid
      layout = catahoula(orchid)

      popfirst!(parade)

      local cargo::Array = copy(parade)
      local head::String = first(cargo)

      if head == "every" || head == "gamut"
        gamut(attune, layout)
      else
        atrium(attune, layout, cargo)
      end
    else
      atrium(attune, layout, parade)
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

