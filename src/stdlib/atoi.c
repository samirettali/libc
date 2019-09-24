#include "ctype.h"

int atoi(const char *str)
{
    int neg = 0;
    int val = 0;

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
