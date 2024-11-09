import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Classe LoginPage que representa a página de login, é um widget com estado (StatefulWidget).
// Construtor da classe LoginPage, que aceita uma chave opcional.
// Método que cria o estado para a LoginPage.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// Classe que gerencia o estado da LoginPage.
// Método que constrói a interface do widget.
// Retorna um Scaffold, que é um layout básico para a página.
class _LoginPageState extends State<LoginPage> {
  //Controle dos campos
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  Future entrar() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(), 
      password: _senhaController.text.trim(),
      );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[300],
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          //Usado para não causar divergencia entra os campos e o teclado
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //imagem
              Image.asset(
                'assets/UniSenaiBarbearia.png', // Caminho relativo da imagem
                height: 170, // Defina a altura que preferir
                width: 295, // Defina a largura que preferir
              ),
              //Barbearia Senai!
              Text(
                'Barbearia UniSenai',
                style: GoogleFonts.bebasNeue(
                  fontSize: 52,
                ),
              ),

              SizedBox(height: 7),

              Text(
                'Faça login e cuide do seu visual com a gente!',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              SizedBox(height: 40),

              //email campo de texto
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'E-mail',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),

              SizedBox(height: 10),

              //senha campo de texto
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _senhaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Senha',
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
              ),

              SizedBox(height: 10),

              //entrar botão
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                onTap: entrar,
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 75, 138, 248),
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 25),

              //Ainda não tem conta? Registre-se aqui! Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ainda não tem conta?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ' Registre-se aqui!',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
