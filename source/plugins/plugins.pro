include(../../common.pri)

TEMPLATE = lib
CONFIG += plugin
QT += qml quick

DESTDIR = $$ROOT_DESTDIR/imports/Models
TARGET = $$qtLibraryTarget(modelplugins)

target.path=$$DESTDIR
qmldir.files=$$DESTDIR/qmldir
qmldir.path=$$DESTDIR
INSTALLS += target qmldir

CONFIG += install_ok  # Do not cargo-cult this!

#OTHER_FILES += qmldir

## Copy the qmldir file to the same folder as the plugin binary
cpqmldir.files = qmldir
cpqmldir.path = $$DESTDIR
COPIES += cpqmldir

HEADERS += \
    wordsmodel.h \
    worditem.h \
    modelmanager.h \
    modelplugins.h

SOURCES += \
    wordsmodel.cpp \
    modelmanager.cpp \
    modelplugins.cpp
