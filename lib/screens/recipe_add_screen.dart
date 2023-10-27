
import 'package:flutter/material.dart';

class RecipeAddScreen extends StatefulWidget {
  @override
  State<RecipeAddScreen> createState() => _RecipeAddScreenState();
}

class _RecipeAddScreenState extends State<RecipeAddScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController preparationController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 4, 122, 107),
        title: Text(
          'Adicionar Receita',
          style: TextStyle(
            fontFamily: 'Playfair',
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nome',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'O campo Nome não pode estar vazio';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Ingredientes',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: TextFormField(
                    controller: ingredientsController,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'O campo Ingredientes não pode estar vazio';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Modo de Preparo',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: TextFormField(
                    controller: preparationController,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'O campo Modo de Preparo não pode estar vazio';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Image Url (opcional)',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        
                      });
                    },
                    controller: imageUrlController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                ),
                 Container(
                    height: 100,
                    width: 72,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.blue),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        imageUrlController.text,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset('assets/images/nophoto.png');
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(108, 46, 155, 141),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Salvar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
