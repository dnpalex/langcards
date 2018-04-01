import QtQuick 2.9
import QtQuick.Controls 2.3

SwipeView {
    id: root

    property var model

    Repeater{
        model: root.model

        Loader{
            active: SwipeView.isCurrentItem | SwipeView.isNextItem | SwipeView.isPreviousItem
            sourceComponent: Rectangle {
                Rectangle{
                    height: parent.height * 0.7
                    width: parent.width * 0.7
                    anchors.centerIn: parent
                    color: "coral"
                    radius: 30

                    Text{
                        text: word
                        anchors {horizontalCenter: parent.horizontalCenter; top: parent.top}
                    }
                    Text{
                        text: partOfSpeech
                        anchors {horizontalCenter: parent.horizontalCenter; bottom: parent.bottom}
                    }
                }
            }
        }
    }
}
