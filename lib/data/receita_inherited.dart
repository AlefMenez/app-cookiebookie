import 'package:flutter/material.dart';
import 'package:receitas/model/receita.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  final List<Receita> receitaList = [
    
  ];

  void newTask(String name, String ingredients,String preparation, String photo){
    receitaList.add(Receita(name: name, ingredients: ingredients, preparation: preparation, imageUrl: photo));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.receitaList.length != receitaList.length;
  }
}