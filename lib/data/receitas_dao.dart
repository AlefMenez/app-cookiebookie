import 'package:receitas/data/database.dart';
import 'package:receitas/model/receita.dart';
import 'package:sqflite/sqflite.dart';

class ReceitasDao {
  static const String receitaSql = 'CREATE RECEITA $_receitanome('
      '$_name TEXT, '
      '$_ingredientes TEXT, '
      '$_preparo TEXT, '
      '$_imagem TEXT)';

  static const String _receitanome = 'nomeReceitas';
  static const String _name = 'macarronada';
  static const String _ingredientes = 'macarrao';
  static const String _preparo = '20 min fogo';
  static const String _imagem = '';

  save(Receita receita) async {
    print('Iniciando save: ');
    final Database bancoDeDados = await getDatabase();
    var receitaExists = await find(receita.name);
    Map<String, dynamic> receitasMap = toMap(receita);
    if (receitaExists.isEmpty) {
      print('A receita nao existia');
      return await bancoDeDados.insert(_receitanome, receitasMap);
    } else {
      print('A receita ja existia');
      return await bancoDeDados.update(
        _receitanome,
        receitasMap,
        where: '$_name = ?',
        whereArgs: [
          receita.name,
        ],
      );
    }
  }

  Map<String, dynamic> toMap(Receita receita) {
    print('convertendo receita em map: ');
    final Map<String, dynamic> mapaDeReceitas = Map();
    mapaDeReceitas[_name] = receita.name;
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
        await bancoDeDados.query(_receitanome);
    print('Procurando dados no banco de dados ... encontrado: $receita');
    return toList(receita);
  }

  List<Receita> toList(List<Map<String, dynamic>> listaDeReceitas) {
    print("Convertendo to List: ");
    final List<Receita> receitas = [];
    for (Map<String, dynamic> linha in listaDeReceitas) {
      final Receita receita = Receita(
          name: linha[_name],
          ingredients: linha[_ingredientes],
          preparation: linha[_preparo]);
      receitas.add(receita);
    }
    print('Lista de receitas: $receitas');
    return receitas;
  }

  Future<List<Receita>> find(String nomeDaReceita) async {
    print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> receita = await bancoDeDados.query(
      _receitanome,
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
        .delete(_receitanome, where: '$_name = ?', whereArgs: [nomeDaReceita]);
  }
}