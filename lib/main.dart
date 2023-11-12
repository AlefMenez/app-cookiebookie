import 'package:flutter/material.dart';
import 'package:receitas/data/receita_inherited.dart';
import 'package:receitas/screens/home_screen.dart';
import 'package:receitas/screens/initial_screen.dart';
import 'package:receitas/screens/recipe_add_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Receita',
      theme: ThemeData(
        useMaterial3: true,
      ),
     initialRoute: '/',
     routes: {
      '/' :(context) => const InitialScreen(),
      '/homeScreen' :(context) => ReceitaInherited(child: const HomeScreen()),
      '/recipeAddScreen' :(context) => RecipeAddScreen(receitaContext: context),
      

     },
    );
  }
}

