import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Language cards")

    /*FolderGridView{
        id: dictionaryListGrid
    }--*/

    CardsView{
        id: cardsView
    }

    /*StackView{
        id: stackView
        anchors { margins: 3; fill: parent; }
        initialItem: dictionaryListGrid
    }

    Connections {
        target: dictionaryListGrid
        onCellClicked: {
            console.log(fileUrl)
        }
    }--*/
}
