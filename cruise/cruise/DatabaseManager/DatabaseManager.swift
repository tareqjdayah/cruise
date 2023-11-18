

import Foundation

import SQLite3

class DatabaseManager {
    var db: OpaquePointer?
    let dbName = "appDB.sqlite"
    
    init() {
        openDatabase()
    }
    
    func openDatabase() {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbName)
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
    }
    
    func createTable() {
        let createTableString = """
        CREATE TABLE IF NOT EXISTS Users(
        Id INTEGER PRIMARY KEY AUTOINCREMENT,
        Name TEXT,
        Email TEXT,
        Password TEXT);
        """
        
        var createTableStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE {
                print("Users table created.")
            } else {
                print("Users table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    func insert(name: String, email: String, password: String) -> Bool {
        let insertStatementString = "INSERT INTO Users (Name, Email, Password) VALUES (?, ?, ?);"
        var insertStatement: OpaquePointer?
        var success = false

        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 2, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, (password as NSString).utf8String, -1, nil)

            if sqlite3_step(insertStatement) == SQLITE_DONE {
                success = true
            }
        }
        sqlite3_finalize(insertStatement)
        return success
    }

    
    // More database operations can be added here (e.g., fetch, delete, etc.)
}
