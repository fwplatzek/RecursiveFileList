# Get a recursive list of Julia files in a folder (full nested paths)
function list_files(srcdir, moduleFile)
    pattern  = r".jl$"
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
    filter!(filename->filename≠joinpath(PROJECT_ROOT,moduleFile),filelist)

    return filelist
end

