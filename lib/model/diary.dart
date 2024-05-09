import 'package:taller_sqlite_flutter/database/crud.dart';
import 'package:taller_sqlite_flutter/database/tables.dart';

class DIARY extends CRUD {
  int id;
  String type;
  String enterCode;

  DIARY({this.id = 0, this.type = '', this.enterCode = ''}) : super(diaryTable);

  @override
  String toString() {
    // TODO: implement toString
    return '\n id: $id tipo: $type \n';
  }

  DIARY toObject(Map<dynamic, dynamic> data) {
    return DIARY(
      id: data['id'],
      type: data['type'],
      enterCode: data['enterCode'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id > 0 ? id : null,
      'type': type,
      'enterCode': enterCode,
    };
  }

  save() async {
    return await ((id > 0) ? update(toMap()) : create(toMap()));
  }

  remove() async {
    await delete(id);
  }

  Future<List<DIARY>> getDiaries() async {
    var result = await query('SELECT * FROM $diaryTable');
    return _getListObject(result);
  }

  List<DIARY> _getListObject(parsed) {
    return (parsed as List).map((map) => toObject(map)).toList();
  }

  Future<DIARY> checkEnterCode() async {
    var result = await query(
        'SELECT * FROM $diaryTable WHERE id = ? AND $enterCode = ?',
        arguments: [id, enterCode]);

    return toObject(result);
  }
}
