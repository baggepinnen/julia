# This file is a part of Julia. License is MIT: https://julialang.org/license

"""
    Base.Constants

Module containing the mathematical constants
π, e, γ, catalan and φ.
"""
module Constants

export π, pi, e, eu, γ, eulergamma, catalan, φ, golden

Base.@irrational π        3.14159265358979323846  pi
Base.@irrational e        2.71828182845904523536  exp(big(1))
Base.@irrational γ        0.57721566490153286061  euler
Base.@irrational catalan  0.91596559417721901505  catalan
Base.@irrational φ        1.61803398874989484820  (1+sqrt(big(5)))/2

# aliases
"""
    pi
    π

The constant pi.

```jldoctest
julia> pi
π = 3.1415926535897...
```
"""
π, const pi = π

"""
    e
    eu

The constant e.

```jldoctest
julia> e
e = 2.7182818284590...
```
"""
e, const eu = e

"""
    γ
    eulergamma

Euler's constant.

```jldoctest
julia> eulergamma
γ = 0.5772156649015...
```
"""
γ, const eulergamma = γ

"""
    φ
    golden

The golden ratio.

```jldoctest
julia> golden
φ = 1.6180339887498...
```
"""
φ, const golden = φ

"""
    catalan

Catalan's constant.

```jldoctest
julia> catalan
catalan = 0.9159655941772...
```
"""
catalan

# special behaviors

# use exp for e^x or e.^x, as in
#    ^(::Irrational{:e}, x::Number) = exp(x)
# but need to loop over types to prevent ambiguity with generic rules for ^(::Number, x) etc.
for T in (Irrational, Rational, Integer, Number)
    Base.:^(::Irrational{:e}, x::T) = exp(x)
end

Base.log(::Irrational{:e}) = 1 # use 1 to correctly promote expressions like log(x)/log(e)
Base.log(::Irrational{:e}, x::Number) = log(x)

end
