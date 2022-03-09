# Import necessary packages
using Plots

# Set parameters for first part
a = -pi
b = pi
N = 100
h = (b - a)/N

# Make base array
x = collect(a:h:b)

# Compute the derivative of sin(x)
y = sin.(x)
yp = (sin.(x[3:end]) - sin.(x[1:end-2]))/(2*h)

# Plot error in derivative
plot(x[1:end-2],yp - cos.(x[1:end-2]),label = "")
title!("Error in Unoptimized Derivative")
xlabel!("x") 
ylabel!("y'(x) - cos(x)")

# Set parameters for first part
a = -pi
b = pi
N = 100
h = (b - a)/N

# Make base array
x = collect(a:h:b)

# Compute the derivative of sin(x)
y = sin.(x)
yp = (sin.(x[3:end]) - sin.(x[1:end-2]))/(2*h)

# Plot error in derivative
plot(x[1:end-2],yp - cos.(x[1:end-2]),label = "")
title!("Error in Optimized derivative")
xlabel!("x") 
ylabel!("y'(x) - cos(x)")
