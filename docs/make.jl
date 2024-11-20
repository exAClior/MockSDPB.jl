using MockSDPB
using Documenter

DocMeta.setdocmeta!(MockSDPB, :DocTestSetup, :(using MockSDPB); recursive=true)

makedocs(;
    modules=[MockSDPB],
    authors="exaclior <yushengzhao2020@outlook.com> and contributors",
    sitename="MockSDPB.jl",
    format=Documenter.HTML(;
        canonical="https://exaclior.github.io/MockSDPB.jl",
        edit_link="master",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/exaclior/MockSDPB.jl",
    devbranch="master",
)
