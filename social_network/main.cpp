#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "datahandling.h"

#include<QQmlContext>
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    qmlRegisterSingletonType(QUrl("qrc:/MyStyle.qml"), "Util", 1, 0, "Util");
DataHandling a;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("slot",&a);

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
