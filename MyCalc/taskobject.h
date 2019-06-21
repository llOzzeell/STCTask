#ifndef TASKOBJECT_H
#define TASKOBJECT_H

#include <QObject>
#include <QDebug>

class taskObject
{
public:
    taskObject();
    taskObject(int _type, double _operandA, double _operandB, int _duration);

    int getType() const;
    QString getTypeString() const;
    void setType(int value);

    double getOperandA() const;
    void setOperandA(double value);

    double getOperandB() const;
    void setOperandB(double value);

    double getResult() const;
    void setResult(double value);

    int getDuration() const;
    void setDuration(int value);

    int getErrorCode() const;
    void setErrorCode(int value);

    void printStatus() const;
    bool getIsModified() const;

private:
    int type;
    double operandA;
    double operandB;
    double result;
    int duration;
    int errorCode;
    bool isModified; // флаг говорящий о том что обьект содержит готовый результат вычисления
};

#endif // TASKOBJECT_H
