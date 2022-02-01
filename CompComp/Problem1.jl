using LinearAlgebra
using Statistics
using Plots


##############
#=  Part A  =#
##############

function gettime(functotime,args)
"""
Description:
    - this function records and returns the runtime of other functions
Parameters: 
    - functotime is the function you want to time
    - args are the associated arguments (must be a tuple)
Returns:
    - the time taken for functotime to execute with args as its arguments
"""
    timeelapsed = @timed begin
        functotime(args...)

    end

    return timeelapsed[2]

end

##############
#=  Part B  =#
##############

function doinversemethod(dim::Int64,numruns::Int64)
"""
Description:
    - this function returns the average runtime of computing the following:
        inv(A)*b
    a total of numruns times (where A is a random dim x dim matrix and b is 
    a random dim x 1 column vector) 
Parameters: 
    - dim is the single dimenison of the matrix (which is square) and the length
    of the column vector
    - numruns is the number of times the above line of code will be performed and
    over which the execution time will be averaged
Returns:
    - the average time for numruns executions of:
        inv(A)*b 
"""
    times = Array{Float64,1}()

    for i in 1:numruns
        A = rand(dim,dim)
        b = rand(dim)
        append!(times,gettime(*,(inv(A),b)))

    end

    return mean(times)    

end

println("Average runtime for 1000 iterations of the inverse method: ",
        doinversemethod(100,1000))


##############
#=  Part C  =#
##############

function dolinearsolvemethod(dim::Int64,numruns::Int64)
"""
Description:
    - this function returns the average runtime of computing of the following:
        \\(A,b)
    a total of numruns times (where A is a random dim x dim matrix and b is a 
    random dim x 1 column vector) 
Parameters: 
    - dim is the single dimenison of the matrix (which is square) and the length
    of the column vector
    - numruns is the number of times the above line of code will be performed and
    over which the execution time will be averaged
Returns:
    - the average time for numruns executions of:
        \\(A,b)
"""
    times = Array{Float64,1}()

    for i in 1:numruns
        A = rand(dim,dim)
        b = rand(dim)
        append!(times,gettime(\,(A,b)))

    end

    return mean(times)    

end

println("Average runtime for 1000 iterations of the linear solve method: ",
        dolinearsolvemethod(100,1000))

##############
#=  Part D  =#
##############

dims = 100:1100
inversetimes = doinversemethod.(dims,1) 
linearsolvetimes = dolinearsolvemethod.(dims,1)
plot(dims, inversetimes,  
     labels = "Inverse", 
     xaxis=:log, 
     yaxis=:log)
plot!(dims, linearsolvetimes, 
     labels = "Linear Solve", 
     xaxis=:log, 
     yaxis=:log, 
     xlims = (first(dims), last(dims)),
     xlabel = "Matrix Dimension",
     ylabel = "Execution Time (s)")
