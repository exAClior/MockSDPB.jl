using Test, MockSDPB

using ArbNumerics
using Polynomials

@testset "PMP Construction" begin

    dr = MockSDPB.PMP.DampedRational(one(ArbFloat), one(ArbFloat),ArbFloat[])

    polynomial_matrices = [[Polynomial(ones(ArbFloat, 3)) Polynomial(ones(ArbFloat, 4)); Polynomial(ones(ArbFloat, 5)) Polynomial(ones(ArbFloat, 6))], [Polynomial(ones(ArbFloat, 3)) Polynomial(ones(ArbFloat, 4)); Polynomial(ones(ArbFloat, 5)) Polynomial(ones(ArbFloat, 7))]]


	poly_vec = [Polynomial([i == j ? one(ArbFloat) : zero(ArbFloat) for i in 0:4]) for j in 0:4]

    pmpf = MockSDPB.PMP.PositiveMatrixWithPrefactor(dr, dr, polynomial_matrices, zeros(ArbFloat, 4), zeros(ArbFloat, 4), zeros(ArbFloat, 4), poly_vec, poly_vec)

	@test MockSDPB.PMP.get_max_degree(pmpf) == 6


end

@testset "Constructors" begin
	# Damped Rational
end

@testset "Damped Rational" begin
	constant = one(ArbFloat)
	base = one(ArbFloat)
    poles = ArbFloat[1.0, 2.0, 3.0, 4.0]
	dr =  MockSDPB.PMP.DampedRational(constant, base, ArbFloat[])
	@test MockSDPB.PMP.is_constant(dr) 

	dr = MockSDPB.PMP.DampedRational(ArbFloat)
	@test MockSDPB.PMP.eval(dr, one(ArbFloat), ArbFloat(1e-10)) ≈ one(ArbFloat) / ArbFloat(ℯ) 

	@test MockSDPB.PMP.eval(dr, zero(ArbFloat), ArbFloat(1e-10)) ≈ constant 

	dr = MockSDPB.PMP.DampedRational(constant, base, poles)

	@test MockSDPB.PMP.eval(dr, zero(ArbFloat), ArbFloat(1e-10))  ≈ one(ArbFloat) / ArbFloat(24) 

	@test MockSDPB.PMP.eval(dr, one(ArbFloat), ArbFloat(1e-10)) ≈ one(ArbFloat) / ArbFloat(1e-10) / ArbFloat(-6) 
end


@testset "3.4 Example in SDPB Manual" begin
	#TODO reproduce Figure 1 in the SDPB Manual
end