import 'package:flutter/material.dart';

class Receita extends StatefulWidget {
  final String? nome;
  final String? ingredients;
  final String? preparation;
  final String? imageUrl;

  Receita(
      {Key? key, this.nome, this.ingredients, this.preparation, this.imageUrl})
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
    return Padding(
      padding: const EdgeInsets.all(12),
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
              child: assetOrNetwork()
                  ? Image.asset(
                      widget.imageUrl!,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      widget.imageUrl!,
                      fit: BoxFit.cover,
                    )),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                 color: Color.fromARGB(213, 4, 122, 106),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              padding: const EdgeInsets.all(8),
              child: Text(
                widget.nome!,
                style: const TextStyle(
                  color: Colors.white, // Cor do texto
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
