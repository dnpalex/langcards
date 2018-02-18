import QtQuick 2.9
import QtQuick.Controls 2.3

SwipeView {
    id: swipeView
    anchors.fill: parent

    Repeater{
        model: ListModel{
            ListElement{name: "111"}
            ListElement{name: "222"}
            ListElement{name: "333"}
            ListElement{name: "444"}
            ListElement{name: "555"}
        }

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
                        text: name
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }
}
