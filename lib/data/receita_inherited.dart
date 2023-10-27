import 'package:flutter/material.dart';
import 'package:receitas/components/receita.dart';


class ReceitaInherited extends InheritedWidget {
  ReceitaInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Receita> receitaList = [
    Receita(nome: 'Arroz', ingredients: 'Arroz, alho, cebola', preparation: '20 min no fogo', imageUrl: 'https://www.receitasnestle.com.br/sites/default/files/styles/recipe_detail_desktop/public/srh_recipes/7c44045d2e8577819cb76b2b404902dd.jpg?itok=KzeGh6J4'),
    Receita(nome: 'Macarronada', ingredients: 'Macarrao, bancon, calabresa', preparation: 'mexe tudo e ok', imageUrl: 'https://www.sabornamesa.com.br/media/k2/items/cache/b5b56b2ae93d3dc958cf0c21c9383b18_XL.jpg'),
  ];

  void newTask(String name, String ingredients,String preparation, String photo){
    receitaList.add(Receita(nome: name, ingredients: ingredients, preparation: preparation, imageUrl: photo));
  }

  static ReceitaInherited of(BuildContext context) {
    final ReceitaInherited? result =
        context.dependOnInheritedWidgetOfExactType<ReceitaInherited>();
    assert(result != null, 'No ReceitaInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ReceitaInherited oldWidget) {
    return oldWidget.receitaList.length != receitaList.length;
  }
}