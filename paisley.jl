

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
  bounds(strwidth(mute)) ? mute : "check tacit"
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
  if sentinel(yarn)
    local seal = symbol(lowercase(yarn))
    if is_valid_ascii(wire)
      local span = strwidth(wire)
      if bounds(span)
        codex[seal] = wire
        return nothing
      elseif isless(span, 36)
        println("\n\tSize: $span? -> $wire")
      else
        println("\n\tSize: $span?")
      end
    else
      println("\n\tASCII? $wire")  
    end
  else
    println("\n\t", yarn, '?')
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
    println("\ncause $anomaly")
  end
end


# const nbs = char(160)
const bbr = char(166)

# const mdt = char(183)
const hbr = char(8213)

const _Ak = char(50)
const _Dk = char(51)
const _Bn = char(52)
const _En = char(53)
const _An = char(54)
const _Dn = char(55)
const _Gn = char(56)
const _Cn = char(57)
const _Fn = char(78)
const _Ej = char(80)
const _Aj = char(81)
const _Dj = char(82)

const orig = (' ','_','o','p','q','r','s','t','u','v','w','x','y','z')
const veil = (bbr,hbr,_Ak,_Dk,_Bn,_En,_An,_Dn,_Gn,_Cn,_Fn,_Ej,_Aj,_Dj)

const trusty = isequal(length(orig), length(veil))

function transmute!(cord::String)
  local line = copy(cord)
  if trusty
    local item = 1
    while item <= length(orig)
      line = replace(line, orig[item], veil[item])
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


