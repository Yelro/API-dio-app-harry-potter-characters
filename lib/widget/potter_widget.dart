import 'package:dio_app/models/potter.dart';
import 'package:flutter/material.dart';

class PotterWidget extends StatelessWidget {
  final Potter potter;
  const PotterWidget({super.key, required this.potter});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Text(
            potter.actor,
            style: const TextStyle(color: Colors.deepOrangeAccent),
          ),
          Text('Year of birth: ${potter.yearOfBirth.toString()}'),
           Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(38),
                border: Border.all(color: Colors.deepOrangeAccent, width: 5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(34), // Ajustar para que el borde se ajuste mejor al borde redondeado del contenedor
                child: Image.network(
                  potter.image,
                  width: 120, 
                  height: 200,
                  fit: BoxFit.cover, // Ajustar la imagen para que cubra todo el área del contenedor
                ),
              ),
            ),
          ),
          Text(potter.name, style: const TextStyle(color: Color.fromARGB(255, 26, 116, 149)),),
          Text('Guardian spirit: ${potter.patronus.name}'),
          Text('Ancestry: ${potter.ancestry.name}'),
          
        ],
      ),
    );
  }
}