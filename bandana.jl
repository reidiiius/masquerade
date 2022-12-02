

module Bandana

  include("paisley.jl")

  using .Paisley

  const epoch = Libc.strftime("h%s", time())::String

begin # hedge

local attune::String, layout::Function = "guitar", eadgbe


function fabric(yarn::String="z0")
  try
    local seal::Symbol = Symbol(yarn)

    if sentinel(yarn) && haskey(codex, seal)
      local diadem::String = "$attune-$yarn-$epoch"
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


function atrium(cargo::Array)
  for yarn::String in cargo
    fabric(yarn)
  end
end


function gamut()
  local arts::Array = collect(keys(codex))
  local vets::Vector{Symbol} = sort(arts)

  for its::Symbol in vets
    fabric(string(its))
  end
end


function catahoula(scent::String)
  local pref::Function

  if scent == "aug4th" ||
    scent == "a4" ||
    scent == "b5" ||
    scent == "dim5th" ||
    occursin(r"^(bf)+b?$", scent) ||
    occursin(r"^triton[ae]?[ls]?$", scent)
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
    scent == "maj3rd" ||
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

  for word::String in circus
    push!(parade, lowercase(word))
  end

  local dexter::Int = length(parade)

  if dexter > 0
    local orchid::String = parade[1]

    if dexter == 1
      fabric(orchid)

    else
      attune, layout = orchid, catahoula(orchid)

      popfirst!(parade)

      local cargo::Array = copy(parade)
      local head::String = first(cargo)

      isequal(head, "every") ||
      isequal(head, "gamut") ? gamut() : atrium(cargo)
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

end # hedge

end # Bandana

