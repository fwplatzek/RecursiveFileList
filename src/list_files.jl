const juliaFilesPattern = ".jl"
const allFilesPattern = ""

"""
    filelist = list_files(srcdir; fileToRemove="NeverToBeFound", pattern=allFilesPattern)

    Get a recursive list of files in folder SRCDIR (full nested paths).
    The optional FILETOREMOVE (if present) will be removed from the list
    The optional PATTERN can be used for filtering for certain file types.
"""
function list_files(srcdir; fileToRemove="NeverToBeFound", pattern=allFilesPattern)
    filelist = []
    for (root, dirs, files) in walkdir(srcdir)
        # global contents # if in REPL
        for file in files
            if occursin(pattern, file)
                push!.(Ref(filelist), joinpath.(root, file))
            end
        end
    end

    # Make sure we don't include the module file itself
    filter!(filename->filename≠joinpath(srcdir,fileToRemove),filelist)

    return filelist
end

"""
    retval = list_files(srcdir; fileToRemove="NeverToBeFound", pattern=allFilesPattern)

    Get a recursive list of files in folder SRCDIR (full nested paths).
    The optional FILETOREMOVE (if present) will be removed from the list
    The optional PATTERN can be used for filtering for certain file types.
"""
function include_files(srcdir; fileToRemove="NeverToBeFound", pattern=juliaFilesPattern)
    filelist = []
    for (root, dirs, files) in walkdir(srcdir)
        # global contents # if in REPL
        for file in files
            if occursin(pattern, file)
                push!.(Ref(filelist), joinpath.(root, file))
            end
        end
    end

    # Make sure we don't include the module file itself (specified as fileToRemove)
    filter!(filename->filename≠joinpath(srcdir,fileToRemove), filelist)

    for file in filelist
        include(file)
    end

    return 0
end
