import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfissionaisPage extends StatefulWidget {
  const ProfissionaisPage({super.key});

  @override
  State<ProfissionaisPage> createState() => _ProfissionaisPageState();
}

class _ProfissionaisPageState extends State<ProfissionaisPage> {
  // Função para obter os profissionais do Firebase
  Stream<QuerySnapshot> getProfissionaisStream() {
    return FirebaseFirestore.instance.collection('colaboradores').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profissionais',
        style: TextStyle(color: Colors.white), // Cor do texto do título
        ),
        backgroundColor: const Color.fromARGB(255, 73, 114, 133),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      //backgroundColor: const Color.fromARGB(255, 73, 114, 133),
      body: StreamBuilder<QuerySnapshot>(
        stream: getProfissionaisStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'Nenhum profissional encontrado',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }

          // Exibir a lista de profissionais
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: snapshot.data!.docs.map((doc) {
              // Extrair o nome do profissional
              String nome = doc['nome'];

              return Card(
                color: Colors.grey[200],
                child: ListTile(
                  leading: const Icon(Icons.person, color: Colors.grey),
                  title: Text(
                    nome,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
