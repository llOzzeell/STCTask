#include "taskobject.h"

taskObject::taskObject(): type(-1), operandA(-1), operandB(-1), duration(-1), errorCode(-3), isModified(false)
{

}

taskObject::taskObject(int _type, double _operandA, double _operandB, int _duration): type(_type), operandA(_operandA), operandB(_operandB), duration(_duration), errorCode(0), isModified(false)
{

}

int taskObject::getType() const
{
    return type;
}

QString taskObject::getTypeString() const
{
    switch(type){
        case 0: return "/";
        case 1: return "x";
        case 2: return "-";
        case 3: return "+";
        default: return "?";
    }
}

void taskObject::setType(int value)
{
    type = value;
}

double taskObject::getOperandA() const
{
    return operandA;
}

void taskObject::setOperandA(double value)
{
    operandA = value;
}

double taskObject::getOperandB() const
{
    return operandB;
}

void taskObject::setOperandB(double value)
{
    operandB = value;
}

double taskObject::getResult() const
{
    return result;
}

void taskObject::setResult(double value)
{
    isModified = true;
    result = value;
}

int taskObject::getDuration() const
{
    return duration;
}

void taskObject::setDuration(int value)
{
    duration = value;
}

int taskObject::getErrorCode() const
{
    return errorCode;
}

void taskObject::setErrorCode(int value)
{
    if(value < 0) errorCode = value;
}

void taskObject::printStatus() const
{
    qDebug() << "--------------------------";
    qDebug() << "Modified: " << isModified;
    qDebug() << "Operation Type: " << "[" << type << "]" << "      [0 /] | [1 *] | [2 -] | [3 +]";
    qDebug() << "Operand A: " << "[" << operandA << "]";
    qDebug() << "Operand B: " << "[" << operandB << "]";
    if(isModified) qDebug() << "Result: " << "[" << result << "]";
    if(isModified) qDebug() << "Error Code: " << "[" << errorCode << "]";
    qDebug() << "Duration(Sec.): " << "[" << duration << "]";
    qDebug() << "--------------------------";
}

bool taskObject::getIsModified() const
{
    return isModified;
}
