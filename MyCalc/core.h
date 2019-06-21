#ifndef CORE_H
#define CORE_H

#include <QObject>

#include "taskqueue.h"
#include "threadprepare.h"
#include "threadprocessing.h"
#include "resultconsole.h"

class Core : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double operandA READ getOperandA WRITE setOperandA)
    Q_PROPERTY(double operandB READ getOperandB WRITE setOperandB)
    Q_PROPERTY(int type READ getType WRITE setType)
    Q_PROPERTY(int calcTimeSec WRITE setCalcTime)
    Q_PROPERTY(int requestCount READ getRequestCount NOTIFY signalRequestCountChanged)
    Q_PROPERTY(int resultCount READ getResultCount NOTIFY signalResultCountChanged)
    Q_PROPERTY(bool processingResults WRITE setProcessingResults READ getProcessingResults)

public:
    Core();

    void setOperandA(double value);
    double getOperandA() const;
    void setOperandB(double value);
    double getOperandB() const;
    void setType(int value);
    int getType() const;
    void setCalcTime(int value);
    int getRequestCount() const;
    int getResultCount() const;
    void setIsReady(bool value);

private:
    double operandA;
    double operandB;
    int type;
    int calcTimeSec;
    taskQueue requestQ;
    taskQueue resultQ;
    ThreadPrepare *prepareThread;
    ThreadProcessing *processingThread;
    ResultConsole resConsole;

signals:
    void signalRequestCountChanged(int value);
    void signalResultCountChanged(int value);
    void signalResultReady(double result, int errorCode);
    void signalSendMsgToBackPanel(int msgType, QString msg, int duration);

public slots:
    void setRequest(double A, double B, int Type, int duration);
    void setProcessingResults(bool value);
    bool getProcessingResults();
};

#endif // CORE_H
