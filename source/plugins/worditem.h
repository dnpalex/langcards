#ifndef WORDITEM_H
#define WORDITEM_H

#include <QVariant>
#include <QHash>

struct WordItem
{
    enum DATA_ROLES{WORD, PART_OF_SPEECH, CATEGORY, SUB_CATEGORY, LANGUAGE};

    QVariant data(const int& role) const noexcept{
        switch(role){
            case WORD:
                return word;
            case PART_OF_SPEECH:
                return partOfSpeech;
            case CATEGORY:
                return category;
            case SUB_CATEGORY:
                return subCategory;
            case LANGUAGE:
                return language;
            default:
                return QVariant();
        }
    }

    static QHash<int,QByteArray> roleNames() noexcept{
        return {
            {WORD, "word"},
            {PART_OF_SPEECH, "partOfSpeech"},
            {CATEGORY, "category"},
            {SUB_CATEGORY, "subCategory"},
            {LANGUAGE, "language"}
        };
    }

    WordItem(QString word, QString partOfSpeech, QString category, QString subCategory, QString language):
        word(word), partOfSpeech(partOfSpeech), category(category), subCategory(subCategory), language(language) {}
    /*WordItem(const WordItem& item): word(item.word),
        partOfSpeech(item.partOfSpeech),
        category(item.category),
        subCategory(item.subCategory),
        language(item.language)

    {}
    WordItem(WordItem&& item): word(std::move(item.word)),
        partOfSpeech(std::move(item.partOfSpeech)),
        category(std::move(item.category)),
        subCategory(std::move(item.subCategory)),
        language(std::move(item.language))
    {}

    WordItem& operator=(const WordItem& item){
        this->word = item.word;
        this->partOfSpeech = item.partOfSpeech;
        this->category = item.category;
        this->subCategory = item.subCategory;
        this->language = item.language;
        return *this;
    }//*/

    QString word;
    QString partOfSpeech;
    QString category;
    QString subCategory;
    QString language;

};


#endif // WORDITEM_H
