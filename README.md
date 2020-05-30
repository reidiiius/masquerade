# Masquerade
Semiotics

---

### Download

    git clone https://github.com/reidiiius/masquerade.git

---

### Usage
Command-line interface

    cd masquerade/

    julia bandana.jl

    julia bandana.jl n0

    julia bandana.jl j6 k5

    julia bandana.jl cello j6 k5

    julia bandana.jl bass every

REPL

    guest@multivac2:~/masquerade$ julia

    julia> include("bandana.jl")

    julia> Bandana.entryway()

    julia> Bandana.entryway("n0")

    julia> Bandana.entryway("cello", "j6", "k5")

    julia> Bandana.place!("j2k6yr", "vv zq __ __ ry wu __ uw yr __ ot qz ")

    julia> Bandana.entryway("bass", "j2k6yr")

    julia> Bandana.erase!("j2k6yr")

    julia> Bandana.entryway("bass", "every")

    julia> exit() 

---

### Distribution
MIT License

