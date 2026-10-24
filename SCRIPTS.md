## perf_setup.sh

Дає perf доступ до лічильників процесора. У WSL це злітає після перезапуску, тому запускаю на початку.

    sudo sysctl -w kernel.perf_event_paranoid=-1
    sudo sysctl -w kernel.kptr_restrict=0

## build.sh

Збирає програму у двох варіантах: O0 (без оптимізації) і O3 під мій процесор.

    g++ -std=c++17 -g -fno-omit-frame-pointer -O0 src/matmul.cpp -o build/matmul_O0
    g++ -std=c++17 -g -fno-omit-frame-pointer -O3 -march=native -fopt-info-vec-optimized src/matmul.cpp -o build/matmul_O3

-g і -fno-omit-frame-pointer потрібні, щоб perf бачив назви функцій і стек викликів.
-march=native дозволяє використати AVX2, а -fopt-info-vec-optimized показує, що цикл векторизувався.

## 01_flamegraph.sh  (п. 1, 4.3)

Будує FlameGraph за 4 кроки:

    perf record -F 4999 -g -o results/perf_O0.data build/matmul_O0 1024 1
    perf script -i results/perf_O0.data > results/out_O0.perf
    /opt/FlameGraph/stackcollapse-perf.pl results/out_O0.perf > results/out_O0.folded
    /opt/FlameGraph/flamegraph.pl results/out_O0.folded > results/flamegraph_O0.svg

1. perf record записує, яка функція виконувалась (4999 разів за секунду, -g разом зі стеком)
2. perf script переводить запис у текст
3. stackcollapse згортає кожен стек в один рядок
4. flamegraph.pl малює svg

Для оптимізованої версії: ./scripts/01_flamegraph.sh O3

## 02_stats.sh  (п. 2, 4.2)

Три команди підряд:

    /usr/bin/time --verbose build/matmul_O0 1024 1
    perf stat -d build/matmul_O0 1024 1
    perf record -g -o results/perf_record_O0.data build/matmul_O0 1024 1
    perf report -i results/perf_record_O0.data --stdio --no-children

- time показує час, пам'ять і page faults
- perf stat показує лічильники процесора: такти, інструкції, промахи кешу
- perf record + perf report показують, у яких функціях програма проводить найбільше часу

Для O3: ./scripts/02_stats.sh O3

## 03_energy.ps1  (п. 3, 4.4)

(Get-Counter '\Energy Meter(rapl_package0_pkg)\Energy').CounterSamples.RawValue

Лічильник рахує в пВт·год, тому в джоулі: * 3600 / 1e12

powershell -ExecutionPolicy Bypass -File scripts\03_energy.ps1 -Variants O0,O3 -Repeats 1

## 04_asm.sh  (п. 4.1)

Дістає асемблер функції multiply для O0 і O3 і рахує, скільки там звичайних інструкцій, а скільки векторних (ymm, vfmadd).

    objdump -d -C -M intel --no-show-raw-insn build/matmul_O3 > ...
    grep -c ymm results/asm_multiply_O3.s
    grep -c vfmadd results/asm_multiply_O3.s

Головний цикл O3:

    grep -n -A3 "vbroadcastss" results/asm_multiply_O3.s
