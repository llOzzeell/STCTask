#ifndef THREADPROCESSING_H
#define THREADPROCESSING_H

#include <QObject>
#include <QThread>
#include <QDebug>

#include "taskobject.h"
#include "taskqueue.h"
#include "resultconsole.h"
#include "mylib.h"

class ThreadProcessing: public QThread
{
public:
    ThreadProcessing(taskQueue *_req, taskQueue *_res, ResultConsole *_console):requestQ(_req),resultQ(_res),resConsole(_console){}
private:
    taskQueue *requestQ;
    taskQueue *resultQ;
    Mylib dynamicLibrary;
    ResultConsole *resConsole;

    void run() override{
        while(true){
            PopRequestIfReady();
        }
    }

    void PushResultIfReady(taskObject &obj){
        resultQ->Enqueue(obj);
    }
    void PopRequestIfReady(){
        if(!requestQ->isEmpty()){
            taskObject obj = requestQ->Dequeue();
            int errCode = 0;
            obj.setResult(dynamicLibrary.DoIt(obj.getType(), obj.getOperandA(), obj.getOperandB(), errCode));
            obj.setErrorCode(errCode);
            sleep(static_cast<unsigned long>(obj.getDuration()));
            PushResultIfReady(obj);
        }
    }
};


#endif // THREADPROCESSING_H
