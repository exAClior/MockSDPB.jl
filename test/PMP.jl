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

@testset "Damped Rational" begin
	constant = one(ArbFloat)
	base = one(ArbFloat)
    poles = ArbFloat[1.0, 2.0, 3.0, 4.0]
	dr =  MockSDPB.PMP.DampedRational(constant, base, ArbFloat[])
	@test MockSDPB.PMP.is_constant(dr) 

	@test MockSDPB.PMP.eval(dr, zero(ArbFloat), ArbFloat(1e-10)) ≈ constant 

	dr = MockSDPB.PMP.DampedRational(constant, base, poles)

	@test MockSDPB.PMP.eval(dr, zero(ArbFloat), ArbFloat(1e-10))  ≈ one(ArbFloat) / ArbFloat(24) 

	@test MockSDPB.PMP.eval(dr, one(ArbFloat), ArbFloat(1e-10)) ≈ one(ArbFloat) / ArbFloat(1e-10) / ArbFloat(-6) 

end

@testset "PMP Construction" begin

end

@testset "3.4 Example in SDPB Manual" begin
	#TODO reproduce Figure 1 in the SDPB Manual
end