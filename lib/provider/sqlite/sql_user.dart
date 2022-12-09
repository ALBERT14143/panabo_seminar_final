import 'package:panabo_seminar/provider/sqlite/database_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../../model/personal_info.dart';

class SQLUsers {
  static const tUsers = "tUsers";
  static const colRecNo = "recNo";
  static const colUserId = "userId";
  static const colFirstName = "firstName";
  static const colMiddleName = "middleName";
  static const colLastName = "lastName";
  static const colAddress = "address";
  static const colUsername = "username";
  static const colPassword = "password";
  static const colPhotoUrl = "photoUrl";

  static const createTUsers = '''
    CREATE TABLE $tUsers(
      $colRecNo INTEGER PRIMARY KEY,
      $colUserId VARCHAR(80),
      $colFirstName VARCHAR(20),
      $colMiddleName VARCHAR(20),
      $colLastName VARCHAR(20),
      $colAddress VARCHAR(20),
      $colUsername VARCHAR(20),
      $colPassword VARCHAR(20),
      $colPhotoUrl VARCHAR(100)
    )
  ''';

  Future<List<dynamic>> saveUsers(List<PersonalInfo> list) async {
    final db = await DatabaseHelper.instance.database;
    Batch batch = db.batch();

    for (var item in list) {
      batch.insert(tUsers, item.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    }

    return await batch.commit();
  }

  Future<List<PersonalInfo>> getUsers() async {
    final db = await DatabaseHelper.instance.database;
    // var result = await db.rawQuery("SELECT * FROM $tUsers");
    var result = await db.query(tUsers);

    return result.map((e) => PersonalInfo.fromJson(e)).toList();
  }
}