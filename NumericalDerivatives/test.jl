using Plots

array = []

for i in 1:1000000
    append!(array,i)
end

array = array.^2

plot(array)