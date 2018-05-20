#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QStandardPaths>
#include <QIcon>

#ifdef QT_DEBUG
#include <QDebug>
#endif

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    //app.setApplicationDisplayName(app.tr("Language Cards: learn 50-3500 words!"));
    app.setApplicationName(app.tr("LanguageCards"));
    app.setApplicationVersion(app.tr("0.1"));
    app.setOrganizationDomain(app.tr("MyCompany"));
    app.setOrganizationName(app.tr("QRL"));
    app.setWindowIcon(QIcon(QStringLiteral("qrc:/assets/icons/multimedia.png")));

    QQmlApplicationEngine engine;

    engine.setOfflineStoragePath(QStandardPaths::writableLocation(QStandardPaths::AppLocalDataLocation));
#ifdef QT_DEBUG
    qDebug() << engine.offlineStoragePath();
#endif
    engine.load(QUrl(QStringLiteral("qrc:/Main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
