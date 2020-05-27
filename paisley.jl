

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
       tacit


include("shelves.jl")

using .Shelves


function tacit()
  repeat("__ ", 12)
end


function erase!(yarn::String)
  local seal = symbol(yarn)
  if haskey(codex, seal)
    delete!(codex, seal)
    println("\n\t$seal deleted")
  else
    println("\n\t$seal not found")
  end
end


function place!(yarn::String, wire::String)
  local seal = symbol(yarn)
  local span = length(wire)
  if span >= 36 && span <= 60
    codex[seal] = wire
  elseif span < 36
    println("\n\tSize: $span? -> $wire")
  else
    println("\n\tSize: $span?")
  end
end

place!("z0", tacit())

place!("n0zpyy"  , "vr zp tt __ rv wq __ us yy su __ qw ")
place!("n0zp"    , "vr zp tt __ rv wq __ us __ su __ qw ")
place!("n0yy"    , "vr __ tt __ rv wq __ us yy su __ qw ")
place!("n0pzyy"  , "vr __ tt pz rv wq __ us yy su __ qw ")
place!("n0pz"    , "vr __ tt pz rv wq __ us __ su __ qw ")
place!("k6sv"    , "vs __ tu __ rw wr __ ut __ sv oq qo ")
place!("k2j6zt"  , "vp zt __ pv rq wo __ uy yu __ __ qr ")
place!("k2j6tz"  , "vp __ tz pv rq wo __ uy yu __ __ qr ")
place!("k2j17tv" , "__ __ tv pq ro ws __ uu __ sw or qp ")
place!("k26yu"   , "vp __ __ pv rq wo __ uy yu __ ow qr ")
place!("k26tv"   , "vt __ tv pq ro ws __ uu __ __ or qx ")
place!("k26sw"   , "vt __ __ pq ro ws __ uu __ sw or qp ")
place!("k1j6ot"  , "__ zq to __ ry wu __ uw yr __ ot qz ")
place!("j6so"    , "vu __ tw __ rp wt __ uv yq so __ qy ")
place!("j6pr"    , "vu __ tw pr rp wt __ uv yq __ __ qy ")
place!("j6prso"  , "vu __ tw pr rp wt __ uv yq so __ qy ")
place!("j6pros"  , "vu __ tw pr rp wt __ uv yq __ os qy ")
place!("j6os"    , "vu __ tw __ rx wt __ uv yq __ os qy ")
place!("j3zz"    , "vt zz tv xq __ ws __ uu __ sw __ qx ")
place!("j3ro"    , "vt __ tv pq ro ws __ uu __ sw __ qx ")
place!("j3ror"   , "vt __ tv xq ro ws __ uu __ sw or qp ")
place!("j3or"    , "vt __ tv xq __ ws __ uu __ sw or qp ")
place!("j3k6yt"  , "vo __ ty xu __ ww __ ux yt __ ov qq ")
place!("j3k5to"  , "yr __ ot qz __ zq to __ ry wu __ uw ")
place!("j3k16zs" , "__ zs ty xu __ ww __ ux yt __ ov qq ")
place!("j36so"   , "vu __ tw xr __ wt __ uv yq so __ qy ")
place!("j34or"   , "vt __ tv pq ro __ __ uu __ sw or qx ")
place!("j346ow"  , "vp __ tz pv rq __ __ uy yu __ ow qr ")
place!("j2to"    , "vv zq to __ ry wu __ uw __ sx __ qz ")
place!("j2ps"    , "vv zq __ ps ry wu __ uw __ sx __ qz ")
place!("j26to"   , "vv zq to __ ry wu __ uw yr __ __ qz ")
place!("j26sp"   , "vv zq __ __ ry wu __ uw yr sp __ qz ")
place!("j26ps"   , "vv zq __ ps ry wu __ uw yr __ __ qz ")
place!("j26psp"  , "vv zq __ ps ry wu __ uw yr sp __ qz ")
place!("j26ot"   , "vv zq __ __ ry wu __ uw yr __ ot qz ")
place!("j23to"   , "vv zq to xs __ wu __ uw __ sx __ qz ")
place!("j23ot"   , "vv zq __ xs __ wu __ uw __ sx ot qz ")
place!("j236sq"  , "vy zu __ xw __ wx __ uz yv sq __ qs ")
place!("j236sp"  , "vv zq __ xs __ wu __ uw yr sp __ qz ")
place!("j236ot"  , "vv zq __ xs __ wu __ uw yr __ ot qz ")
place!("j17zy"   , "__ zy tu __ rw wr __ ut __ sv oq qo ")


function catalog()
  try
    local art = collect(keys(codex))
    sort!(art)
    local nth = 1
    local columns = 7
    println()
    for its in art
      print("\t", its)
      if nth % columns == 0
        println()
      end
      nth += 1
    end
    if (nth - 1) % columns != 0
      println()
    end
  catch anomaly
    println("\ncause $anomaly")
  end
end


function morpheus(prep::String)
  local temp = copy(prep)
  local deca = ('_','o','p','q','r','s','t','u','v','w','x','y','z')
  local card = ('-','2','3','4','5','6','7','8','9','N','P','Q','R')
  if length(deca) == length(card)
    local item = 1
    while item <= length(deca)
      temp = replace(temp, deca[item], card[item])
      item += 1
    end
  end
  return temp
end


function pitch(seal::Symbol, nth::Int)
  try
    local prep = get(codex, seal, tacit())
    local wire = morpheus(prep)
    string(wire[nth:end], wire[1:nth + 1])
  catch anomaly
    println("\ncause $anomaly")
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


