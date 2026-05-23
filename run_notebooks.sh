#!/bin/bash
# Run all Texas football notebooks and save outputs in-place.
# Requires CFBD_API_KEY environment variable to be set.
# Usage: export CFBD_API_KEY="your-key" && bash run_notebooks.sh

if [ -z "$CFBD_API_KEY" ]; then
    echo "Error: CFBD_API_KEY not set"
    exit 1
fi

for nb in project_0_texas_football_eda.ipynb \
          project_1_texas_betting_analysis.ipynb \
          project_2_texas_coaching_eras.ipynb \
          project_3_texas_opponent_adjusted.ipynb \
          project_4_texas_recruiting_performance.ipynb \
          project_5_texas_win_probability.ipynb; do
    echo "=== Running $nb ==="
    jupyter nbconvert --to notebook --execute --inplace "$nb" --ExecutePreprocessor.timeout=600
    if [ $? -ne 0 ]; then
        echo "FAILED: $nb"
    else
        echo "OK: $nb"
    fi
    echo ""
    sleep 30
done

echo "Done. Commit and push with:"
echo "  git add . && git commit -m 'Add notebook outputs' && git push origin main"
