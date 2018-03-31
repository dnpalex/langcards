#ifndef MODELSPLUGIN_H
#define MODELSPLUGIN_H

#include <QQmlExtensionPlugin>

class ModelsPlugin : public QQmlExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlExtensionInterface_iid)

public:

    void registerTypes(const char *uri) override;
};

#endif // MODELSPLUGIN_H
