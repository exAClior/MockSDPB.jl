abstract type AbstractBootStrapProblem end

struct PolynomialMatrixProblem{VT<:AbstractVector{<:Number}, MP<:AbstractMatrix{Polynomial}, VMV<:AbstractVector{MP}} <: AbstractBootStrapProblem
	a::VT
	n::VT
	W_nj::VMV
end

function PolynomialMatrixProblem(objective::VT, normalization::VT, W_nj::VMP) where {VT<:AbstractVector{<:Number}, MP<:AbstractMatrix{Polynomial}, VMP<:AbstractVector{MP}}
	@assert length(objective) == length(normalization) == length(W_nj)

	
end

function convert2SDP(pmp::PolynomialMatrixProblem)

end
