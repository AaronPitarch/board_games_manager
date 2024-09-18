import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class BggApiDatasource {
  final String _baseUrl = 'https://www.boardgamegeek.com/xmlapi2/hot?type=boardgame';

  Future<List<Map<String, dynamic>>> fetchHotGames() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final xml2json = Xml2Json();
      xml2json.parse(response.body);
      final jsonStr = xml2json.toBadgerfish();

      print('JSON generado por Badgerfish: $jsonStr');

      final data = json.decode(jsonStr);
          print('Data decodificada: $data');  // Imprimir la data ya convertida a JSON
      final games = data['items']['item'] as List;

      return games.map((game) {
        print('Juego procesado: $game');
        return {
          'title': game['name']['\$t'],
          'year': game['yearpublished'] != null ? game['yearpublished']['\$t'] : 'N/A',
          'rank': game['rank'] != null ? game['rank']['\$t'] : 'N/A',
        };
      }).toList();
    } else {
      throw Exception('Error al obtener los juegos');
    }
  }
}