#ifndef TASKQUEUE_H
#define TASKQUEUE_H

#include <QObject>
#include <QQueue>
#include <QMutex>
#include <QString>
#include <QDebug>

#include "taskobject.h"

class taskQueue: public QObject
{
     Q_OBJECT
public:
    taskQueue();

private:
    QQueue<taskObject> queue;
    QString name;
    QMutex mutex;
    unsigned int Count;

public slots:
    void setName(QString value);
    void Enqueue(taskObject obj);
    taskObject Dequeue();
    int getCount() const;
    bool isEmpty() const;

signals:
    void signalCountChanged(int value);
};

#endif // TASKQUEUE_H
