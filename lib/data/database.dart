import 'package:receitas/data/receitas_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'receitas.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ReceitasDao.receitaSql);
    },
    version: 1,
  );
}


