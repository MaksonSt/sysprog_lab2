#!/usr/bin/env bash
# Builds two versions of the program:
#   O0 - no optimization (baseline, "before")
#   O3 - max optimization for this CPU (-march=native: AVX2 + FMA), "after"
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p build results

FLAGS="-std=c++17 -g -fno-omit-frame-pointer"

g++ $FLAGS -O0 src/matmul.cpp -o build/matmul_O0
# -fopt-info-vec-optimized: the compiler reports which loops it vectorized
g++ $FLAGS -O3 -march=native -fopt-info-vec-optimized src/matmul.cpp \
    -o build/matmul_O3 2> results/O3_vectorization_report.txt

echo "Built: $(ls build | tr '\n' ' ')"
echo "Vectorization report (O3):"
cat results/O3_vectorization_report.txt
