using GeneralizedEigenvalues
using LinearAlgebra
using Test

function round_values(vals::AbstractVector{<:Complex}, digits)
    factor = 10^digits
    realpart = round.(Int, real(vals*factor)) / factor
    imagpart = round.(Int, imag(vals*factor)) / factor
    realpart + im*imagpart
end

@testset "GeneralizedEigenvalues.jl" begin
    A = rand(BigFloat, 4, 4)
    B = rand(BigFloat, 4, 4)
    vals = eigvals(Float64.(A), Float64.(B))
    genvals = eigvals(A, B)
    # we want to compare the set of eigenvalues but have to figure out how
    # they are sorted. Below is a workaround.
    roundedvals = round_values(vals, 10)
    roundedgenvals = round_values(genvals, 10)
    @test issubset(roundedvals, roundedgenvals)
    @test issubset(roundedgenvals, roundedvals)
end
