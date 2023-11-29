import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  double _textSize(BuildContext context, double baseSize) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return (baseSize * deviceWidth) / 300;
  }

  double _buttonWidth(BuildContext context, double baseWidth) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return (baseWidth * deviceWidth) / 300;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: ((context, constraints) {
          return Stack(
            children: [
              Image.asset(
                'assets/img_homescreen.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                fit: BoxFit.cover,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [0.32, 2],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).padding.bottom + 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CookieBookie',
                      style: GoogleFonts.sofia(
                        textStyle: TextStyle(
                          fontSize: _textSize(context, 30),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Guarde suas receitas favoritas e crie seu próprio livro de culinária.',
                      style: GoogleFonts.sofia(
                        textStyle: TextStyle(
                          fontSize: _textSize(context, 15),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, '/homeScreen');
                          },
                          child: Container(
                            height: 50,
                            width: _buttonWidth(context, 100),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 4, 122, 107),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Iniciar',
                              style: GoogleFonts.sofia(
                                textStyle: TextStyle(
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
                  ],
                ),
              ),
            ],
          );
        })),
      ),
    );
  }
}
