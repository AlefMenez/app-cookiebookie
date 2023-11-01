import 'package:flutter/material.dart';
import 'dart:io';

import 'package:receitas/data/receitas_dao.dart';

class Receita extends StatelessWidget {
  final String? nome;
  final String? ingredients;
  final String? preparation;
  final File? imageFile;

  Receita(
      {Key? key, this.nome, this.ingredients, this.preparation, this.imageFile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: GestureDetector(
        onLongPress: () {
          ReceitasDao().delete(nome!);
          print('removendo receita');
        },
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
                  color: Color.fromARGB(213, 4, 122, 106),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: Text(
                  nome!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
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
}
