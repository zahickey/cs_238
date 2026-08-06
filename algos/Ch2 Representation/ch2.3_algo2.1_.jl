# Algorithm 2.1 — Types and functions for working with factors over discrete
# variables (Kochenderfer, Wheeler & Wray, "Algorithms for Decision Making",
# Chapter 2 "Representation", section 2.3 "Joint Distributions", p.26).
#
# A "factor" is a function from a variable assignment to a real number. When
# every value is nonnegative and the factor is normalized, it represents a
# probability distribution/table (hence "probability tables"). This file is
# transcribed directly from the textbook's Algorithm 2.1 box, with added
# comments explaining what each piece does.
#
# Running example used throughout these comments (same one as the companion
# notebook, ../2.1 Probability Tables/probability_tables.ipynb): three binary
# variables, rain, traffic, and late, telling a small story where rain makes
# heavy traffic more likely, and heavy traffic makes being late more likely.
# States are 1-indexed per Julia/the book's convention:
#   rain:    1 = no rain,  2 = rain
#   traffic: 1 = light,    2 = heavy
#   late:    1 = on time,  2 = late

# `product` gives the Cartesian product of several collections/iterators
# (e.g. product(1:2, 1:3) yields every (a,b) pair). The book imports this
# from Base.Iterators for use inside `assignments` below.
using Base.Iterators: product

# --- Variable -----------------------------------------------------------
# A discrete random variable. It has a name (a Symbol, e.g. :x) and a range
# r: it can take on integer values 1, 2, ..., r.
#
# e.g. rain = Variable(:rain, 2)  # a binary variable: states 1 and 2
struct Variable
    name::Symbol
    r::Int # number of possible values
end

# --- Assignment -----------------------------------------------------------
# A single assignment of values to variables, e.g. Dict(:x => 1, :y => 2)
# means "x is in its 1st state, y is in its 2nd state".
#
# e.g. Assignment(:rain => 2, :traffic => 2, :late => 1)
#      means "it's raining, traffic is heavy, but we're on time anyway"
const Assignment = Dict{Symbol,Int}

# --- FactorTable -----------------------------------------------------------
# The actual lookup table backing a factor: maps each Assignment to a real
# number (a probability, once normalized). Any assignment not present in the
# dictionary is implicitly 0 — this lets us skip storing zero entries.
#
# e.g. a factor table over rain, traffic, late might look like:
#   FactorTable(
#       Assignment(:rain => 1, :traffic => 1, :late => 1) => 0.35, # no rain, light traffic, on time
#       Assignment(:rain => 1, :traffic => 1, :late => 2) => 0.05, # no rain, light traffic, late
#       Assignment(:rain => 1, :traffic => 2, :late => 1) => 0.10, # no rain, heavy traffic, on time
#       Assignment(:rain => 1, :traffic => 2, :late => 2) => 0.10, # no rain, heavy traffic, late
#       Assignment(:rain => 2, :traffic => 1, :late => 1) => 0.05, # rain, light traffic, on time
#       Assignment(:rain => 2, :traffic => 1, :late => 2) => 0.03, # rain, light traffic, late
#       Assignment(:rain => 2, :traffic => 2, :late => 1) => 0.07, # rain, heavy traffic, on time
#       Assignment(:rain => 2, :traffic => 2, :late => 2) => 0.25, # rain, heavy traffic, late
#   )
# The eight entries above sum to 1, so this table is already a valid joint
# probability distribution over the three variables.
const FactorTable = Dict{Assignment,Float64}

# --- Factor -----------------------------------------------------------
# A factor over a set of variables: which variables it's defined over (vars),
# plus the table of values for assignments of those variables.
#
# e.g. Factor([rain, traffic, late], <the FactorTable shown above>)
struct Factor
    vars::Vector{Variable}
    table::FactorTable
end

# Convenience accessor: pull out just the names of the variables a factor is
# defined over, e.g. [:x, :y, :z].
variablenames(phi::Factor) = [var.name for var in phi.vars]

# Given a full assignment `a` (possibly over many variables) and a list of
# variable names we care about, `select` returns the sub-assignment
# restricted to just those names. This is used when a factor only depends on
# a subset of the variables present in some larger assignment.
select(a::Assignment, varnames::Vector{Symbol}) =
    Assignment(n => a[n] for n in varnames)

# Enumerate every possible assignment of a set of variables. For each
# variable v (with range 1:v.r), we take the Cartesian product across all
# variables' ranges, then zip each combination of values back up with the
# variable names to build an Assignment dict. This produces r1 * r2 * ... * rn
# total assignments — e.g. 3 binary variables gives 2^3 = 8 assignments.
function assignments(vars::AbstractVector{Variable})
    names = [var.name for var in vars]
    return vec([Assignment(n => v for (n, v) in zip(names, values))
                for values in product((1:v.r for v in vars)...)])
end

# Normalize a factor in place so its values sum to 1, turning an arbitrary
# nonnegative factor into a valid probability distribution. `!` is the Julia
# convention marking that this function mutates its argument.
function normalize!(phi::Factor)
    z = sum(p for (a, p) in phi.table)
    for (a, p) in phi.table
        phi.table[a] = p / z
    end
    return phi
end

