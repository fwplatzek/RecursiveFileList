# RecursiveFileList

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://fwplatzek.github.io/RecursiveFileList.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://fwplatzek.github.io/RecursiveFileList.jl/dev/)
[![Build Status](https://github.com/fwplatzek/RecursiveFileList.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/fwplatzek/RecursiveFileList.jl/actions/workflows/CI.yml?query=branch%3Amaster)
[![Coverage](https://codecov.io/gh/fwplatzek/RecursiveFileList.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/fwplatzek/RecursiveFileList.jl)

A small utility package for obtaining a recursive list of files in Julia.
It can also be used for including files recursively in a module file (see example 3 below).

## Example usage
Three typical examples of use that can be thought of:

**Example 1:** To just get a list of all files in a folder within Julia:

```julia
using RecursiveFileList

# Current folder where the recursive file list is requested
curdir = "./current/path"

# Get the recursive files list
filelist = list_files(curdir)
```

**Example 2:** Get a list of files of a certain file type in a folder within Julia:

```julia
using RecursiveFileList

# Current folder where the recursive file list is requested
curdir = "./current/path"
pattern = ".jl"

# Get the recursive files list
filelist = list_files(curdir; pattern=pattern)
```

**Example 3:** To include all Julia files recursively in a module file (excluding the module file itself:

```julia
module Foo

using RecursiveFileList

# Main Project root
const PROJECT_ROOT = @__DIR__
export PROJECT_ROOT

# Include all files recursively (except the module file itself)
moduleFile = joinpath(PROJECT_ROOT, "Foo.jl")
include_files(PROJECT_ROOT; fileToRemove=moduleFile)

export main

end
```
