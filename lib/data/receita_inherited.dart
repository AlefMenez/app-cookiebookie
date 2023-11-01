import 'dart:io';

import 'package:flutter/material.dart';
import 'package:receitas/components/receita.dart';


class ReceitaInherited extends InheritedWidget {
  ReceitaInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Receita> receitaList = [
    Receita(nome: 'Arroz', ingredients: 'Arroz, alho, cebola', preparation: '20 min no fogo', imageFile: File('assets/nophoto.png')),
    Receita(nome: 'Macarronada', ingredients: 'Macarrao, bancon, calabresa', preparation: 'mexe tudo e ok', imageFile: File('assets/nophoto.png'))
  ];

  void newReceita(String name, String ingredients,String preparation, File photo){
    receitaList.add(Receita(nome: name, ingredients: ingredients, preparation: preparation, imageFile: photo));
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