# c base^x/prod_i (x-poles[i])
#TODO what did prefactors look like in SDPB after 3.0.0?
struct DampedRational{T<:Number, VT<:AbstractVector{T}}
	constant::T
	base::T
	poles::VT
end

get_base(dr::DampedRational{T,VT}) where {T<:Number, VT<:AbstractVector{T}} = dr.base

get_constant(dr::DampedRational{T,VT}) where {T<:Number, VT<:AbstractVector{T}} = dr.constant

get_poles(dr::DampedRational{T,VT}) where {T<:Number, VT<:AbstractVector{T}} = dr.poles

function is_constant(dr::DampedRational{T,VT}) where {T<:Number, VT<:AbstractVector{T}}
	return length(dr.poles) == 0 && isone(get_base(dr))
end

eval(dr::DampedRational{T,VT}, x::T, min_pole_distance::T) where {T<:Number,VT<:AbstractVector{T}} = get_constant(dr) * get_base(dr)^x / mapreduce(pole -> abs(x - pole) > min_pole_distance ? (x - pole) : (min_pole_distance * (iszero(x - pole) ? one(T) : sign(x - pole))), *, get_poles(dr); init=one(T))
