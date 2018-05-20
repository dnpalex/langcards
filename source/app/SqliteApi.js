
function dbGetHandle() {
    try {
        var db = LocalStorage.openDatabaseSync("WordsDb", "", "", 1000000);
    } catch (err) {
        console.log("Error opening database: " + err);
        throw err;
    }
    return db;
}

function dbInsert(Ptable, Pvalues) {
    var db = dbGetHandle();
    var rowid = 0;
    db.transaction(function (tx) {
        tx.executeSql('INSERT INTO ' + Ptable + ' VALUES(?, ?, ?)', Pvalues);
        var result = tx.executeSql('SELECT last_insert_rowid()');
        rowid = result.insertId;
    });
    return rowid;
}

function dbReadAll(Ptable, Pfilter, Pcolumns) {
    var db = dbGetHandle();
    db.transaction(function (tx) {
        var columnString = '';
        var valueArray = [];
        for(var i = 0; i < Pfilter.count; i++) {
            columnString.concat(' ' + Pfilter[i].column + ' = ? AND');
            valueArray.push(Pfilter[i].value);
        }

        var results = tx.executeSql(
                    'SELECT ' + Pcolumns ? Pcolumns : '*'
                    + ' FROM ' + Ptable
                    + Pfilter ? ' WHERE ' + columnString + ' 1=1 ' : ''
                    + ' ORDER BY rowid DESC', valueArray);
        return results.rows;
    });
}
function dbUpdate(Ptable, Prowid, PassignmentHash) {
    var db = dbGetHandle();
    db.transaction(function (tx) {
        var columnString = '';
        var valueArray = [];
        for(var i = 0; i < PassignmentHash.count; i++) {
            columnString.concat(' ' + PassignmentHash[i].column + ' = ?');
            valueArray.push(PassignmentHash[i].value);
        }
        valueArray.push(Prowid);
        tx.executeSql(
                    'UPDATE ' + Ptable
                    + ' SET ' + columnString
                    + ' WHERE rowid = ?', valueArray);
    });
}

function dbDelete(Ptable, Prowid) {
    var db = dbGetHandle();
    db.transaction(function (tx) {
        tx.executeSql('DELETE FROM ' + Ptable
                      + ' WHERE rowid = ?', [Prowid]);
    });
}

function dbExecSql(Psqlstring) {
    var db = dbGetHandle();
    db.transaction(function (tx) {
        tx.executeSql(Psqlstring);
    });
}
