#!/usr/bin/env bash
# Item 4.1: assembly of multiply() before and after optimization.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p results

summary=results/asm_summary.txt
: > "$summary"

for v in O0 O3; do
    out="results/asm_multiply_$v.s"
    # disassemble, keep only the multiply() function
    # (at -O3 it is called "multiply(...) [clone .isra.0]")
    objdump -d -C -M intel --no-show-raw-insn "build/matmul_$v" \
        | awk '/^[0-9a-f]+ <multiply\(/{p=1} p&&/^$/{p=0} p' > "$out"

    {
        echo "=== $v ==="
        echo "instructions in multiply():  $(grep -cP '^\s+[0-9a-f]+:' "$out")"
        echo "calls (e.g. vector::operator[]): $(grep -c 'call' "$out")"
        echo "scalar float ops (...ss, 1 float):     $(grep -cE '\s(v?movss|v?mulss|v?addss|vfmadd[0-9]+ss)\s' "$out")"
        echo "packed ops on xmm (...ps, 4 floats):   $(grep -E '\s(v?movups|v?mulps|v?addps|vfmadd[0-9]+ps)\s' "$out" | grep -c xmm)"
        echo "packed ops on ymm (AVX, 8 floats):     $(grep -c ymm "$out")"
        echo "FMA instructions (vfmadd...):          $(grep -c vfmadd "$out")"
        echo
    } >> "$summary"
done

cat "$summary"
echo "Full listings: results/asm_multiply_O0.s, results/asm_multiply_O3.s"
