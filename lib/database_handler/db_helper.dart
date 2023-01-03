// ignore: unused_import
import 'package:flutter/material.dart';

import 'package:my_aplication/models/user_model.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

class DbHelper{

  static Database? _db;

  static const String dbName = 'my_apliaction.db';
  static const String tableUser = 'user';
  static const int version= 1;

  static const String cUserID = 'user_id';
  static const String cUserUser = 'user_user';
  static const String cUserName = 'user_name';
  static const String cUserLastname = 'user_lastname';
  static const String cUserCurp = 'user_curp';
  static const String cEmail = 'email';
  static const String cPhone = 'phone';
  static const String cCorp = 'corp';
  static const String cPassword = 'password';

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }

    _db = await initDb();

    return _db;
  }
  
  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    var db = await openDatabase(path, version: version, onCreate: _onCreate);
    return db;
  }
  _onCreate(Database db, int intVersion) async{
   await db.execute("CREATE TABLE $tableUser ("
      " $cUserID TEXT, " 
      " $cUserUser TEXT, " 
      " $cUserName TEXT, "
      " $cUserLastname TEXT, "
      " $cUserCurp TEXT, "
      " $cEmail TEXT, "
      " $cPhone TEXT, "
      " $cCorp TEXT, "
      " $cPassword TEXT, "
      "PRIMARY KEY($cUserID)"
      ")"); 
  }

   Future<int?> saveData(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient!.insert(tableUser, user.toMap());
    return res;
  }

  Future<UserModel?> getLoginUser(String userId, String password) async {
    var dbClient = await db;
    var res = await dbClient!.rawQuery("SELECT * FROM $tableUser WHERE "
        "$cUserID = '$userId' AND "
        "$cPassword = '$password'");

    if (res.isNotEmpty) {
      return UserModel.fromMap(res.first);
    }

    return null;
  }

  Future<int> updateUser(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient!.update(tableUser, user.toMap(),
        where: '$cUserID = ?', whereArgs: [user.userId]);
    return res;
  }

  Future<int> deleteUser(String userId) async {
    var dbClient = await db;
    var res = await dbClient!
        .delete(tableUser, where: '$cUserID = ?', whereArgs: [userId]);
    return res;
  }
}