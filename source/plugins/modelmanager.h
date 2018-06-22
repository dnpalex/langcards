#ifndef MODELMANAGER_H
#define MODELMANAGER_H

#include <QObject>
#include <QSortFilterProxyModel>
#include <QList>

#include "wordsmodel.h"

class ModelManager : public QObject
{
    Q_OBJECT
public:
    explicit ModelManager(QObject *parent = nullptr);

    Q_INVOKABLE QSortFilterProxyModel* getProxyModel() noexcept;

signals:

public slots:

private:
    WordsModel* wordsModel;
    QList<QSortFilterProxyModel*> proxyModelList;
};

#endif // MODELMANAGER_H
