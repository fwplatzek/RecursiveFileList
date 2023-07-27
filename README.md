# RecursiveFileList

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://fwplatzek.github.io/RecursiveFileList.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://fwplatzek.github.io/RecursiveFileList.jl/dev/)
[![Build Status](https://github.com/fwplatzek/RecursiveFileList.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/fwplatzek/RecursiveFileList.jl/actions/workflows/CI.yml?query=branch%3Amaster)
[![Coverage](https://codecov.io/gh/fwplatzek/RecursiveFileList.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/fwplatzek/RecursiveFileList.jl)

A small utility package for obtaining a recursive list of files in Julia.

Example usage in a module file:

```julia
module Foo

using RecursiveFileList

# Main Project root
const PROJECT_ROOT = @__DIR__
export PROJECT_ROOT

# Get the files to include
moduleFile = "Foo.jl"
filelist = list_files(PROJECT_ROOT, moduleFile)

# Include all files
for file in filelist
    include(file)
end

export main

end
```
