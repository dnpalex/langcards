import QtQuick 2.9

import QtQuick.LocalStorage 2.0

import "SqliteApi.js" as Sql

QtObject {
    property int categoryLevel
    property var model

    ListModel {
        id: _categoryList
    }

    onCategoryLevelChanged: readCategory()

    function readCategory()
    {
        console.log("readCategory");
        _categoryList.clear();
        var rows = Sql.dbReadAll('categories', [ { 'column': 'parent_id', 'value': categoryLevel } ], 'id,name');
        console.log(rows.count);
        for (var i = 0; i < rows.length; i++) {
            _categoryList.append({
                              id: rows.item(i).id,
                              name: rows.item(i).name
                             });
        }
    }
}

