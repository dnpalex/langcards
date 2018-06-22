include(../../common.pri)

QT += qml quick
CONFIG += c++17 qtquickcompiler

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += main.cpp

RESOURCES += qml.qrc

DESTDIR = $$ROOT_DESTDIR

QML_IMPORT_PATH += $$ROOT_DESTDIR/imports

qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES +=

