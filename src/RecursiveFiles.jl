module RecursiveFiles

const PROJECT_ROOT = @__DIR__
export PROJECT_ROOT

include(joinpath(PROJECT_ROOT, "list_files.jl"))

export list_files, include_files
export juliaFilesPattern, allFilesPattern

end
