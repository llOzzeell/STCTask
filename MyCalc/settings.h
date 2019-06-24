#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QDebug>
#include <QSettings>
#include <QGuiApplication>

class Settings: public QObject
{
    Q_OBJECT
public:
    Settings();

public slots:
    void read();
    void write(int width, int height);
signals:
    void signalResize(int width, int height);
};

#endif // SETTINGS_H
