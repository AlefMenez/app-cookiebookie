import 'package:flutter/material.dart';
import 'package:receitas/components/receita.dart';
import 'package:receitas/data/database.dart';

import 'package:receitas/data/receitas_dao.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 122, 107),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'CookieBookie',
                  style: TextStyle(
                      fontFamily: 'Playfair',
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 8,
                ),
                Icon(
                  Icons.food_bank_outlined,
                  color: Colors.white,
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/recipeAddScreen');
                  },
                  child: Container(
                    height: 40,
                    width: 80,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(108, 46, 155, 141),
                        borderRadius: BorderRadius.circular(20)),
                    alignment: Alignment.center,
                    child: Text(
                      'add receita',
                      style: TextStyle(
                          fontFamily: 'Playfair',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: FutureBuilder<List<Receita>>(
          future: ReceitasDao().findAll(),
          builder: (context, snapshot) {
            List<Receita>? receitas = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Column(
                    children: [CircularProgressIndicator(), Text('Carregando')],
                  ),
                );
              case ConnectionState.active:
                return Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando'),
                    ],
                  ),
                );

              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    children: [CircularProgressIndicator(), Text('Carregando')],
                  ),
                );

              case ConnectionState.done:
                if (snapshot.hasData && receitas != null) {
                  if (receitas.isNotEmpty) {
                    return ListView.builder(
                        itemCount: receitas.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Receita receita = receitas[index];
                          return receita;
                        });
                  }
                  return Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 128,
                        ),
                        Text(
                          'Não há nenhuma tarefa',
                          style: TextStyle(fontSize: 32),
                        )
                      ],
                    ),
                  );
                }
                return Text('Erro ao carregar Receita');
            }
            return Text('Erro desconhecido');
          },
        ),
      ),
    );
  }
}