# --- Example: constructing a discrete factor -----------------------------------------------------------
# The running example from the top of this file: three binary variables
# rain, traffic, late, and a joint factor phi(rain, traffic, late) built as a
# FactorTable (see the example table shown in the FactorTable comment above).
# The eight entries sum to 1, so this table is already a valid joint
# distribution (no normalize! call needed, but it's harmless to run).
function rain_traffic_late_factor()
    rain = Variable(:rain, 2)
    traffic = Variable(:traffic, 2)
    late = Variable(:late, 2)

    phi = Factor([rain, traffic, late], FactorTable(
        Assignment(:rain => 1, :traffic => 1, :late => 1) => 0.35,
        Assignment(:rain => 1, :traffic => 1, :late => 2) => 0.05,
        Assignment(:rain => 1, :traffic => 2, :late => 1) => 0.10,
        Assignment(:rain => 1, :traffic => 2, :late => 2) => 0.10,
        Assignment(:rain => 2, :traffic => 1, :late => 1) => 0.05,
        Assignment(:rain => 2, :traffic => 1, :late => 2) => 0.03,
        Assignment(:rain => 2, :traffic => 2, :late => 1) => 0.07,
        Assignment(:rain => 2, :traffic => 2, :late => 2) => 0.25,
    ))

    return phi
end
nothing
# --- Visualization -----------------------------------------------------------
# Plots the joint factor as a state-space graph: one node per full assignment
# (state) of the 2x2x2 state space, connected by an edge whenever two states
# differ in exactly one variable. That adjacency rule makes the 8 states of
# three binary variables into a cube graph, drawn here as a 2D wireframe cube
# (front face = late state 1, back face = late state 2). Node color and size
# both encode that state's probability (a single-hue sequential encoding,
# since probability is a magnitude, not a category). Only makes sense for a
# factor over exactly these three binary variables (rain, traffic, late),
# since it's built for this running example rather than being a generic
# Factor visualizer.
using Plots

function visualize(phi::Factor)
    # Hand-placed 2D layout: a front square (late=1) and a back square
    # (late=2) offset diagonally, giving the classic wireframe-cube look.
    base_xy = Dict((1, 1) => (0.0, 0.0), (2, 1) => (1.0, 0.0),
                   (2, 2) => (1.0, 1.0), (1, 2) => (0.0, 1.0))
    depth_offset = (0.45, 0.35)

    states = assignments(phi.vars)  # all 8 (rain, traffic, late) assignments
    pos = Dict{Assignment,Tuple{Float64,Float64}}()
    for a in states
        x, y = base_xy[(a[:rain], a[:traffic])]
        if a[:late] == 2
            x, y = x + depth_offset[1], y + depth_offset[2]
        end
        pos[a] = (x, y)
    end

    plt = plot(legend=false, axis=false, grid=false, ticks=false,
        aspect_ratio=:equal, title="State space: P(rain, traffic, late)")

    # Edges: every pair of states at Hamming distance 1 (differ in one variable).
    for i in 1:length(states), j in (i+1):length(states)
        a, b = states[i], states[j]
        if count(k -> a[k] != b[k], (:rain, :traffic, :late)) == 1
            (x1, y1), (x2, y2) = pos[a], pos[b]
            plot!(plt, [x1, x2], [y1, y2], color=:gray70, linewidth=1)
        end
    end

    # Nodes: color and size scale with probability (sequential, single hue).
    probs = [phi.table[a] for a in states]
    xs, ys = [pos[a][1] for a in states], [pos[a][2] for a in states]
    scatter!(plt, xs, ys;
        marker_z=probs, color=cgrad(:Blues), markersize=10 .+ 40 .* probs,
        markerstrokecolor=:white, markerstrokewidth=2, colorbar_title="probability")

    # Direct labels on each node: which state it is, and its probability.
    for a in states
        x, y = pos[a]
        label = "r$(a[:rain]) t$(a[:traffic]) l$(a[:late])\n$(round(phi.table[a], digits=2))"
        annotate!(plt, x, y - 0.14, text(label, 7, :black))
    end

    return plt
end

# --- Quick sanity check -----------------------------------------------------------
# Runs unconditionally on `include`/execution — deliberately not gated behind
# `abspath(PROGRAM_FILE) == @__FILE__`, since that guard only fires for a
# plain `julia thisfile.jl` process and stays false when VS Code's "Execute
# File"/"Execute active File" commands `include(...)` this file into the
# REPL instead — which would otherwise make `visualize` silently never run.
phi = rain_traffic_late_factor()

println("Variable names: ", variablenames(phi))

# Confirm the table already sums to 1 (a valid probability distribution).
total = sum(p for (a, p) in phi.table)
println("Sum of table values before normalize!: ", total)

normalize!(phi)
total_after = sum(p for (a, p) in phi.table)
println("Sum of table values after normalize!: ", total_after)

# Enumerate all assignments over rain and traffic only, ignoring late,
# using select to show how a sub-assignment is pulled out of a full one.
full_assignment = Assignment(:rain => 1, :traffic => 2, :late => 1)
println("Full assignment: ", full_assignment)
println("Selected (rain, traffic) only: ", select(full_assignment, [:rain, :traffic]))

println("All assignments of rain and traffic:")
for a in assignments([Variable(:rain, 2), Variable(:traffic, 2)])
    println("  ", a)
end

# Show the state-space graph in a window (nothing written to disk).
display(visualize(phi))
println("\nShowing state-space graph — press Enter to close.")
readline()
