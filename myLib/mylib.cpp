#include "mylib.h"


Mylib::Mylib()
{
}

double Mylib::DoIt(int TypeWork, double OperandA, double OperandB, int &ErrorCode)
{
    switch(TypeWork){
        case 0: return Division(OperandA, OperandB, ErrorCode); break;
            case 1: return Multiplication(OperandA, OperandB, ErrorCode); break;
                case 2: return Minus(OperandA, OperandB, ErrorCode); break;
                    case 3: return Plus(OperandA, OperandB, ErrorCode); break;
    default: return err.INVALIDOPERATION;
    };
}

double Mylib::Plus(double OperandA, double OperandB, int &ErrorCode)
{
    ErrorCode = 0;
    return OperandA += OperandB;
}

double Mylib::Minus(double OperandA, double OperandB, int &ErrorCode)
{
    ErrorCode = 0;
    return OperandA -= OperandB;
}

double Mylib::Division(double OperandA, double OperandB, int &ErrorCode)
{
   if(OperandB == 0){ ErrorCode = err.ZERODIVIDER; return 0; };
   return OperandA /= OperandB;
}

double Mylib::Multiplication(double OperandA, double OperandB, int &ErrorCode)
{
    ErrorCode = 0;
    return OperandA *= OperandB;
}
