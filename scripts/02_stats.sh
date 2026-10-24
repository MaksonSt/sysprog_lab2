#!/usr/bin/env bash
# Item 2: execution statistics.
#   2.1 /usr/bin/time --verbose
#   2.2 perf stat -d
#   2.3 perf record + perf report
# Usage: ./scripts/02_stats.sh [O0|O3]   (default: both)
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p results

N=1024
VARIANTS="${1:-O0 O3}"

for v in $VARIANTS; do
    echo "=================== $v ==================="

    echo "--- 2.1 /usr/bin/time --verbose ---"
    /usr/bin/time --verbose "build/matmul_$v" $N 1 2>&1 | tee "results/time_$v.txt"

    echo "--- 2.2 perf stat -d ---"
    perf stat -d "build/matmul_$v" $N 1 2>&1 | tee "results/perf_stat_$v.txt"

    echo "--- 2.3 perf record + perf report ---"
    perf record -g -o "results/perf_record_$v.data" "build/matmul_$v" $N 1
    perf report -i "results/perf_record_$v.data" --stdio --no-children \
        --sort symbol --percent-limit 0.5 2>/dev/null > "results/perf_report_$v.txt"
    head -60 "results/perf_report_$v.txt"
done

echo
echo "Interactive view: perf report -i results/perf_record_O0.data"
