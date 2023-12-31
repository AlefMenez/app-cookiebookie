import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receitas/components/receita.dart';
import 'package:receitas/data/receitas_dao.dart';
import 'package:receitas/screens/recipe_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _textSize(BuildContext context, double baseSize) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return (baseSize * deviceWidth) / 250;
  }

  double _iconSize(BuildContext context, double baseSize) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return (baseSize * deviceWidth) / 250;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 4, 122, 107),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/recipeAddScreen')
              .then((value) => setState(() {}));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: _iconSize(context, 20),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(
              Icons.refresh,
              color: Color.fromARGB(255, 4, 122, 107),
              size: _iconSize(context, 20), // Tamanho responsivo do ícone
            ),
          )
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'CookieBookie',
                  style: GoogleFonts.sofia(
                    textStyle: TextStyle(
                      fontSize: _textSize(context, 15), // Tamanho responsivo do texto
                      color: Color.fromARGB(255, 4, 122, 107),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.food_bank_outlined,
                  color: Color.fromARGB(255, 4, 122, 107),
                  size: _iconSize(context, 24), // Tamanho responsivo do ícone
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: FutureBuilder<List<Receita>>(
            future: ReceitasDao().findAll(),
            builder: (context, snapshot) {
              List<Receita>? receitas = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Carregando'),
                      ],
                    ),
                  );
      
                case ConnectionState.done:
                  if (snapshot.hasData && receitas != null) {
                    if (receitas.isNotEmpty) {
                      return ListView.builder(
                        itemCount: receitas.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Receita receita = receitas[index];
                          return Receita(
                            nome: receita.nome,
                            ingredients: receita.ingredients,
                            preparation: receita.preparation,
                            imageFile: receita.imageFile,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      RecipeDetailScreen(receita: receita),
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                    return Center(
                      child: Column(
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 128,
                          ),
                          Text(
                            'Não há nenhuma receita',
                            style: TextStyle(fontSize: 32),
                          ),
                        ],
                      ),
                    );
                  }
                  return Text('Erro ao carregar Receitas');
              }
            },
          ),
        ),
      ),
    );
  }
}
