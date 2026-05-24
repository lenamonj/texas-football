# Texas Football Analytics - Project Status

## What this is
Six Jupyter notebooks analyzing Texas Longhorns football (2015-2025) using the College Football Data (CFBD) API.

## Notebooks
| # | File | Status |
|---|------|--------|
| 0 | project_0_texas_football_eda.ipynb | Done - outputs saved |
| 1 | project_1_texas_betting_analysis.ipynb | Done - outputs saved |
| 2 | project_2_texas_coaching_eras.ipynb | Needs execution |
| 3 | project_3_texas_opponent_adjusted.ipynb | Needs execution |
| 4 | project_4_texas_recruiting_performance.ipynb | Needs execution |
| 5 | project_5_texas_win_probability.ipynb | Needs execution |

## What needs to happen
1. Set the env var: `$env:CFBD_API_KEY = "YEFaPC33rtmiiK9gLINyEL4rIACHOuATHfWt9LLvkrecGFHb817upyrBsbVy7cRC"`
2. Execute notebooks 2, 3, 4, 5 in order with `jupyter nbconvert --to notebook --execute --inplace --ExecutePreprocessor.timeout=600 <file>`
3. Commit and push so GitHub renders the outputs

## Why we stopped (May 2026)
CFBD API returned "Monthly call quota exceeded" - the free tier monthly limit was burned through during development/testing. Quota should reset around June 1.

## Changes already made (uncommitted)
Notebooks 2-5 had their `cfbd_get()` helper updated:
- Pre-request throttle: 1.0s -> 2.5s
- Retry attempts: 5 -> 8

These changes are already in the working tree and should be kept - they help avoid per-second rate limits during execution.

## After execution
- Verify all 6 notebooks show outputs: `python -c "import json; ..."`
- `git add . && git commit -m "Add outputs for all notebooks" && git push`
