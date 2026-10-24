#include <chrono>
#include <cstdio>
#include <cstdlib>
#include <random>
#include <vector>

using Matrix = std::vector<float>;

static void fill_random(Matrix& m, std::mt19937& gen) {
    std::uniform_real_distribution<float> dist(-1.0f, 1.0f);
    for (std::size_t i = 0; i < m.size(); ++i) {
        m[i] = dist(gen);
    }
}

__attribute__((noinline))
static void multiply(const Matrix& a, const Matrix& b, Matrix& c, int n) {
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            c[i * n + j] = 0.0f;
        }
        for (int k = 0; k < n; ++k) {
            const float aik = a[i * n + k];
            for (int j = 0; j < n; ++j) {
                c[i * n + j] += aik * b[k * n + j];
            }
        }
    }
}

__attribute__((noinline))
static double checksum(const Matrix& m) {
    double sum = 0.0;
    for (float x : m) {
        sum += x;
    }
    return sum;
}

int main(int argc, char** argv) {
    const int n = argc > 1 ? std::atoi(argv[1]) : 1024;
    const int reps = argc > 2 ? std::atoi(argv[2]) : 1;

    std::mt19937 gen(42);
    Matrix a(static_cast<std::size_t>(n) * n);
    Matrix b(a.size());
    Matrix c(a.size());
    fill_random(a, gen);
    fill_random(b, gen);

    const auto start = std::chrono::steady_clock::now();
    double sum = 0.0;
    for (int r = 0; r < reps; ++r) {
        multiply(a, b, c, n);
        sum += checksum(c);
    }
    const auto end = std::chrono::steady_clock::now();

    const double seconds = std::chrono::duration<double>(end - start).count();
    const double gflops = 2.0 * n * n * n * reps / seconds / 1e9;
    std::printf("n=%d reps=%d checksum=%.4f time=%.3f s speed=%.2f GFLOPS\n",
                n, reps, sum, seconds, gflops);
    return 0;
}
