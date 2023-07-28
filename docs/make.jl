using RecursiveFiles
using Documenter

DocMeta.setdocmeta!(RecursiveFiles, :DocTestSetup, :(using RecursiveFiles); recursive=true)

makedocs(;
    modules=[RecursiveFiles],
    authors="Frank Platzek <frank.platzek@deltares.nl> and contributors",
    repo="https://github.com/fwplatzek/RecursiveFiles.jl/blob/{commit}{path}#{line}",
    sitename="RecursiveFiles.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://fwplatzek.github.io/RecursiveFiles.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/fwplatzek/RecursiveFiles.jl",
    devbranch="master",
)
