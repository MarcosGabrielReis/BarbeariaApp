import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AgendarLocaisPage extends StatefulWidget {
  const AgendarLocaisPage({super.key});

  @override
  State<AgendarLocaisPage> createState() => _AgendarLocaisPageState();
}

class _AgendarLocaisPageState extends State<AgendarLocaisPage> {
  String? selectedLocal;

  // Função para obter os locais do Firebase
  Stream<QuerySnapshot> getLocaisStream() {
    return FirebaseFirestore.instance.collection('enderecos_barbearia').snapshots();
  }

  // Função para selecionar o local e avançar para a próxima página
  void selecionarLocal(String local) {
    setState(() {
      selectedLocal = local;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 114, 133),
        title: const Text('Escolha o Local'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getLocaisStream(), // Ouve as atualizações na coleção 'enderecos_barbearia'
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Nenhum local encontrado.'));
          }

          return Column(
            children: [
              // Lista de locais
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: snapshot.data!.docs.map((doc) {
                    // Extrair informações do local
                    String rua = doc['rua'];
                    String bairro = doc['bairro'];
                    String cidade = doc['cidade'];
                    String estado = doc['estado'];

                    String local = '$rua, $bairro, $cidade, $estado';

                    return Card(
                      color: Colors.grey[200],
                      child: ListTile(
                        title: Text(local),
                        onTap: () => selecionarLocal(local),
                        tileColor: selectedLocal == local ? Colors.blueAccent : null,
                      ),
                    );
                  }).toList(),
                ),
              ),
              // Exibir o local selecionado
              if (selectedLocal != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Local selecionado: $selectedLocal',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              // Botão para avançar para a próxima página
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: selectedLocal == null
                      ? null
                      : () {
                          // Navegar para a próxima tela de agendamento
                          // Exemplo: Navigator.push(context, MaterialPageRoute(builder: (_) => AgendarServicosPage()));
                        },
                  style: ButtonStyle(
                    // ignore: deprecated_member_use
                    backgroundColor: MaterialStateProperty.all<Color>(
                      selectedLocal == null ? Colors.grey : const Color.fromARGB(255, 73, 114, 133),
                    ),
                  ),
                  child: const Text('Próximo'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
