import 'package:flutter/material.dart';

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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent[300],
      body:SafeArea(
        child:Center (
          child:Column(
            children: [
            SizedBox(height: 25),
            //Barbearia Senai!
            Text('Barbearia Senai',
            style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24),
              ),
            SizedBox(height: 10),
            Text('Faça login e cuide do seu visual com a gente!',
            style: TextStyle(
              fontSize: 20),
              ),
            //email campo de texto

            //senha campo de texto

            //entrar botão

            //Ainda não tem conta? Registre-se aqui! Link
            ],
          
          ),
        )
          
      ),
      
    );
  }
}
