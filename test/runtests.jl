using RecursiveFileList
using Test

const TEST_ROOT = @__DIR__

@testset "RecursiveFileList.jl" begin
    
    testFolder = joinpath(TEST_ROOT, "testFolder")
    moduleFile = "RecursiveFileList.jl"
    # Get the files to include
    filelist = RecursiveFileList.list_files(testFolder, moduleFile)
    @test joinpath(testFolder, "Folder1", "file1.jl") in filelist
    @test joinpath(testFolder, "Folder1", "SubFolder11", "file11.jl") in filelist
    @test joinpath(testFolder, "Folder2", "file2.jl") in filelist
    @test joinpath(testFolder, "Folder2", "SubFolder21", "file21.jl") in filelist
    @test joinpath(testFolder, "Folder2", "SubFolder22", "file22.jl") in filelist

end
