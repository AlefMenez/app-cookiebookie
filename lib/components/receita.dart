import 'package:flutter/material.dart';

class Receita extends StatefulWidget {
  final String nome;
  final String ingredients;
  final String preparation;
  final String? imageUrl;

  Receita(
      {Key? key,
      required this.nome,
      required this.ingredients,
      required this.preparation,
      this.imageUrl})
      : super(key: key);

  @override
  State<Receita> createState() => _ReceitaState();
}

class _ReceitaState extends State<Receita> {
  bool assetOrNetwork() {
    if (widget.imageUrl!.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
