#ifndef THREADPREPARE_H
#define THREADPREPARE_H

#include <QObject>
#include <QThread>
#include <QMutex>
#include <QDebug>

#include "taskobject.h"
#include "taskqueue.h"
#include "resultconsole.h"

class ThreadPrepare: public QThread
{
public:
    ThreadPrepare(taskQueue *_req, taskQueue *_res, ResultConsole *_console):requestQ(_req),resultQ(_res),resConsole(_console), objReady(false),processingResults(true){}

    void setRequest(taskObject _obj){
        obj = _obj;
        objReady = true;
    }

    void setProcessingResults(bool value){processingResults = value;}
    bool getProcessingResults(){return processingResults;}

private:

    taskQueue *requestQ;
    taskQueue *resultQ;
    ResultConsole *resConsole;
    taskObject obj;
    bool objReady;
    bool processingResults;

    void run() override{

        while(true){
            PushRequestIfReady(objReady);
            PopResultIfReady();
        }
    }

    void PushRequestIfReady(bool objectReady){
        if(objectReady){
            requestQ->Enqueue(obj);
            resConsole->outEvent(obj.getIsModified(), QString::number(obj.getOperandA()) + obj.getTypeString() + QString::number(obj.getOperandB()), obj.getDuration());
            objReady = false;
        }
    }
    void PopResultIfReady(){
        if(!resultQ->isEmpty() && processingResults){
            taskObject objLocal = resultQ->Dequeue();
            if(objLocal.getErrorCode() >= 0) resConsole->outEvent(objLocal.getIsModified(), QString::number(objLocal.getResult()),-1);
            else resConsole->outEvent(objLocal.getErrorCode(), "Код: " + QString::number(objLocal.getErrorCode()),-1);
        }
    }
};

#endif // THREADPREPARE_H
