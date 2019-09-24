#include "stdlib.h"

long atol(const char *str)
{
    int neg = 0;
    long val = 0;

    switch (*str) {
        case '-':
            neg = 1;
        case '+':
            str++;
        default:
            break;
    }

    while (isdigit(*str)) {
        val = (10 * val) + (*str++ - '0');
    }

    return neg ? -val : val;
}
