using GeneralizedEigenvalues
using LinearAlgebra
using Test

@testset "GeneralizedEigenvalues.jl" begin
    A = rand(BigFloat, 4, 4)
    B = rand(BigFloat, 4, 4)
    vals = eigvals(Float64.(A), Float64.(B))
    genvals = eigvals(A, B)
    @test norm(vals-genvals) < 1e-10
end
