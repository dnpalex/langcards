#ifndef WORDSMODEL_H
#define WORDSMODEL_H

#include <QAbstractListModel>
#include <QList>

#include "worditem.h"

class WordsModel : public QAbstractListModel
{
    Q_OBJECT
public:
    explicit WordsModel(QObject* parent);

    void addItem(WordItem&& item) noexcept;
    void addItem(const WordItem& item) noexcept;
    void addItems(QList<WordItem>&& list) noexcept;
    void addItems(const QList<WordItem>& list) noexcept;

    // QAbstractItemModel interface
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;

private:
    QList<WordItem> itemList;


};

#endif // WORDSMODEL_H
