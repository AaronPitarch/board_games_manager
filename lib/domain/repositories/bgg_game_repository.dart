import 'package:board_game_manager/infraestructure/datasources/bgg_api_datasources.dart';

class BggGameRepository {
  final BggApiDatasource _datasource;

  BggGameRepository(this._datasource);

  Future<List<Map<String, dynamic>>> getPopularGames() async {
    return await _datasource.fetchHotGames();
  }
}