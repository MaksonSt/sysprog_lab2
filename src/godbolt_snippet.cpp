// The hot function from matmul.cpp, for comparing assembly on godbolt.org.
// Left pane: -O0.  Right pane: -O3 -march=znver3 (Zen 3, same as Ryzen 7 7735HS).
#include <vector>

using Matrix = std::vector<float>;

void multiply(const Matrix& a, const Matrix& b, Matrix& c, int n) {
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
