import 'package:animeapp_server/src/generated/anime.dart';
import 'package:serverpod/serverpod.dart';

class AnimeEndpoint extends Endpoint {
  Future<List<Anime>> list(Session session) async {
    return Anime.db.find(session);
  }

  Future<Anime?> retrieve(Session session, int id) async {
    return Anime.db.findById(session, id);
  }

  Future<Anime> create(Session session, Anime anime) async {
    return await Anime.db.insertRow(session, anime);
  }
}
