# GeneralizedEigenvalues

[![Build Status](https://github.com/daanhb/GeneralizedEigenvalues.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/daanhb/GeneralizedEigenvalues.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/daanhb/GeneralizedEigenvalues.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/daanhb/GeneralizedEigenvalues.jl)

A package for the computation of generalized eigenvalues. These are the values $\lambda$ satisfying $Ax = \lambda B x$ for two given matrices $A$ and $B$.

The package is implemented in Julia, hence the computation is generic. In particular the package implements the routine `generalized_eigvals!` and defines
```julia
LinearAlgebra.eigvals!(A::AbstractMatrix{T}, B::AbstractMatrix{T}; kwargs...) where {T <: Number} =
    generalized_eigvals!(A, B; kwargs...)
```

# How to use

```julia
julia> using LinearAlgebra, GeneralizedEigenvalues

julia> A = rand(BigFloat, 4, 4); B = rand(BigFloat, 4, 4);

julia> eigvals(A, B)
4-element Vector{Complex{BigFloat}}:
 -1.177518817295070669604971559985944058233157194009907413729886903454997250952444 - 1.976184214307596326495074265168079377563480081756809493383013442251886672508137im
 -1.177518817295070669604971559985944058233157194009907413729886903454997250952444 + 1.976184214307596326495074265168079377563480081756809493383013442251886672508137im
 0.1023675480850108409048085676574292182205270437393180274439073767290659164355778 + 0.0im
 0.8914521716628669627775377453285786522762398515948895489745740716735863657953472 + 0.0im
 ```
 