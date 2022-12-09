import 'dart:io';

import 'package:panabo_seminar/provider/sqlite/sql_user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static const DB_NAME = "seminar.db";
  static const DB_VERSION = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    return await initDatabase();
  }

//adnroid/dbdirecotry/seminar.db
  Future<Database> initDatabase() async {
    Directory dbDirectory = await getApplicationDocumentsDirectory();
    String path = join(dbDirectory.path, DB_NAME);
    return await openDatabase(
      path,
      version: DB_VERSION,
      onCreate: onCreate,
      onUpgrade: onUpgrade,
      onConfigure: onConfigure
    );
  }

  Future onCreate(Database db, int version) async {
    await db.execute(SQLUsers.createTUsers);
  }

  Future onUpgrade(Database db, int oldVersion, int newVersion) async {

  }

  Future onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON");
  }

}