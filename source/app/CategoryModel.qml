import QtQuick 2.9

import QtQuick.LocalStorage 2.0

QtObject {
    property int categoryLevel
    property var model

    /*ListModel {
        id: _categoryList
    }//*/

    onCategoryLevelChanged: readCategory()

    function readCategory()
    {

    }
}

