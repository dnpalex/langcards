include(../../common.pri)

QT += qml quick
CONFIG += c++17

DEFINES += QT_DEPRECATED_WARNINGS

SOURCES += main.cpp

RESOURCES += qml.qrc

DESTDIR = $$ROOT_DESTDIR

QML_IMPORT_PATH += d:/documents/Projects/langcards
#C:/Qt/5.10.0/V-Play/mingw_32/qml


qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES +=

