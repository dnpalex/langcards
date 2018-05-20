import QtQuick 2.9
import QtQuick.Controls 2.3

Rectangle {
    id: root

    property Action leftAction
    property Action rightAction
    property int buttonWidth: width / 6

    Button {
        id: leftButton
        anchors { bottom: parent.bottom; top: parent.top; left: parent.left }
        width: buttonWidth
        action: leftAction
        visible: action.enabled
    }
    Button {
        id: rightButton
        anchors { bottom: parent.bottom; top: parent.top; right: parent.right }
        width: buttonWidth
        action: rightAction
        visible: action.enabled
    }
}
