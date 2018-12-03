cd(@__DIR__)

task = open("day1_input.txt") do f
    read(f, String)
end

lines = tryparse.(Int, split(task, "\n"))
filter!(x->x != nothing, lines)

# Part 1

println(reduce((+), lines))

# Part 2

import Base.Iterators: cycle

accum = 0
seen = Set{Int}(0)
for l in cycle(lines)
    global accum += l
    if accum in seen
        println(accum)
        break
    else
        push!(seen, accum)
    end
end
