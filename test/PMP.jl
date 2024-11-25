using Test, MockSDPB

using ArbNumerics
using Polynomials

@testset "Constructors" begin
	# Damped Rational
	poles = rand(ArbFloat, 10)
	constant = rand(ArbFloat)
	base = rand(ArbFloat)

    dr = MockSDPB.PMP.DampedRational(constant, base, poles)

    polynomial_matrices = [Polynomial([rand(ArbFloat) for _ in 1:10]) for i in 1:10, j in 1:10]


	pmpf = MockSDPB.PMP.PositiveMatrixWithPrefactor(dr, dr, polynomial_matrices)
end

@testset "PMP Construction" begin

end