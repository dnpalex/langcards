import QtQuick 2.9

GridView {
    id: root
    cellHeight: height / 4
    cellWidth: width / 4

    signal cellClicked(string fileUrl)

    model: ListModel{
        ListElement{
            name: "Noun"
        }
        ListElement{
            name: "Verb"
        }
        ListElement{
            name: "Adjective"
        }
        ListElement{
            name: "Adverb"
        }
    }

    delegate: Rectangle {
        border.width: 1
        border.color: "lightgray"
        height: root.cellHeight
        width: root.cellWidth

        Column{
            id: column
            anchors {centerIn: parent}
            spacing: 5

            /*Image {
                width: 40 //gridView.width / 3
                height: 40 //gridView.height / 3
                source: "qrc:/assets/images/book.png"
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectCrop
            }--*/
            Text {
                text: name
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        MouseArea{
            id: cellMArea
            anchors.fill: parent
            onClicked: {
                root.cellClicked(root.model.get(index).name)
                //console.log(dictionaryFileListModel.get(index,"fileURL"))
            }
        }
    }
}
