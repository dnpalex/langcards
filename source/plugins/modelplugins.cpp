#include "modelplugins.h"
#include "modelmanager.h"
#include <QSortFilterProxyModel>
#include <qqml.h>

void ModelsPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<ModelManager>(uri, 1, 0, "ModelManager");
    qmlRegisterType<QSortFilterProxyModel>(uri, 1, 0, "QSortFilterProxyModel");
}
