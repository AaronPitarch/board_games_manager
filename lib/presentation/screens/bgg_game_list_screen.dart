import 'package:board_game_manager/domain/repositories/bgg_game_repository.dart';
import 'package:board_game_manager/infraestructure/datasources/bgg_api_datasources.dart';
import 'package:flutter/material.dart';

class BggGameListScreen extends StatefulWidget {
  const BggGameListScreen({super.key});

  @override
  BggGameListScreenState createState() => BggGameListScreenState();
}

class BggGameListScreenState extends State<BggGameListScreen> {
  List<Map<String, dynamic>> games = [];
  bool isLoading = true;
  String error = '';

  @override
  void initState() {
    super.initState();
    fetchGames();
  }

  Future<void> fetchGames() async {
    //Se crea el datasource y el repositorio
    final datasource = BggApiDatasource();
    final repository = BggGameRepository(datasource);

    try {
      final fetchedGames = await repository.getPopularGames();
      setState(() {
        games = fetchedGames;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = 'Error al cargar los juegos: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Juegos de mesa API'),
      ),
      body: isLoading
        ? const Center(child: CircularProgressIndicator())
        : error.isNotEmpty
          ? Center(child: Text(error))
          : ListView.builder(
            itemCount: games.length,
            itemBuilder: (context, index) {
              final game = games[index];

              // Ajuste para el título, año, rango y miniatura
              final title = game['name']?['@value'] ?? 'Sin título';
              final year = game['yearpublished']?['@value'] ?? 'N/A';
              final rank = game['@rank']?.toString() ?? 'N/A';
              final thumbnail = game['thumbnail']?['@value'];

              return Card(
                margin: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Mostrar la imagen si existe
                      if (thumbnail != null)
                        Image.network(thumbnail),
                      const SizedBox(height: 8),
                      Text(
                        title,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text('Año: $year'),
                      const SizedBox(height: 8),
                      Text('Rango: $rank'),
                    ],
                  ),
                ),
              );
            },
          ),
    );
  }
}