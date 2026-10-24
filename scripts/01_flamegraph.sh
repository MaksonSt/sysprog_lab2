#!/usr/bin/env bash
# Item 1: builds a CPU FlameGraph (Brendan Gregg's method).
# Usage: ./scripts/01_flamegraph.sh [O0|O3]   (default: O0 and O3)
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p results

FG="${FLAMEGRAPH_DIR:-/opt/FlameGraph}"
if [ ! -f "$FG/flamegraph.pl" ]; then
    FG="$HOME/FlameGraph"
    [ -d "$FG" ] || git clone https://github.com/brendangregg/FlameGraph "$FG"
fi

N=1024
VARIANTS="${1:-O0 O3}"

for v in $VARIANTS; do
    echo "=== FlameGraph for $v ==="
    # 1) sample call stacks 4999 times per second (-g = with call stacks).
    #    High rate because the O3 version runs only ~0.1 s.
    perf record -F 4999 -g -o "results/perf_$v.data" "build/matmul_$v" $N 1
    # 2) dump samples as text, 3) fold stacks into one line each, 4) draw SVG
    perf script -i "results/perf_$v.data" > "results/out_$v.perf"
    "$FG/stackcollapse-perf.pl" "results/out_$v.perf" > "results/out_$v.folded"
    "$FG/flamegraph.pl" --title "matmul $v (n=$N)" "results/out_$v.folded" \
        > "results/flamegraph_$v.svg"
    echo "-> results/flamegraph_$v.svg"
done
