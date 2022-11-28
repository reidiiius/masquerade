

module Softest

  using Test


  @testset "Bandana" begin

    include("bandana.jl")

    @testset "Bandana.entryway" begin
      @test isdefined(Bandana, :entryway)
      @test isa(Bandana.entryway, Function)
      @test isa(Bandana.entryway("bass", "every"), Nothing)
      @test isa(Bandana.entryway(), Nothing)
      @test isa(Bandana.entryway("n0"), Nothing)
      @test isa(Bandana.entryway("k9"), Nothing)
      @test isa(Bandana.entryway("kazoo", "j3"), Nothing)
      @test isa(Bandana.entryway("cello", "j6", "k5"), Nothing)
    end

    @testset "Bandana Imports" begin
      local sign = "j2k6yr"
      local cord = "vv zq __ __ ry wu __ uw yr __ ot qz "

      # Bandana imports Paisley.place!
      @test isdefined(Bandana, :place!)
      @test isa(Bandana.place!(sign, cord), Nothing)
      @test isa(Bandana.entryway(sign), Nothing)

      # Bandana imports Paisley.erase!
      @test isdefined(Bandana, :erase!)
      @test isa(Bandana.erase!(sign), Nothing)
      @test isa(Bandana.entryway(sign), Nothing)
    end

    println()
  end


  @testset "Paisley" begin

    include("paisley.jl")

    @testset "Paisley.bounds" begin
      @test isdefined(Paisley, :bounds)
      @test isa(Paisley.bounds, Function)
      @test isa(Paisley.bounds(42), Bool)
      @test isa(Paisley.bounds(1), Bool)
    end

    @testset "Paisley.tacit" begin
      @test isdefined(Paisley, :tacit)
      @test isa(Paisley.tacit, Function)
      @test isa(Paisley.tacit(), String)
    end

    @testset "Paisley.sentinel" begin
      @test isdefined(Paisley, :sentinel)
      @test isa(Paisley.sentinel, Function)
      @test isa(Paisley.sentinel("j3k56m4ww"), Bool)
    end

    @testset "Paisley.place!" begin
      @test isdefined(Paisley, :place!)
      @test isa(Paisley.place!, Function)
    end

    @testset "Paisley.erase!" begin
      @test isdefined(Paisley, :erase!)
      @test isa(Paisley.erase!, Function)
    end

    @testset "Paisley.catalog" begin
      @test isdefined(Paisley, :catalog)
      @test isa(Paisley.catalog, Function)
    end

    @testset "Paisley.transmute!" begin
      @test isdefined(Paisley, :transmute!)
      @test isa(Paisley.transmute!, Function)
      @test isa(Paisley.transmute!("rv wq __ us"), String)
    end

    @testset "Paisley.pitch" begin
      @test isdefined(Paisley, :pitch)
      @test isa(Paisley.pitch, Function)
      @test isa(Paisley.pitch(:n0, 1), String)
    end

    @testset "Paisley Pitches" begin
      local group = (
        :hermit,
        :jovian,
        :copper,
        :saturn,
        :gemini,
        :helios,
        :silver,
        :aquari,
        :vulcan,
      )

      for item in group
        @test isdefined(Paisley, item)
      end

      @test isa(Paisley.hermit, Function)
      @test isa(Paisley.jovian, Function)
      @test isa(Paisley.copper, Function)
      @test isa(Paisley.saturn, Function)
      @test isa(Paisley.gemini, Function)
      @test isa(Paisley.helios, Function)
      @test isa(Paisley.silver, Function)
      @test isa(Paisley.aquari, Function)
      @test isa(Paisley.vulcan, Function)

      @test isa(Paisley.hermit(:n0), String)
      @test isa(Paisley.jovian(:n0), String)
      @test isa(Paisley.copper(:n0), String)
      @test isa(Paisley.saturn(:n0), String)
      @test isa(Paisley.gemini(:n0), String)
      @test isa(Paisley.helios(:n0), String)
      @test isa(Paisley.silver(:n0), String)
      @test isa(Paisley.aquari(:n0), String)
      @test isa(Paisley.vulcan(:n0), String)
    end

    @testset "Paisley Tuners" begin
      local group = (
        :bfbfb,
        :cgdae,
        :eadgbe,
        :fkbjdn,
        :dragon,
      )

      for item in group
        @test isdefined(Paisley, item)
      end

      @test isa(Paisley.bfbfb, Function)
      @test isa(Paisley.cgdae, Function)
      @test isa(Paisley.eadgbe, Function)
      @test isa(Paisley.fkbjdn, Function)
      @test isa(Paisley.dragon, Function)

      @test isa(Paisley.bfbfb(:n0), NTuple{5, String})
      @test isa(Paisley.cgdae(:n0), NTuple{5, String})
      @test isa(Paisley.eadgbe(:n0), NTuple{6, String}) 
      @test isa(Paisley.fkbjdn(:n0), NTuple{6, String}) 
      @test isa(Paisley.dragon(:n0), NTuple{9, String}) 
    end

  end


  @testset "Shelves" begin

    include("shelves.jl")

    @testset "Shelves Data" begin
      @test isdefined(Shelves, :latch)
      @test typeof(Shelves.latch) == Bool

      @test isdefined(Shelves, :bbr)
      @test typeof(Shelves.bbr) == Char

      @test isdefined(Shelves, :hbr)
      @test typeof(Shelves.hbr) == Char

      @test isdefined(Shelves, :_Ak)
      @test typeof(Shelves._Ak) == Char

      @test isdefined(Shelves, :_Dk)
      @test typeof(Shelves._Dk) == Char

      @test isdefined(Shelves, :_Bn)
      @test typeof(Shelves._Bn) == Char

      @test isdefined(Shelves, :_En)
      @test typeof(Shelves._En) == Char

      @test isdefined(Shelves, :_An)
      @test typeof(Shelves._An) == Char

      @test isdefined(Shelves, :_Dn)
      @test typeof(Shelves._Dn) == Char

      @test isdefined(Shelves, :_Gn)
      @test typeof(Shelves._Gn) == Char

      @test isdefined(Shelves, :_Cn)
      @test typeof(Shelves._Cn) == Char

      @test isdefined(Shelves, :_Fn)
      @test typeof(Shelves._Fn) == Char

      @test isdefined(Shelves, :_Ej)
      @test typeof(Shelves._Ej) == Char

      @test isdefined(Shelves, :_Aj)
      @test typeof(Shelves._Aj) == Char

      @test isdefined(Shelves, :_Dj)
      @test typeof(Shelves._Dj) == Char

      @test isdefined(Shelves, :model)
      @test typeof(Shelves.model) == NTuple{14, Char}

      @test isdefined(Shelves, :veils)
      @test typeof(Shelves.veils) == NTuple{14, Char}

      @test isdefined(Shelves, :trust)
      @test typeof(Shelves.trust) == Bool

      @test isdefined(Shelves, :duets)
      @test typeof(Shelves.duets) == Iterators.Zip{
        Tuple{NTuple{14, Char}, NTuple{14, Char}}
      }

      @test isdefined(Shelves, :codex)
      @test typeof(Shelves.codex) == Dict{Symbol, String}
      @test length(Shelves.codex) > 0
      @test haskey(Shelves.codex, :n0)
    end

  end


end # Softest


