using Documenter, NFFT

makedocs(
    format = :html,
    modules = [NFFT],
    sitename = "NFFT",
    authors = "Tobias Knopp,...",
    pages = [
        "Home" => "index.md",
        "Overview" => "overview.md",
        "Directional" => "directional.md",
        "Density" => "density.md"
    ]
)

deploydocs(repo   = "github.com/tknopp/NFFT.jl.git",
           target = "build")
