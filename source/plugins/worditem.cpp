#include "worditem.h"

#include <QMetaEnum>

QHash<int, QByteArray> WordItem::roleNames() noexcept
{
    QHash<int, QByteArray> roleMap;
    auto enumMeta = WordItem::staticMetaObject.enumerator(WordItem::staticMetaObject.indexOfEnumerator("DATA_ROLES"));
    for(int i = 0; i < enumMeta.keyCount(); i++){
        roleMap.insert(enumMeta.value(i), enumMeta.key(i));
    }
    return roleMap;
}

WordItem::WordItem(QObject *parent) : QObject(parent)
{
}

WordItem::WordItem(const QString &text, const QString &translation, QObject *parent) : WordItem(parent)
{
    this->textVal = text;
    this->translationVal = translation;
}

QString WordItem::text() const noexcept
{
    return textVal;
}

void WordItem::setText(const QString &value) noexcept
{
    textVal = value;
    emit textChanged();
}

QString WordItem::translation() const noexcept
{
    return translationVal;
}

void WordItem::setTranslation(const QString &value) noexcept
{
    translationVal = value;
    emit translationChanged();
}

QVariant WordItem::data(int role) const noexcept
{
    switch (role) {
    case WordItem::DATA_ROLES::TEXT:
        return text();
    case WordItem::DATA_ROLES::TRANSLATION:
        return translation();
    default:
        return QVariant();
    }
}

