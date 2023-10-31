import 'package:receitas/components/receita.dart';
import 'package:receitas/data/database.dart';
import 'package:sqflite/sqflite.dart';

class ReceitasDao {
 static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_ingredientes TEXT, '
      '$_preparo TEXT, '
      '$_imagem TEXT)';


  static const String _tablename = 'receitaTable';
  static const String _name = 'name';
  static const String _ingredientes = 'ingredientes';
  static const String _preparo = 'preparo';
  static const String _imagem = 'imagem';

  save(Receita receita) async {
    print('Iniciando save: ');
    final Database bancoDeDados = await getDatabase();
    var receitaExists = await find(receita.nome!);
    Map<String, dynamic> receitasMap = toMap(receita);
    if (receitaExists.isEmpty) {
      print('A receita nao existia');
      return await bancoDeDados.insert(_tablename, receitasMap);
    } else {
      print('A receita ja existia');
      return await bancoDeDados.update(
        _tablename,
        receitasMap,
        where: '$_name = ?',
        whereArgs: [
          receita.nome,
        ],
      );
    }
  }

  Map<String, dynamic> toMap(Receita receita) {
    print('convertendo receita em map: ');
    final Map<String, dynamic> mapaDeReceitas = Map();
    mapaDeReceitas[_name] = receita.nome;
    mapaDeReceitas[_ingredientes] = receita.ingredients;
    mapaDeReceitas[_preparo] = receita.preparation;
    mapaDeReceitas[_imagem] = receita.imageUrl;
    print('Mapa de Receitas: $mapaDeReceitas');
    return mapaDeReceitas;
  }

  Future<List<Receita>> findAll() async {
    print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> receita =
        await bancoDeDados.query(_tablename);
    print('Procurando dados no banco de dados ... encontrado: $receita');
    return toList(receita);
  }

  List<Receita> toList(List<Map<String, dynamic>> listaDeReceitas) {
    print("Convertendo to List: ");
    final List<Receita> receitas = [];
    for (Map<String, dynamic> linha in listaDeReceitas) {
      final Receita receita = Receita(
          nome: linha[_name],
          ingredients: linha[_ingredientes],
          preparation: linha[_preparo],
          imageUrl: linha[_imagem],);
          
      receitas.add(receita);
    }
    print('Lista de receitas: $receitas');
    return receitas;
  }

  Future<List<Receita>> find(String nomeDaReceita) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> receita = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaReceita],
    );
    print('tarefa encotrada: ${toList(receita)}');
    return toList(receita);
  }

  delete(String nomeDaReceita) async {
    print('deletando receita: $nomeDaReceita');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados
        .delete(_tablename, where: '$_name = ?', whereArgs: [nomeDaReceita]);
  }
}
