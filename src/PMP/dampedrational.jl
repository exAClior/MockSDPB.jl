# c base^x/prod_i (x-poles[i])
#TODO what did prefactors look like in SDPB after 3.0.0?
struct DampedRational{T<:Number, VT<:AbstractVector{T}}
	constant::T
	base::T
	poles::VT
end