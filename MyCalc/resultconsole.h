#ifndef RESULTCONSOLE_H
#define RESULTCONSOLE_H

#include <QObject>

#include "taskobject.h"

struct msgType{
    static const int REQUEST = 0;
    static const int RESULT = 1;
    static const int ERROR = -1;
};

class ResultConsole: public QObject
{
    Q_OBJECT
public:
    ResultConsole(){}
    void outEvent(int type , QString msg, int duration){

        switch(type){
            case 0: emit signalSendMsgToBackPanel(msgType::REQUEST, "Запрос: " + msg, duration); break;
            case 1: emit signalSendMsgToBackPanel(msgType::RESULT, "Результат: " + msg, duration); break;
            case -1: emit signalSendMsgToBackPanel(msgType::ERROR, "Деление на ноль. Ошибка. "  + msg, duration); break;
            case -2: emit signalSendMsgToBackPanel(msgType::ERROR, "Неизвестный оператор. Ошибка. "  + msg, duration); break;
        }
    }

private:


signals:
    void signalResultReady(double result, int errorCode);
    //void signalSendMsgToBackPanel(int msgType, QString msg);
    void signalSendMsgToBackPanel(int msgType, QString msg, int duration);
};

#endif // RESULTCONSOLE_H
