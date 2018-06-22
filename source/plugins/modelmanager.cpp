#include "modelmanager.h"

ModelManager::ModelManager(QObject *parent) : QObject(parent)
{
    wordsModel = new WordsModel(this);
    /*wordsModel->addItem({"immer", "Adverb", "Time", "Frequency", "German"});
    wordsModel->addItem({"das Auto", "Noun", "City", "Transport", "German"});
    wordsModel->addItem({"shreiben", "Verb", "Communication", "Transport", "German"});
    wordsModel->addItem({"stören", "Verb", "Etiquette", "Frequency", "German"});//*/
}

QSortFilterProxyModel *ModelManager::getProxyModel() noexcept
{
    /*auto proxy = new QSortFilterProxyModel(this);
    proxy->setSourceModel(wordsModel);
    proxy->setFilterRole(WordItem::PART_OF_SPEECH);
    proxy->setFilterRegExp("Verb");
    auto p = new QSortFilterProxyModel(this);
    p->setSourceModel(proxy);
    p->setFilterRole(WordItem::WORD);
    p->setFilterRegExp("shreiben");
    return p;//*/
    return nullptr;
}
