#include "taskqueue.h"

taskQueue::taskQueue():Count(0)
{

}

void taskQueue::setName(QString value)
{
    name = value;
}

void taskQueue::Enqueue(taskObject obj)
{
    QMutexLocker locker(&mutex);
    queue.enqueue(obj);
    Count++;
    emit signalCountChanged(Count);
}

taskObject taskQueue::Dequeue()
{
    if(!queue.isEmpty()){
        QMutexLocker locker(&mutex);
        Count--;
        emit signalCountChanged(Count);
        return queue.dequeue();
    }
}

int taskQueue::getCount() const
{
    return queue.count();
}

bool taskQueue::isEmpty() const
{
    return queue.isEmpty();
}
