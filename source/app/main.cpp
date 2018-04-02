#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QStandardPaths>
#include <QIcon>

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

    auto temp = QStandardPaths::writableLocation(QStandardPaths::AppLocalDataLocation);
    engine.setOfflineStoragePath(QStandardPaths::writableLocation(QStandardPaths::AppDataLocation));

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
