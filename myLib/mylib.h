#ifndef MYLIB_H
#define MYLIB_H

#include "mylib_global.h"

struct Errors{
    double ZERODIVIDER = -1;
    double INVALIDOPERATION = -2;
};

class MYLIBSHARED_EXPORT Mylib
{

public:

    Mylib();

    MYLIBSHARED_EXPORT double DoIt(int TypeWork, double OperandA, double OperandB, int& ErrorCode);

private:
    Errors err;
    double Plus(double OperandA, double OperandB , int& ErrorCode);
    double Minus(double OperandA, double OperandB , int& ErrorCode);
    double Division(double OperandA, double OperandB , int& ErrorCode);
    double Multiplication(double OperandA, double OperandB , int& ErrorCode);
};

#endif // MYLIB_H
