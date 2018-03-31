#ifndef WORDITEM_H
#define WORDITEM_H

#include <QObject>
#include <QVariant>
#include <QHash>

class WordItem : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString text READ text WRITE setText NOTIFY textChanged)
    Q_PROPERTY(QString translation READ translation WRITE setTranslation NOTIFY translationChanged)

public:
    enum DATA_ROLES{TEXT=10000, TRANSLATION=10001};
    Q_ENUM(DATA_ROLES)

    static QHash<int,QByteArray> roleNames() noexcept;

    explicit WordItem(QObject *parent = nullptr);
    explicit WordItem(const QString& text, const QString& translation, QObject *parent = nullptr);

    QString text() const noexcept;
    void setText(const QString &value) noexcept;

    QString translation() const noexcept;
    void setTranslation(const QString &value) noexcept;

    QVariant data(int role) const noexcept;

signals:

    void textChanged();
    void translationChanged();

public slots:

private:
    QString textVal;
    QString translationVal;
};


#endif // WORDITEM_H
