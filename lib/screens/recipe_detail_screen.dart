import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:receitas/components/receita.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Receita receita;

  RecipeDetailScreen({required this.receita});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SlidingUpPanel(
        parallaxEnabled: true,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        minHeight: (size.height / 1.8),
        maxHeight: size.height,
        panel: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    receita.nome ?? " ",
                    style: GoogleFonts.sofia(
                        textStyle: const TextStyle(fontSize: 25)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Ingredientes:',
                          style: GoogleFonts.sofia(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(receita.ingredients ?? " ",
                              style: GoogleFonts.sofia(
                                  textStyle: const TextStyle(
                                fontSize: 15,
                              ))),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Modo de preparo:',
                          style: GoogleFonts.sofia(
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            receita.preparation ?? " ",
                            style: GoogleFonts.sofia(
                                textStyle: const TextStyle(
                              fontSize: 15,
                            )),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            color: Color.fromARGB(127, 4, 122, 106),
            height: size.height / 2,
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(Icons.arrow_back, color: Colors.white,)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 95,
                          backgroundColor: Colors.grey[200],
                          child: CircleAvatar(
                            radius: 90,
                            backgroundColor:
                                const Color.fromARGB(255, 12, 5, 5),
                            backgroundImage: receita.imageFile != null
                                ? FileImage(receita.imageFile!)
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
