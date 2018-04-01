import QtQuick 2.9
import QtQuick.Controls 2.3

Rectangle {
    id: root

    property Action leftAction
    property Action rightAction

    Button{
        id: leftButton
        anchors {bottom: parent.bottom; top: parent.top; left: parent.left}
        width: root.width / 8
        action: leftAction
    }
    Button{
        id: rightButton
        anchors {bottom: parent.bottom; top: parent.top; right: parent.right}
        width: root.width / 8
        action: rightAction
    }
}
