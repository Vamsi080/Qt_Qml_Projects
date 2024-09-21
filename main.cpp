#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "database_manager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    database_manager dbManager;
    dbManager.open();

    engine.rootContext()->setContextProperty("dbManager",&dbManager);

    const QUrl url(u"qrc:/UltraSound/main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreated,
        &app,
        [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
