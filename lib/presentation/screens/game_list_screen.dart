import 'package:flutter/material.dart';

class GameListScreen extends StatefulWidget {
  const GameListScreen({super.key});

  @override
  GameListScreenState createState() => GameListScreenState();
}

class GameListScreenState extends State<GameListScreen> {
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

  //Lista de juegos filtrados
  List<Map<String, String>> filteredGames = [];

  @override
  void initState() {
    super.initState();
    //Inicialmente, todos los juegos están en la lista filtrada
    filteredGames = games;
  }

  void filterGames(String query) {
    final filtered = games.where((game) {
      final titleLower = game['title']!.toLowerCase();
      final searchLower = query.toLowerCase();
      return titleLower.contains(searchLower);
    }).toList();

    setState(() {
      filteredGames = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juegos de Mesa'),
      ),
      body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Buscar juegos',
              border: OutlineInputBorder(),
            ),
            onChanged: (query) {
              filterGames(query); //Filtrar los juegos según la búsqueda
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: filteredGames.length,
            itemBuilder: (context, index) {
              final game = filteredGames[index];
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
                          fontWeight: FontWeight.bold,
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
        ),
      ],
    ),
    );
  }
}