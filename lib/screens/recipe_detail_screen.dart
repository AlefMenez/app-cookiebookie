import 'package:flutter/material.dart';
import 'package:receitas/components/receita.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Receita receita;

  RecipeDetailScreen({required this.receita});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Detalhes da Receita'),
            TextButton(onPressed: () {
              
            }, child: Icon(Icons.edit, color: Colors.black,))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nome',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              receita.nome ?? '',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Ingredientes',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              receita.ingredients ?? '',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Modo de Preparo',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8),
            Text(
              receita.preparation ?? '',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Imagem',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8),
            Center(
              child: CircleAvatar(
                radius: 75,
                backgroundColor: Colors.grey[200],
                child: CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.grey[300],
                  backgroundImage:
                      receita.imageFile != null ? FileImage(receita.imageFile!) : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
