# Algorithm of the Day

## Purpose
Every day I pick one algorithm from a textbook and ask you to implement it,
in both Julia and Python. The goal is deep understanding through
implementation, not speed — take the time to get the algorithm right.

## Textbook
<!-- Fill this in: title, edition, and where the PDF/notes live if you have them -->
Title:
Edition:
Reference material: see `textbook/` folder if present.

## Workflow (every session)
1. Read `progress.md` to see what's already been implemented — never
   re-implement something already logged there unless I explicitly ask
   for a revision.
2. I'll name the algorithm and (usually) the chapter/section. If I don't
   give you the chapter, ask which chapter it's from before starting —
   don't guess and risk implementing the wrong variant.
3. Create a new folder: `algorithms/NN-algorithm-name/` (NN = next number,
   zero-padded, e.g. `01-value-iteration/`).
4. Inside that folder:
   - `julia/algorithm.jl` — the implementation
   - `python/algorithm.py` — the implementation
   - `data.py` (or `.jl`) — synthetic data generator, ALWAYS with a fixed
     random seed (default seed: 42) so results are reproducible without
     regenerating data each run
   - `README.md` — 3-5 sentences: what the algorithm does, its
     complexity, and any assumptions/simplifications made for this
     implementation
5. Append one line to `progress.md`: date, number, algorithm name, chapter.
6. Run both implementations and confirm they produce matching/sane output
   before considering the day done.

## Code style
- Flat, well-commented code over deeply nested/abstracted implementations.
  Prefer clarity over cleverness — this is for learning, not production.
- Python: type hints on function signatures, docstrings on every function.
- Julia: standard Julia conventions (CamelCase types, snake_case functions),
  minimal external dependencies unless the algorithm genuinely needs them.
- Every synthetic dataset generator must accept a `seed` parameter and
  default to a fixed value so re-running produces identical data.

## What NOT to do
- Don't implement multiple algorithms in one session unless I ask.
- Don't refactor previous days' code unless I explicitly ask for it.
- Don't skip the synthetic-data step even for algorithms that don't
  obviously need data (e.g. sorting) — generate a repeatable test case.
