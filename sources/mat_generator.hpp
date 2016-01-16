#include <opencv2/core/core.hpp>


class MatGenerator {
public:
    MatGenerator() = delete;
    MatGenerator(const MatGenerator& rhs) = delete;
    ~MatGenerator() = delete;
    auto operator=(const MatGenerator& rhs) -> MatGenerator& = delete;

    static auto generateMat(size_t width, size_t height) -> cv::Mat;
};


auto MatGenerator::generateMat(size_t width, size_t height) -> cv::Mat
{
    return cv::Mat(cv::Size(width, height), CV_8UC3, cv::Scalar::all(0));
}

