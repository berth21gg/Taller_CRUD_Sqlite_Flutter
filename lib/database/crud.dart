import 'package:sqflite/sqflite.dart';
import 'package:taller_sqlite_flutter/database/db.dart';

abstract class CRUD {
  String table;

  CRUD(this.table);

  Future<Database> get database async {
    return await DB().open();
  }

  // Sentencias preparadas
  query(String sql, {List<dynamic> arguments = const []}) async {
    return (await database).rawQuery(sql, arguments);
  }

  update(Map<String, dynamic> data) async {
    return (await database)
        .update(table, data, where: 'id = ?', whereArgs: [data['id']]);
  }

  create(Map<String, dynamic> data) async {
    return (await database).insert(table, data);
  }

  delete(int id) async {
    return (await database).delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
