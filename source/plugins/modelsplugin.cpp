#include "modelsplugin.h"
#include "wordsmodel.h"
#include <qqml.h>

void ModelsPlugin::registerTypes(const char *uri)
{
    qmlRegisterType<WordsModel>(uri, 1, 0, "WordsModel");
}
