#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QRect>
#include <QScreen>
#include "core.h"
#include "settings.h"

int main(int argc, char *argv[])
{

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    qmlRegisterType<Core>("com.CalculatorCore", 1,0, "CalculatorCore");
    qmlRegisterType<Settings>("com.Settings", 1,0,"Settings");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
