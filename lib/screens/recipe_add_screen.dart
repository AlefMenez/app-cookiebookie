import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:receitas/components/receita.dart';
import 'package:receitas/data/receitas_dao.dart';

class RecipeAddScreen extends StatefulWidget {
  final BuildContext receitaContext;

  const RecipeAddScreen({Key? key, required this.receitaContext})
      : super(key: key);

  @override
  State<RecipeAddScreen> createState() => _RecipeAddScreenState();
}

class _RecipeAddScreenState extends State<RecipeAddScreen> {
  final imagePicker = ImagePicker();
  File? imageFile;

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ingredientsController = TextEditingController();
  TextEditingController preparationController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  double _textSize(BuildContext context, double baseSize) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return (baseSize * deviceWidth) / 350;
  }

  double _buttonWidth(BuildContext context, double baseWidth) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return (baseWidth * deviceWidth) / 350;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 4, 122, 107),
        title: Text(
          'Adicionar Receita',
          style: GoogleFonts.sofia(
            textStyle: TextStyle(
              fontSize: _textSize(context, 17),
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome',
                    style: GoogleFonts.sofia(
                      textStyle: TextStyle(
                        fontSize: _textSize(context, 15),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: _textSize(context, 45),
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
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
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
                    style: GoogleFonts.sofia(
                      textStyle: TextStyle(
                        fontSize: _textSize(context, 15),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: _textSize(context, 60),
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
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
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
                    style: GoogleFonts.sofia(
                      textStyle: TextStyle(
                        fontSize: _textSize(context, 15),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: _textSize(context, 150),
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
                          left: 10,
                          right: 10,
                          top: 5,
                          bottom: 5,
                        ),
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
                    'Imagem',
                    style: GoogleFonts.sofia(
                      textStyle: TextStyle(
                        fontSize: _textSize(context, 15),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: _textSize(context, 75),
                        backgroundColor: Colors.grey[200],
                        child: CircleAvatar(
                          radius: _textSize(context, 65),
                          backgroundColor: Colors.grey[300],
                          backgroundImage:
                              imageFile != null ? FileImage(imageFile!) : null,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          pick(ImageSource.camera);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: _textSize(context, 135),
                          height: _textSize(context, 40),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 4, 122, 107),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                              Text(
                                "Tirar foto",
                                style: TextStyle(
                                  fontSize: _textSize(context, 10),
                                  color: Colors.white,
                                  fontFamily: 'Playfair',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          pick(ImageSource.gallery);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: _textSize(context, 135),
                          height: _textSize(context, 40),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.filter,
                                color: Color.fromARGB(255, 4, 122, 107),
                              ),
                              Text(
                                "Selecionar da galeria",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 4, 122, 107),
                                  fontSize: _textSize(context, 10),
                                  fontFamily: 'Playfair',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          ReceitasDao().save(Receita(
                            nome: nameController.text,
                            imageFile: imageFile,
                            ingredients: ingredientsController.text,
                            preparation: preparationController.text,
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Criando nova Receita',
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        width: _buttonWidth(context, 150),
                        height: _textSize(context, 50),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(185, 46, 155, 141),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Salvar',
                          style: TextStyle(
                            fontSize: _textSize(context, 17),
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
      ),
    );
  }

  pick(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      setState(() {
        imageFile = file;
      });
    }
  }
}
