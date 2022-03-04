# Import necessary packages
using Plots

# Set parameters for first part
a = -pi
b = pi
N = 100
h = (a - b)/N

# Make base array
x = collect(a:h:b)

# Compute the derivative of sin(x)
y = sin.(x)
yp = (sin.(x[3:end]) - sin.(x[1:end-3]))/(2*h)

# Plot error in derivative
println(y)
