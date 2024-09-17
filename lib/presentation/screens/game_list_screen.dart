import 'package:flutter/material.dart';

class GameListScreen extends StatelessWidget {
  const GameListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> games = [
      {
        'title': 'Catan',
        'description': 'Juego de estrategia y comercio',
        'players': '3-4 jugadores',
        'theme': 'Estrategia'
      },
      {
        'title': 'Carcassonne',
        'description': 'Construcción de ciudades medievales',
        'players': '2-5 jugadores',
        'theme': 'Construcción'
      },
      {
        'title': 'Pandemic',
        'description': 'Juego cooperativo contra enfermedades',
        'players': '2-4 jugadores',
        'theme': 'Cooperativo'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Juegos'),
      ),
      body: ListView.builder(
        itemCount: games.length,
        itemBuilder: (context, index) {
          final game = games[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    game['title']!,
                    style: const TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(game['description']!),
                  const SizedBox(height: 8),
                  Text('Jugadores: ${game['players']}'),
                  const SizedBox(height: 8),
                  Text('Tema: ${game['theme']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}