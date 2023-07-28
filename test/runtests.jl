using RecursiveFiles
using Test

const TEST_ROOT = @__DIR__

@testset verbose=true "RecursiveFiles.jl" begin

    @testset "All files pattern" begin
    
        testFolder = joinpath(TEST_ROOT, "testFolder")
        moduleFile = "TestRecursiveFiles.jl"

        # Get the recursive file list, including all files
        filelist = RecursiveFiles.list_files(testFolder)
        @test joinpath(testFolder, "Folder1", "file1.jl") in filelist
        @test joinpath(testFolder, "Folder1", "readme.md") in filelist
        @test joinpath(testFolder, "Folder1", "SubFolder11", "file11.jl") in filelist
        @test joinpath(testFolder, "Folder2", "file2.jl") in filelist
        @test joinpath(testFolder, "Folder2", "SubFolder21", "file21.jl") in filelist
        @test joinpath(testFolder, "Folder2", "SubFolder22", "file22.jl") in filelist
        @test joinpath(testFolder, "Folder2", "SubFolder22", "readme.md") in filelist
        @test joinpath(testFolder, moduleFile) in filelist

    end

    @testset "Julia files pattern" begin
        
        testFolder = joinpath(TEST_ROOT, "testFolder")
        moduleFile = "TestRecursiveFiles.jl"
        pattern = juliaFilesPattern

        # Get the recursive Julia files, excluding the moduleFile (e.g. to include)
        filelist = RecursiveFiles.list_files(testFolder; fileToRemove=moduleFile, pattern=pattern)
        @test joinpath(testFolder, "Folder1", "file1.jl") in filelist
        @test joinpath(testFolder, "Folder1", "SubFolder11", "file11.jl") in filelist
        @test joinpath(testFolder, "Folder2", "file2.jl") in filelist
        @test joinpath(testFolder, "Folder2", "SubFolder21", "file21.jl") in filelist
        @test joinpath(testFolder, "Folder2", "SubFolder22", "file22.jl") in filelist
        @test !(joinpath(testFolder, moduleFile) in filelist)

    end

    @testset "User-defined files pattern" begin
        
        testFolder = joinpath(TEST_ROOT, "testFolder")
        moduleFile = "TestRecursiveFiles.jl"
        pattern = ".md"

        # Get the recursive files of a certain use-defined type
        filelist = RecursiveFiles.list_files(testFolder; pattern=pattern)
        @test joinpath(testFolder, "Folder1", "readme.md") in filelist
        @test joinpath(testFolder, "Folder2", "SubFolder22", "readme.md") in filelist
        @test !(joinpath(testFolder, moduleFile) in filelist)

    end

end
