module PMP

using Polynomials

include("dampedrational.jl")
include("positivematrixwithprefactor.jl")

abstract type AbstractBootStrapProblem end

struct PolynomialMatrixProblem{VT<:AbstractVector{<:Number},PM<:AbstractMatrix{<:AbstractPMWP},PMV<:AbstractVector{PM}} <: AbstractBootStrapProblem
    # precision::Int this field should be encoded into VT's T 
    objective::VT
    normalization::VT
    positiveMatricesWithPrefactor::PMV
end

function PolynomialMatrixProblem(objective::VT, normalization::VT, positiveMatricesWithPrefactor::PMV) where {VT<:AbstractVector{<:Number},PM<:AbstractMatrix{<:AbstractPMWP},PMV<:AbstractVector{PM}}
    @assert length(objective) == length(normalization) == length(positiveMatricesWithPrefactor)
	return PolynomialMatrixProblem(objective, normalization, positiveMatricesWithPrefactor)
end

end