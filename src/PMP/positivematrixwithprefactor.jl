abstract type AbstractPMWP end

# probably just want F <: Number, but how to specify others?
struct PositiveMatrixWithPrefactor{F<:Number, FV<:AbstractVector{F}, DR<:DampedRational{F},PV<:AbstractVector{<:AbstractPolynomial},PMV<:AbstractVector{<:AbstractMatrix{<:AbstractPolynomial}}} <: AbstractPMWP 
	prefactor::DR
	reducedPrefactor::DR
	polynomials::PMV
	samplePoints::FV
	sampleScalings::FV
	reducedSampleScalings::FV
	bilinearBasis_0::PV
	bilinearBasis_1::PV

	function PositiveMatrixWithPrefactor(prefactor::DR, reducedPrefactor::DR, polynomials::PMV, samplePoints::FV, sampleScalings::FV, reducedSampleScalings::FV, bilinearBasis_0::PV, bilinearBasis_1::PV) where {F<:Number,DR<:DampedRational{F}, PV<:AbstractVector{<:AbstractPolynomial}, PMV<:AbstractVector{<:AbstractMatrix{<:AbstractPolynomial}}, FV<:AbstractVector{F}}
		return new{F,FV,DR,PV,PMV}(prefactor, reducedPrefactor, polynomials, samplePoints, sampleScalings, reducedSampleScalings, bilinearBasis_0, bilinearBasis_1)
	end
	#TODO bilinearBasis why is it obsolete
end

function get_polynomial_matrices(pmwp::PositiveMatrixWithPrefactor, i::Int)
	return pmwp.polynomials[i]
end


function get_max_degree(pmwp::PositiveMatrixWithPrefactor)
	return maximum([maximum(degree.(get_polynomial_matrices(pmwp, i))) for i in 1:length(pmwp.polynomials)])
end
