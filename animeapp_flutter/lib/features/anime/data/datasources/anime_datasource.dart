import 'package:animeapp_client/animeapp_client.dart';
import 'package:animeapp_flutter/core/exception/exception.dart';

abstract interface class AnimeDatasource {
  Future<List<Anime>> list();
  Future<Anime> retrieve(int id);
}

class AnimeDatasourceImp implements AnimeDatasource {
  final Client client;
  AnimeDatasourceImp(this.client);
  // final SessionManager sessionManager;
  @override
  Future<List<Anime>> list() async {
    try {
      return await client.anime.list();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Anime> retrieve(int id) async {
    try {
      final result = await client.anime.retrieve(id);
      if (result == null) {
        throw ServerException("Anime not found");
      }
      return result;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
