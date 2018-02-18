import QtQuick 2.9
import Qt.labs.folderlistmodel 2.2
import Qt.labs.platform 1.0

GridView {
    id: gridView
    anchors.fill: parent
    cellHeight: height / 4
    cellWidth: width / 4

    signal cellClicked(string fileUrl)

    model: FolderListModel{
        id: dictionaryFileListModel
        nameFilters: ["*.csv"]
        folder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation) + "/LangCards"
    }

    delegate: Rectangle {
        border.width: 1
        border.color: "lightgray"
        height: gridView.cellHeight
        width: gridView.cellWidth

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
                text: fileName
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        MouseArea{
            id: cellMArea
            anchors.fill: parent
            onClicked: {
                gridView.cellClicked(dictionaryFileListModel.get(index,"fileURL"))
                //console.log(dictionaryFileListModel.get(index,"fileURL"))
            }
        }
    }
}
