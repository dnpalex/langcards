#include "wordsmodel.h"

WordsModel::WordsModel() : itemList()
{
    itemList.append(new WordItem("word", "слово", this));
}

WordsModel::~WordsModel()
{
    if (itemList.count() > 0) {
        foreach (auto item, itemList) {
            if (item) delete item;
        }
    }
}


int WordsModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return itemList.count();
}

QVariant WordsModel::data(const QModelIndex &index, int role) const
{
    return itemList.count() > index.row() ? itemList.at(index.row())->data(role) : QVariant();
}

QHash<int, QByteArray> WordsModel::roleNames() const
{
    return WordItem::roleNames();
}
