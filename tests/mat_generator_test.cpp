#include <gtest/gtest.h>
#include <opencv2/core/core.hpp>
#include <string>
#include "../sources/mat_generator.hpp"


class MatGeneratorTest : public ::testing::Test {
protected:

protected:
    MatGeneratorTest()
    {
    }

    ~MatGeneratorTest()
    {
    }

    virtual auto SetUp() -> void
    {
    }

    virtual auto TearDown() -> void
    {
    }

    static auto SetUpTestCase() -> void
    {
    }

    static auto TearDownTestCase() -> void
    {
    }
};

TEST_F(MatGeneratorTest, GeneratingMat)
{
    constexpr auto width    = 10;
    constexpr auto height   = 10;
    auto mat = MatGenerator::generateMat(width, height);

    ASSERT_EQ(width, mat.cols);
    ASSERT_EQ(height, mat.rows);
}
