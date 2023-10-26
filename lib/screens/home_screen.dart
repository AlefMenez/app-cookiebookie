import 'package:flutter/material.dart';
import 'package:receitas/data/receitas_dao.dart';
import 'package:receitas/model/receita.dart';

class HomeScreen extends StatefulWidget {
  final Receita? newRecipe;
  const HomeScreen({super.key, this.newRecipe});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
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
        padding: EdgeInsets.only(top: 8, bottom: 50),
        child: FutureBuilder<List<Receita>>(
          future: ReceitasDao().findAll(),
          builder: (context, snapshot) {
            List<Receita>? itens = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
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
                    children: const [
                      CircularProgressIndicator(),
                      Text('Carregando'),
                    ],
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
              case ConnectionState.done:
                if (snapshot.hasData && itens != null) {
                  if (itens.isNotEmpty) {
                    return ListView.builder(
                        itemCount: itens.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Receita receitas = itens[index];
                          return receitas;
                        });
                  }
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // não implementado em vídeo por descuido meu, desculpem.
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // essa linha de layout deixa o conteudo totalmente centralizado.
                    children: const [
                      Icon(
                        Icons.error_outline,
                        size: 128,
                      ),
                      Text(
                        'Não há nenhuma Tarefa',
                        style: TextStyle(fontSize: 32),
                      ),
                    ],
                  ));
                }
                return const Text('Erro ao carregar tarefas');
            }
          },
        ),
      ),
    );
  }
}
