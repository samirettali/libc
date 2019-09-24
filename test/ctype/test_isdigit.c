#include "unity.h"
#include "ctype.h"

void setUp(void)
{
}

void tearDown(void)
{
}

void test_isdigit_correct(void)
{
    TEST_ASSERT_GREATER_THAN_INT(0, isdigit('0'));
}

void test_isdigit_wrong(void)
{
    TEST_ASSERT_EQUAL_INT(0, isdigit('n'));
}

int main(void)
{
    UNITY_BEGIN();

    RUN_TEST(test_isdigit_correct);
    RUN_TEST(test_isdigit_wrong);

    return UNITY_END();
}
