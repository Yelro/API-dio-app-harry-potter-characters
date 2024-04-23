import 'package:dio_app/api/potter_api.dart';
import 'package:dio_app/helpers/http_response.dart';
import 'package:dio_app/models/potter.dart';
import 'package:dio_app/models/potters_response.dart';
import 'package:dio_app/widget/potter_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PottersScreen extends StatefulWidget {
  const PottersScreen({super.key});

  @override
  State<PottersScreen> createState() => _PottersScreenState();
}

class _PottersScreenState extends State<PottersScreen> {
  // Inyección de dependencias con GetIt
  final PotterAPI potterAPI = GetIt.instance<PotterAPI>();

  // Función para cargar los personajes de Harry Potter
  Future<List<Potter>> loadPotters() async {
    HttpResponse<PottersResponse> response = await potterAPI.getAllPotters();
    // Filtrar los personajes con imágenes no vacías
    return response.data!.potters.where((potter) => potter.image.isNotEmpty).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fake Store API"),
        foregroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 115, 61, 66),
      ),
      backgroundColor: Color.fromARGB(255, 183, 155, 119),
      body: FutureBuilder<List<Potter>>(
        future: loadPotters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Potter potter = snapshot.data![index];
              return PotterWidget(potter: potter);
            },
          );
        },
      ),
    );
  }
}
