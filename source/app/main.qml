import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3

ApplicationWindow {
    id: root
    visible: true
    width: 480
    height: 720
    title: qsTr("Language cards")

    Drawer {
        id: leftDrawer
        y: header.height
        width: root.width * 0.66
        height: root.height - header.height
    }

    Drawer {
        id: topDrawer
        x: root.width * 0.34
        width: root.width * 0.66
        height: root.height
        edge: Qt.TopEdge

        Rectangle {
            color: "red"
            anchors.fill: parent
        }
    }

    Action {
        id: goBack
        icon {source: "assets/icons/back.png"; name: "Back";}

        onTriggered: {
            stackView.pop()
        }
    }

    Action {
        id: options
        icon {source: "assets/icons/download.png"; name: "Options";}

        onTriggered: {
            if (topDrawer.visible)
                topDrawer.close();
            else topDrawer.open();//*/
        }
    }

    header: MainControlBar{
        height: root.height / 8;
        buttonWidth: height
        leftAction: goBack
        rightAction: options
    }

    ListModel{
        id: words
        ListElement{ word: "Noun1"; partOfSpeech: "Noun"}
        ListElement{ word: "Noun2"; partOfSpeech: "Noun"}
        ListElement{ word: "Verb1"; partOfSpeech: "Verb"}
        ListElement{ word: "Verb2"; partOfSpeech: "Verb"}
        ListElement{ word: "Verb3"; partOfSpeech: "Verb"}
        ListElement{ word: "Adjective1"; partOfSpeech: "Adjective"}
    }

    property CardsSwipeView cardsView: CardsSwipeView{

    }

    property CategoryGridView gridView: CategoryGridView{
        //id: root
        onCellClicked: {
            cardsView.model = words
            stackView.push(cardsView)
        }
    }

    StackView{
        id: stackView
        anchors { margins: 3; fill:parent}
        initialItem: gridView
    }
}
