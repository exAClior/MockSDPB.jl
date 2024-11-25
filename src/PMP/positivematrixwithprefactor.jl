abstract type AbstractPMWP end

struct PositiveMatrixWithPrefactor{F<:Number, DR<:DampedRational{F},PM<:AbstractMatrix{<:AbstractPolynomial},PV<:AbstractVector{<:AbstractPolynomial}} <: AbstractPMWP 
	prefactor::DR
	reducedPrefactor::DR
	polynomials::PM
	samplePoints
	sampleScalings
	reducedSampleScalings
	bilinearBasis_0::PV
	bilinearBasis_1::PV
	#TODO bilinearBasis why is it obsolete
end

function PositiveMatrixWithPrefactor(prefactor::DR, reducedPrefactor::DR, polynomials::PM, samplePoints::PV, sampleScalings::PV, reducedSampleScalings::PV, bilinearBasis_0::PV, bilinearBasis_1::PV)
	# how are samplePoints, sampleScalings, reducedSampleScalings, bilinearBasis_0, bilinearBasis_1 computed if not provided?
	return PositiveMatrixWithPrefactor(prefactor, reducedPrefactor, polynomials, samplePoints, sampleScalings, reducedSampleScalings, bilinearBasis_0, bilinearBasis_1)
end
