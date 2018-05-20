import QtQuick 2.10
import QtQuick.Window 2.10
import QtQuick.Controls 2.3

ApplicationWindow {
    id: root
    visible: true
    width: 480
    height: 720
    title: qsTr("Language cards")

    property bool leftDrawerInteractive: false
    property bool rightDrawerInteractive: false



    CategoryModel {
        id: categoryModel
    }

    Component.onCompleted: {
        console.log(CategoryModel.categoryLevel);
        categoryModel.categoryLevel = 0;
        console.log(CategoryModel.categoryLevel);
    }

    Drawer {
        id: leftDrawer
        y: header.height
        width: root.width * 0.66
        height: root.height - header.height
        edge: Qt.LeftEdge
        interactive: root.leftDrawerInteractive

        Rectangle {
            color: "blue"
            anchors.fill: parent
        }
    }

    Drawer {
        id: rightDrawer
        y: header.height
        width: root.width * 0.66
        height: root.height - header.height
        edge: Qt.RightEdge
        interactive: root.rightDrawerInteractive

        Rectangle {
            color: "green"
            anchors.fill: parent
        }
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
        icon { source: "assets/icons/back.png"; name: "Back"; }
        enabled: stackView.depth > 1
        onTriggered: {
            stackView.pop()
        }
    }

    Action {
        id: options
        icon { source: "assets/icons/download.png"; name: "Options"; }

        onTriggered: {
            if (topDrawer.visible)
                topDrawer.close();
            else topDrawer.open();
        }
    }

    header: MainControlBar {
        height: root.height / 8;
        buttonWidth: height
        leftAction: goBack
        rightAction: options        
    }

    property CardsSwipeView cardsView: CardsSwipeView{
        objectName: "CardsSwipeView"

    }

    property CategoryGridView gridView: CategoryGridView {
        objectName: "CategoryGridView"
        model: CategoryModel.model

        onCellClicked: {
            categoryModel.categoryLevel = id
            stackView.push(cardsView)
        }
    }

    StackView {
        id: stackView
        anchors { margins: 3; fill: parent }
        initialItem: gridView
    }
}
