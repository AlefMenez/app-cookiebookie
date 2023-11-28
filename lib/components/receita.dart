import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:receitas/data/receitas_dao.dart';

class Receita extends StatelessWidget {
  int? id;
  final String? nome;
  final String? ingredients;
  final String? preparation;
  final File? imageFile;
  final VoidCallback? onPressed;

  Receita({
    Key? key,
    this.nome,
    this.ingredients,
    this.preparation,
    this.imageFile,
    this.onPressed,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onLongPress: () {
          _showDeleteConfirmationDialog(context);
        },
        onTap: onPressed, // Chame a função de callback aqui
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: buildImage(context),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 4, 122, 107),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  nome!,
                   style: GoogleFonts.sofia(
                                textStyle: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            )),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
        
      ),
    );
  }

  Widget buildImage(BuildContext context) {
    if (imageFile != null) {
      return Image.file(
        imageFile!,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        'assets/nophoto.png',
        fit: BoxFit.cover,
      );
    }
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Excluir Receita"),
          content: Text("Tem certeza de que deseja excluir esta receita?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Excluir"),
              onPressed: () {
                ReceitasDao().delete(nome!); // Excluir a receita
                Navigator.of(context).pop(); // Fechar o AlertDialog
                // Voltar para a tela inicial
              },
            ),
          ],
        );
      },
    );
  }
}
