

module Bandana

  include("paisley.jl")

  using .Paisley

  const epoch = Libc.strftime("h%s", time())

begin # hedge

local attune, layout = "guitar", eadgbe


function fabric(yarn::String="z0")
  try
    local seal = Symbol(yarn)
    if sentinel(yarn) && haskey(codex, seal)
      local diadem = "$attune-$yarn-$epoch"
      local specie = layout(seal)
      println("\n\t", diadem)
      for course in specie
        println("\t", course)
      end
    else
      println("\n\t", yarn, '?')
    end
  catch anomaly
    println("\nCause $anomaly")
  end
end


function atrium(cargo::Array)
  for yarn in cargo
    fabric(yarn)
  end
end


function gamut()
  local art = collect(keys(codex))
  sort!(art)
  for its in art
    fabric(string(its))
  end
end


function entryway(args...)
  local argots = String[]

  for word in collect(args)
    push!(argots, lowercase(word))
  end

  local dexter = length(argots)

  if dexter > 0
    local orchid = argots[1]

    if dexter == 1
      fabric(orchid)

    elseif dexter > 1

      if orchid == "aug4th" ||
         orchid == "a4" ||
         orchid == "b5" ||
         orchid == "dim5th" ||
         occursin(r"^(bf)+b?$", orchid) ||
         occursin(r"^triton[ae]?[ls]?$", orchid)
        attune, layout = orchid, bfbfb
        popfirst!(argots)

      elseif orchid == "cello" ||
             orchid == "p5" ||
             occursin(r"^.*gda.*$", orchid) ||
             occursin(r"^mando.*", orchid) ||
             occursin(r"^viol.*", orchid)
        attune, layout = orchid, cgdae
        popfirst!(argots)

      elseif orchid == "gtr" ||
             occursin(r"^g.*it.*r$", orchid) ||
             occursin(r"^.*dgbe.*$", orchid) ||
             occursin(r"^.*gcea.*$", orchid) ||
             occursin(r"^uk[ue](le)*$", orchid)
        attune, layout = orchid, eadgbe
        popfirst!(argots)

      elseif orchid == "fkbjdn" ||
             orchid == "maj3rd" ||
             orchid == "m3"
        attune, layout = orchid, fkbjdn
        popfirst!(argots)

      elseif orchid == "bass" ||
             orchid == "p4" ||
             occursin(r"^dra[cg]o.*$", orchid) ||
             occursin(r"^.*eadg.*$", orchid)
        attune, layout = orchid, dragon
        popfirst!(argots)

      else
        nothing
      end

      local cargo = copy(argots)

      local head = first(cargo)

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

end # module


