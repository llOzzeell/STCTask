#include "core.h"

Core::Core():operandA(-1), operandB(-1), type(-1), calcTimeSec(-1)
{
    connect(&requestQ, &taskQueue::signalCountChanged, this, &Core::signalRequestCountChanged);
    connect(&resultQ, &taskQueue::signalCountChanged, this, &Core::signalResultCountChanged);

    connect(&resConsole, &ResultConsole::signalResultReady, this, &Core::signalResultReady);
    connect(&resConsole, &ResultConsole::signalSendMsgToBackPanel, this, &Core::signalSendMsgToBackPanel);

    prepareThread = new  ThreadPrepare(&requestQ, &resultQ, &resConsole);
    prepareThread->start();

    processingThread = new ThreadProcessing(&requestQ, &resultQ, &resConsole);
    processingThread->start();
}

void Core::setOperandA(double value)
{
    operandA = value;
}

double Core::getOperandA() const
{
    return operandA;
}

void Core::setOperandB(double value)
{
    operandB = value;
}

double Core::getOperandB() const
{
    return operandB;
}

void Core::setType(int value)
{
    type = value;
}

int Core::getType() const
{
    return type;
}

void Core::setCalcTime(int value)
{
    calcTimeSec = value;
}

int Core::getRequestCount() const
{
    return requestQ.getCount();
}

int Core::getResultCount() const
{
    return resultQ.getCount();
}

void Core::setRequest(double A, double B, int Type, int duration)
{
    prepareThread->setRequest(taskObject(Type,A,B,duration));
}

void Core::setProcessingResults(bool value)
{
    prepareThread->setProcessingResults(value);
}

bool Core::getProcessingResults()
{
    return prepareThread->getProcessingResults();
}
