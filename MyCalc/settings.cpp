#include "settings.h"

Settings::Settings()
{

}

void Settings::read()
{
    QSettings settings("settings_demo.conf", QSettings::IniFormat);
    int width,height;
    settings.beginGroup("SIZE");
    width = settings.value("W").toInt();
    height = settings.value("H").toInt();
    settings.endGroup();
    emit signalResize(width, height);
}

void Settings::write(int width, int height)
{
    QSettings settings("settings_demo.conf", QSettings::IniFormat);
    settings.beginGroup("SIZE");
    settings.setValue("W", width );
    settings.setValue("H", height);
    settings.endGroup();
}
