using RecursiveFileList
using Documenter

DocMeta.setdocmeta!(RecursiveFileList, :DocTestSetup, :(using RecursiveFileList); recursive=true)

makedocs(;
    modules=[RecursiveFileList],
    authors="Frank Platzek <frank.platzek@deltares.nl> and contributors",
    repo="https://github.com/fwplatzek/RecursiveFileList.jl/blob/{commit}{path}#{line}",
    sitename="RecursiveFileList.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://fwplatzek.github.io/RecursiveFileList.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/fwplatzek/RecursiveFileList.jl",
    devbranch="master",
)
