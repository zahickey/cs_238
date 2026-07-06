# Algorithm of the Day

One algorithm a day, implemented from scratch in Julia and Python, with
reproducible synthetic data. See `CLAUDE.md` for the conventions Claude Code
follows, and `progress.md` for the running log.

## Structure
```
algorithms/
  01-algorithm-name/
    julia/algorithm.jl
    python/algorithm.py
    data.py
    README.md
  02-algorithm-name/
    ...
textbook/        # optional: PDF/notes for reference
julia/            # shared Julia project files (Project.toml, common utils)
python/           # shared Python project files (requirements.txt, common utils)
```

## Setup

### Python
```
cd python
python -m venv venv
source venv/bin/activate   # or venv\Scripts\activate on Windows
pip install -r requirements.txt
```

### Julia
```
cd julia
julia --project=. -e "using Pkg; Pkg.instantiate()"
```

## Daily workflow
1. Open a terminal in this repo folder.
2. Run `claude`
3. Tell it the algorithm (and chapter, if you have it), e.g.:
   > "Today's algorithm is Dijkstra's shortest path, chapter 4."
4. Review the output, run both implementations, done.
