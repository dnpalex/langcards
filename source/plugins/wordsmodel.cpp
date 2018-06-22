#include "wordsmodel.h"



WordsModel::WordsModel(QObject *parent) : QAbstractListModel(parent)
{

}

void WordsModel::addItem(WordItem &&item) noexcept
{
    itemList.append(item);
}

void WordsModel::addItem(const WordItem &item) noexcept
{
    itemList.append(item);
}

void WordsModel::addItems(QList<WordItem> &&list) noexcept
{
    itemList.append(list);
}

void WordsModel::addItems(const QList<WordItem> &list) noexcept
{
    itemList.append(list);
}

int WordsModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent)
    return itemList.count();
}

QVariant WordsModel::data(const QModelIndex &index, int role) const
{
    return itemList.count() > index.row() ? itemList.at(index.row()).data(role) : QVariant();
}

QHash<int, QByteArray> WordsModel::roleNames() const
{
    return WordItem::roleNames();
}
