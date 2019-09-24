#include "stdlib.h"
#include "unity.h"

void setUp(void)
{
}

void tearDown(void)
{
}

void test_atoi_correct(void)
{
    TEST_ASSERT_EQUAL_INT(0, atoi("0"));
    TEST_ASSERT_EQUAL_INT(100, atoi("100"));
}

void test_atoi_wrong(void)
{
    TEST_ASSERT_EQUAL_INT(0, atoi("0"));
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(test_atoi_correct);
    RUN_TEST(test_atoi_wrong);

    return UNITY_END();
}
