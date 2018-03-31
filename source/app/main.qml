import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2

import ModelPlugins 1.0

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Language cards")

    property CardsView cardsView: CardsView{
        //id: root
    }

    property WordsModel tempModel: WordsModel{}

    property FolderGridView folderGridView: FolderGridView{
        //id: root
        onCellClicked: {
            cardsView.model = tempModel
            stackView.push(cardsView)
        }
    }

    StackView{
        id: stackView
        anchors { margins: 3; fill: parent; }
        initialItem: folderGridView
    }
}
