
module Softest

  using Test

  const joist = string(repeat('-', 14), '|')

  @testset "Bandana" begin

    include("bandana.jl")

    @testset "Bandana Imports" begin
      local group = (
        :bfbfb,
        :catalog,
        :cgdae,
        :dragon,
        :eadgbe,
        :fkbjdn,
        :sentinel,
        :tacit,
        :unison,
      )

      for item in group
        @test isdefined(Bandana, item)
      end
    end

    @testset "Bandana Objects" begin
      local group = (
        :Phylum,
        :fabric,
        :atrium,
        :gamut,
        :basset,
        :beagle,
        :catahoula,
        :normalize,
        :entryway,
      )

      for item in group
        @test isdefined(Bandana, item)
      end

      local batch = (
        Bandana.fabric,
        Bandana.atrium,
        Bandana.gamut,
        Bandana.basset,
        Bandana.beagle,
        Bandana.catahoula,
        Bandana.normalize,
        Bandana.entryway,
      )

      for item in batch
        @test isa(item, Function)
      end
    end

    local attune::String = "beadgcf"
    local layout::Function = Bandana.dragon
    local parade::Vector{String} = ["n0", "k9", "j3"]
    local record = Bandana.Phylum(attune, layout, parade)

    @testset "Bandana.Phylum" begin
      @test isa(record, Bandana.Phylum)
      @test isa(record.attune, String)
      @test isa(record.layout, Function)
      @test isa(record.parade, Vector{String})
    end

    @testset "Bandana.fabric" begin
      @test isa(Bandana.fabric(record), Nothing)
      @test isa(Bandana.fabric(record, "n0"), Nothing)
    end

    @testset "Bandana.atrium" begin
      @test isa(Bandana.atrium(record), Nothing)
      @test isa(Bandana.atrium(record), Nothing)
    end

    @testset "Bandana.gamut" begin
      @test isa(Bandana.gamut(record), Nothing)
    end

    @testset "Bandana.basset" begin
      @test isa(Bandana.basset("yq"), Nothing)
      @test isa(Bandana.basset("Q4"), Nothing)
    end

    @testset "Bandana.beagle" begin
      @test isa(Bandana.beagle("56"), Nothing)
      @test isa(Bandana.beagle("99"), Nothing)
    end

    @testset "Bandana.catahoula" begin
      @test isa(Bandana.catahoula("bead"), Function)
      @test isa(Bandana.catahoula("misfit"), Function)
    end

    @testset "Bandana.normalize" begin
      local chex = Bandana.normalize(["0123456789ABCDEF"])
      local bars = Bandana.normalize(["■", "□", "j2k56m4"])
      local arks = Bandana.normalize(["k6", "j5", "¢£¤¥€"])

      @test isa(chex, Array)
      @test isa(bars, Array)
      @test isa(arks, Array)
      @test length(chex) == 0
      @test length(bars) == 1
      @test length(arks) == 2
    end

    @testset "Bandana.entryway" begin
      @test isa(Bandana.entryway("m3", "every"), Nothing)
      @test isa(Bandana.entryway(), Nothing)
      @test isa(Bandana.entryway("query", "56"), Nothing)
      @test isa(Bandana.entryway("query", "99"), Nothing)
      @test isa(Bandana.entryway("a4"), Nothing)
      @test isa(Bandana.entryway("n0"), Nothing)
      @test isa(Bandana.entryway("k9", "k2j17"), Nothing)
      @test isa(Bandana.entryway("kazoo", "j3"), Nothing)
      @test isa(Bandana.entryway("p5", "j6", "k5"), Nothing)
    end

    println("\n")
  end

  println(joist)

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
      @test isa(Paisley.sentinel("k2j17tv"), Bool)
      @test isa(Paisley.sentinel("misfit"), Bool)
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

      local batch = (
        Paisley.hermit,
        Paisley.jovian,
        Paisley.copper,
        Paisley.saturn,
        Paisley.gemini,
        Paisley.helios,
        Paisley.silver,
        Paisley.aquari,
        Paisley.vulcan,
      )

      for item in batch
        @test isa(item, Function)
      end

      for item in batch
        @test isa(item(:n0), String)
      end
    end

    @testset "Paisley Tuners" begin
      local group = (
        :unison,
        :bfbfb,
        :cgdae,
        :eadgbe,
        :fkbjdn,
        :dragon,
      )

      for item in group
        @test isdefined(Paisley, item)
      end

      local batch = (
        Paisley.unison,
        Paisley.bfbfb,
        Paisley.cgdae,
        Paisley.eadgbe,
        Paisley.fkbjdn,
        Paisley.dragon,
      )

      for item in batch
        @test isa(item, Function)
      end

      local numbs = (2, 5, 5, 6, 6, 9)
      local niter = 1

      for item in batch
        @test isa(item(:n0), NTuple{numbs[niter], String})
        niter = niter + 1
      end
    end

  end

  println(joist)

  @testset "Shelves" begin

    include("shelves.jl")

    @testset "Shelves Data" begin
      local bank = Dict(
        :bbr => Shelves.bbr,
        :hbr => Shelves.hbr,
        :_Ak => Shelves._Ak,
        :_Dk => Shelves._Dk,
        :_Bn => Shelves._Bn,
        :_En => Shelves._En,
        :_An => Shelves._An,
        :_Dn => Shelves._Dn,
        :_Gn => Shelves._Gn,
        :_Cn => Shelves._Cn,
        :_Fn => Shelves._Fn,
        :_Ej => Shelves._Ej,
        :_Aj => Shelves._Aj,
        :_Dj => Shelves._Dj,
      )

      for (sym, ref) in bank
        @test isdefined(Shelves, sym)
        @test isa(ref, Char)
      end

      @test isdefined(Shelves, :epoch)
      @test isa(Shelves.epoch, String)

      @test isdefined(Shelves, :latch)
      @test isa(Shelves.latch, Bool)

      @test isdefined(Shelves, :model)
      @test isa(Shelves.model, NTuple{14, Char})

      @test isdefined(Shelves, :veils)
      @test isa(Shelves.veils, NTuple{14, Char})

      @test isdefined(Shelves, :trust)
      @test isa(Shelves.trust, Bool)

      @test isdefined(Shelves, :duets)
      @test isa(Shelves.duets, Iterators.Zip{
        Tuple{NTuple{14, Char}, NTuple{14, Char}}
      })

      @test isdefined(Shelves, :codex)
      @test isa(Shelves.codex, Dict{Symbol, String})
      @test length(Shelves.codex) > 0
      @test haskey(Shelves.codex, :n0)
      @test isa(get(Shelves.codex, :n0, 0), String)
      @test isa(get(Shelves.codex, :k9, 0), Integer)
    end

  end

  println(joist)

end # Softest

