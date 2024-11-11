import 'package:barbearia_app/agendar_locais.dart';
import 'package:barbearia_app/profissionais.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'servicos.dart';
import 'local.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final user = FirebaseAuth.instance.currentUser!;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 73, 114, 133),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 114, 133),
        elevation: 0,
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 73, 114, 133),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 73, 114, 133),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/UniSenaiBarbearia.png',
                      height: 120,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.white),
                title: const Text(
                  'Dados Pessoais',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline, color: Colors.white),
                title: const Text(
                  'Quem Somos',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.support_agent, color: Colors.white),
                title: const Text(
                  'Suporte',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text(
                  'Sair',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/UniSenaiBarbearia.png',
              height: 240,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AgendarLocaisPage()),
                    );
                },
                child: const Text(
                  'Agendar',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ServicosPage()),
                  );
                },
                child: const Text(
                  'Serviços',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfissionaisPage())
                    );
                },
                child: const Text(
                  'Profissionais',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Meus Agendamentos',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LocalPage()),
                );
                },
                child: const Text(
                  'Endereço',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        ),
        
      ),
    );
  }
}
