import 'dart:async';
import 'dart:io' as io;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Note {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  initialDB() async {
    // to store project path.
    io.Directory docDirect = await getApplicationDocumentsDirectory();
    // to create database in project path if it is not exists.
    String path = join(docDirect.path, 'testdb.db');
    // to open database.
    var myDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return myDB;
  }

  _onCreate(Database db, int version) async {
    // to create table.
    await db.execute(
        'CREATE TABLE "notes" ("id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, "note" TEXT NOT NULL)');
    print('Notes table created');
  }

  Future<int> create(Map<String, dynamic> data) async {
    var dbClient = await db;
    var insert = dbClient!.insert('notes', data);
    return insert;
  }

  Future<List> getData() async {
    var dbClient = await db;
    var notes = await dbClient!.query('notes');
    // var notes = await dbClient!.query('notes',orderBy: 'id DESC',limit: 2);
    return notes;
  }

  Future<int> deleteNote(int id) async {
    var dbClient = await db;
    var deletedNote =
    await dbClient!.rawDelete("DELETE FROM notes WHERE id=?", ['$id']);
    return deletedNote;
  }

  Future<int> updateNote(String note, int id) async {
    var dbClient = await db;
    var updatedNote = await dbClient!
        .rawUpdate("UPDATE notes SET note=? WHERE id= ?", [note, '$id']);
    return updatedNote;
  }

  Future<List> getSingleRow(int id) async {
    var dbClient = await db;
    var note = await dbClient!.query('notes', where: 'id = "$id"');
    return note;
  }
}
