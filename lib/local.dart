import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// ignore: use_key_in_widget_constructors
class LocalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 73, 114, 133),
        title: Text("Mapa Local"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container unificado para o título e o endereço
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueGrey[50], // Cor de fundo suave
                borderRadius: BorderRadius.circular(12), // Borda arredondada
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(2, 2),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título do local
                  Text(
                    'Local:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[800],
                    ),
                  ),
                  SizedBox(height: 8), // Espaçamento entre o título e o endereço

                  // Endereço do local
                  Text(
                    'R. São Paulo, 1147 - Victor Konder, Blumenau - SC, 89012-001',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[800],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // Espaçamento entre o endereço e o mapa

            // Container para o mapa
            Container(
              height: 300, // Tamanho do mapa
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueGrey), // Borda azul clara
                borderRadius: BorderRadius.circular(12), // Borda arredondada
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(2, 2),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(-26.9073, -49.0764),  // Coordenadas corrigidas
                  initialZoom: 15.0,
                  maxZoom: 22.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: '<your-application-package-name>',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(-26.9073, -49.0764), // Coordenadas do local
                        height: 40.0,
                        width: 40.0,
                        child: Icon(
                          Icons.location_on,
                          size: 40.0,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
