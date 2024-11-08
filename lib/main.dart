import 'package:flutter/material.dart';
import 'login_page.dart';

// Função principal que inicializa o aplicativo Flutter e fornece os widgets que serão as raízes da aplicação.
// Executa o aplicativo e fornece o widget de raiz que será exibido.
void main() {
  runApp(MeuApp());
}

// Classe MeuApp, que é um widget sem estado (StatelessWidget).
// Construtor da classe MeuApp, que aceita uma chave opcional.
class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  // Este método constrói a interface do widget e retorna um widget MaterialApp, que é a estrutura básica do aplicativo.
  // Desativa a faixa de debug que aparece no canto superior direito quando o aplicativo está em modo de verificação (debug).
  // Define a página inicial do aplicativo como LoginPage, onde os usuários irão interagir.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );  
  }
}
