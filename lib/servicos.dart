import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ServicosPage extends StatefulWidget {
  const ServicosPage({super.key});

  @override
  State<ServicosPage> createState() => _ServicosPageState();
}

class _ServicosPageState extends State<ServicosPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 73, 114, 133),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 114, 133),
        title: const Text('Serviços Disponíveis',
        style: TextStyle(color: Colors.white), // Cor do texto do título
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: _firestore.collection('servicos').get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar os serviços'));
          }

          final services = snapshot.data!.docs;

          if (services.isEmpty) {
            return const Center(child: Text('Nenhum serviço disponível'));
          }

          return ListView.builder(
            itemCount: services.length,
            itemBuilder: (context, index) {
              final service = services[index];
              final nome = service['nome'];
              final valor = service['valor'];
              final duracao = service['duracao'];

              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(nome),
                  subtitle: Text('Valor: R\$ $valor\nDuração: $duracao min'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
